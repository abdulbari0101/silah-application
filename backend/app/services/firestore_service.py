from __future__ import annotations

from typing import Iterable

from firebase_admin import auth, firestore, messaging

from ..firebase import firestore_client, init_firebase, messaging_client
from ..utils.firebase_logger import (
    log_firestore_error,
    log_firestore_request,
    log_firestore_response,
)
from ..utils.time import utc_now_iso

DEFAULT_SPECIALIZATIONS = [
    "Criminal Law",
    "Corporate Law",
    "Intellectual Property",
    "Family Law",
    "Real Estate Law",
]


def get_active_specializations(db: firestore.Client | None = None) -> list[dict]:
    db = db or firestore_client()
    log_firestore_request("specializations.query", filters={"active": True})
    try:
        docs = db.collection("specializations").where("active", "==", True).stream()
        items = []
        for doc in docs:
            if not doc.exists:
                continue
            data = doc.to_dict() or {}
            data["id"] = doc.id
            items.append(data)
        log_firestore_response("specializations.query", count=len(items))
    except Exception as exc:
        log_firestore_error("specializations.query", exc)
        raise
    return items


def get_specialization_names(db: firestore.Client | None = None) -> list[str]:
    items = get_active_specializations(db)
    if not items:
        return DEFAULT_SPECIALIZATIONS
    names = []
    for item in items:
        name_en = item.get("nameEn")
        name_ar = item.get("nameAr")
        if name_en:
            names.append(str(name_en))
        if name_ar and str(name_ar) not in names:
            names.append(str(name_ar))
    return names or DEFAULT_SPECIALIZATIONS


def find_verified_lawyers(
    specialization: str,
    city: str | None = None,
    availability: str | None = None,
    db: firestore.Client | None = None,
) -> list[str]:
    db = db or firestore_client()
    base_query = db.collection("lawyers").where("verified", "==", True)
    if availability:
        base_query = base_query.where("availability", "==", availability)

    lawyer_ids: set[str] = set()

    queries = []
    if city:
        queries.append(base_query.where("cityId", "==", city))
        queries.append(base_query.where("city", "==", city))
    else:
        queries.append(base_query)

    log_firestore_request(
        "lawyers.query",
        specialization=specialization,
        city=city,
        availability=availability,
    )
    if specialization and specialization != "unknown":
        specialization = specialization.strip()
        if specialization:
            for query in queries:
                _query_lawyers_by_specialization(query, specialization, lawyer_ids)

            if not lawyer_ids:
                for name in _resolve_specialization_names(specialization, db):
                    for query in queries:
                        _query_lawyers_by_specialization(
                            query,
                            name,
                            lawyer_ids,
                            fields=("legalFields",),
                        )

    log_firestore_response("lawyers.query", count=len(lawyer_ids))
    return sorted(lawyer_ids)


def _query_lawyers_by_specialization(
    query: firestore.Query,
    specialization: str,
    lawyer_ids: set[str],
    fields: tuple[str, ...] = ("legalFieldIds", "legalFields"),
) -> None:
    for field in fields:
        try:
            docs = query.where(field, "array_contains", specialization).stream()
            for doc in docs:
                lawyer_ids.add(doc.id)
        except Exception as exc:
            log_firestore_error(f"lawyers.query.{field}", exc)


def _resolve_specialization_names(
    specialization_id: str,
    db: firestore.Client,
) -> list[str]:
    try:
        doc = db.collection("specializations").document(specialization_id).get()
        if not doc.exists:
            return []
        data = doc.to_dict() or {}
        names = []
        name_en = str(data.get("nameEn") or "").strip()
        name_ar = str(data.get("nameAr") or "").strip()
        if name_en:
            names.append(name_en)
        if name_ar and name_ar not in names:
            names.append(name_ar)
        return names
    except Exception:
        return []


def set_user_verified(uid: str, verified: bool) -> None:
    init_firebase()
    user = auth.get_user(uid)
    claims = user.custom_claims or {}
    claims["verified"] = verified
    auth.set_custom_user_claims(uid, claims)


def set_user_role(uid: str, role: str) -> None:
    init_firebase()
    user = auth.get_user(uid)
    claims = user.custom_claims or {}
    claims["role"] = role
    auth.set_custom_user_claims(uid, claims)


def create_notification(
    user_uid: str,
    title: str,
    message: str,
    data: dict | None = None,
    fcm_token: str | None = None,
    fcm_tokens: Iterable[str] | None = None,
    send_push: bool = True,
    db: firestore.Client | None = None,
) -> None:
    db = db or firestore_client()
    notification = {
        "type": data.get("type") if data else "system",
        "title": title,
        "message": message,
        "data": data or {},
        "isSeen": False,
        "timestamp": utc_now_iso(),
    }
    log_firestore_request(
        "notifications.create",
        user_uid=user_uid,
        notification=notification,
    )
    try:
        ref = db.collection("notifications").document(user_uid).collection("items").document()
        ref.set(notification)
        log_firestore_response("notifications.create", doc_id=ref.id)
    except Exception as exc:
        log_firestore_error("notifications.create", exc, user_uid=user_uid)
        raise

    if not send_push:
        return

    tokens = _merge_tokens(
        fcm_token=fcm_token,
        fcm_tokens=fcm_tokens,
        user_uid=user_uid,
        db=db,
    )
    if not tokens:
        return

    try:
        _send_push(tokens=tokens, title=title, message=message, data=data)
    except Exception:
        # avoid failing core flow if push send fails
        pass


def _merge_tokens(
    *,
    fcm_token: str | None,
    fcm_tokens: Iterable[str] | None,
    user_uid: str,
    db: firestore.Client,
) -> list[str]:
    tokens: list[str] = []
    if fcm_token:
        tokens.append(str(fcm_token))
    if fcm_tokens:
        tokens.extend([str(token) for token in fcm_tokens if token])

    if tokens:
        return _dedupe_tokens(tokens)

    user_doc = db.collection("users").document(user_uid).get()
    if user_doc.exists:
        tokens.extend(_extract_tokens(user_doc.to_dict() or {}))

    lawyer_doc = db.collection("lawyers").document(user_uid).get()
    if lawyer_doc.exists:
        tokens.extend(_extract_tokens(lawyer_doc.to_dict() or {}))

    return _dedupe_tokens(tokens)


def _extract_tokens(data: dict) -> list[str]:
    tokens: list[str] = []
    token = data.get("fcmToken") or data.get("deviceToken")
    if token:
        tokens.append(str(token))
    list_token = data.get("fcmTokens")
    if isinstance(list_token, list):
        tokens.extend([str(item) for item in list_token if item])
    return tokens


def _dedupe_tokens(tokens: list[str]) -> list[str]:
    seen = set()
    unique: list[str] = []
    for token in tokens:
        token = token.strip()
        if not token or token in seen:
            continue
        seen.add(token)
        unique.append(token)
    return unique


def _send_push(tokens: list[str], title: str, message: str, data: dict | None) -> None:
    init_firebase()
    client = messaging_client()

    payload_data = {str(k): str(v) for k, v in (data or {}).items()}
    if len(tokens) == 1:
        msg = messaging.Message(
            token=tokens[0],
            notification=messaging.Notification(title=title, body=message),
            data=payload_data,
        )
        client.send(msg)
        return

    multicast = messaging.MulticastMessage(
        tokens=tokens,
        notification=messaging.Notification(title=title, body=message),
        data=payload_data,
    )
    client.send_multicast(multicast)


def create_admin_task(
    task_type: str,
    target_id: str,
    notes: str | None = None,
    db: firestore.Client | None = None,
) -> str:
    db = db or firestore_client()
    payload = {
        "type": task_type,
        "targetId": target_id,
        "status": "pending",
        "notes": notes,
        "createdAt": utc_now_iso(),
    }
    log_firestore_request("admin_tasks.create", payload=payload)
    try:
        ref = db.collection("admin_tasks").document()
        ref.set(payload)
        log_firestore_response("admin_tasks.create", doc_id=ref.id)
    except Exception as exc:
        log_firestore_error("admin_tasks.create", exc)
        raise
    return ref.id


def save_device_token(
    user_uid: str,
    device_token: str,
    role: str | None = None,
    platform: str | None = None,
    db: firestore.Client | None = None,
) -> None:
    db = db or firestore_client()
    payload = {
        "deviceToken": device_token,
        "deviceTokens": firestore.ArrayUnion([device_token]),
        "fcmToken": device_token,
        "fcmTokens": firestore.ArrayUnion([device_token]),
        "deviceTokenUpdatedAt": utc_now_iso(),
    }
    if platform:
        payload["devicePlatform"] = platform

    log_firestore_request(
        "device_tokens.save",
        user_uid=user_uid,
        role=role,
        platform=platform,
        payload=payload,
    )

    if role == "lawyer":
        try:
            db.collection("lawyers").document(user_uid).set(payload, merge=True)
            log_firestore_response("device_tokens.save", collection="lawyers", user_uid=user_uid)
        except Exception as exc:
            log_firestore_error("device_tokens.save", exc, collection="lawyers", user_uid=user_uid)
            raise
        return
    if role in {"user", "admin"}:
        try:
            db.collection("users").document(user_uid).set(payload, merge=True)
            log_firestore_response("device_tokens.save", collection="users", user_uid=user_uid)
        except Exception as exc:
            log_firestore_error("device_tokens.save", exc, collection="users", user_uid=user_uid)
            raise
        return

    user_doc = db.collection("users").document(user_uid).get()
    if user_doc.exists:
        try:
            db.collection("users").document(user_uid).set(payload, merge=True)
            log_firestore_response("device_tokens.save", collection="users", user_uid=user_uid)
        except Exception as exc:
            log_firestore_error("device_tokens.save", exc, collection="users", user_uid=user_uid)
            raise
        return

    lawyer_doc = db.collection("lawyers").document(user_uid).get()
    if lawyer_doc.exists:
        try:
            db.collection("lawyers").document(user_uid).set(payload, merge=True)
            log_firestore_response("device_tokens.save", collection="lawyers", user_uid=user_uid)
        except Exception as exc:
            log_firestore_error("device_tokens.save", exc, collection="lawyers", user_uid=user_uid)
            raise
        return

    try:
        db.collection("users").document(user_uid).set(payload, merge=True)
        log_firestore_response("device_tokens.save", collection="users", user_uid=user_uid)
    except Exception as exc:
        log_firestore_error("device_tokens.save", exc, collection="users", user_uid=user_uid)
        raise
