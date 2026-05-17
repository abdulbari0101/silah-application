from __future__ import annotations

from typing import Any, Iterable

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


def find_verified_lawyer_profiles(
    specialization: str,
    city: str | None = None,
    availability: str | None = None,
    db: firestore.Client | None = None,
) -> list[dict[str, Any]]:
    db = db or firestore_client()
    base_query = db.collection("lawyers").where("verified", "==", True)
    if availability:
        base_query = base_query.where("availability", "==", availability)

    lawyers: dict[str, dict[str, Any]] = {}

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
                _query_lawyers_by_specialization(query, specialization, lawyers)

            if not lawyers:
                for name in _resolve_specialization_names(specialization, db):
                    for query in queries:
                        _query_lawyers_by_specialization(
                            query,
                            name,
                            lawyers,
                            fields=("legalFields",),
                        )

    log_firestore_response("lawyers.query", count=len(lawyers))
    return sorted(
        lawyers.values(),
        key=lambda item: (
            str(item.get("fullName") or "").strip().lower(),
            str(item.get("id") or "").strip().lower(),
        ),
    )


def _query_lawyers_by_specialization(
    query: firestore.Query,
    specialization: str,
    lawyers: dict[str, dict[str, Any]],
    fields: tuple[str, ...] = ("legalFieldIds", "legalFields"),
) -> None:
    for field in fields:
        try:
            docs = query.where(field, "array_contains", specialization).stream()
            for doc in docs:
                lawyers[doc.id] = _serialize_lawyer_profile(doc)
        except Exception as exc:
            log_firestore_error(f"lawyers.query.{field}", exc)


def _serialize_lawyer_profile(
    doc: firestore.DocumentSnapshot,
) -> dict[str, Any]:
    data = doc.to_dict() or {}
    legal_field_ids = _parse_string_list(data.get("legalFieldIds"))
    legal_fields = _parse_string_list(data.get("legalFields"))
    city_id = str(data.get("cityId") or "").strip() or None
    city_name = str(data.get("city") or "").strip() or None
    work_destination_id = str(data.get("workDestinationId") or "").strip() or None
    workplace_name = str(data.get("workplace") or "").strip() or None

    return {
        "id": doc.id,
        "fullName": str(data.get("name") or data.get("fullName") or "").strip() or None,
        "licenseNumber": str(data.get("licenseNumber") or "").strip() or None,
        "legalFields": legal_fields,
        "legalFieldIds": legal_field_ids,
        "city": city_name or city_id,
        "cityId": city_id,
        "countryId": str(data.get("countryId") or "").strip() or None,
        "workplace": workplace_name or work_destination_id,
        "workDestinationId": work_destination_id,
        "yearsOfExperience": _parse_int(
            data.get("experienceYears"),
        ) or _parse_int(data.get("yearsOfExperience")),
        "avatarUrl": str(data.get("avatarUrl") or "").strip() or None,
        "acceptsTrainees": bool(data.get("acceptsTrainees") or False),
        "availability": str(data.get("availability") or "available").strip() or "available",
    }


def _parse_string_list(value: Any) -> list[str]:
    if isinstance(value, list):
        return [str(item).strip() for item in value if str(item).strip()]
    if isinstance(value, str):
        trimmed = value.strip()
        return [trimmed] if trimmed else []
    return []


def _parse_int(value: Any) -> int | None:
    if isinstance(value, int):
        return value
    if isinstance(value, float):
        return int(value)
    if isinstance(value, str):
        try:
            return int(value.strip())
        except ValueError:
            return None
    return None


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


def resolve_user_role(uid: str, db: firestore.Client | None = None) -> str:
    db = db or firestore_client()
    try:
        lawyer_doc = db.collection("lawyers").document(uid).get()
        if lawyer_doc.exists:
            return "lawyer"
        user_doc = db.collection("users").document(uid).get()
        if user_doc.exists:
            return "user"
    except Exception:
        return "user"
    return "user"


def create_notification(
    user_uid: str,
    title: str,
    message: str,
    data: dict | None = None,
    fcm_token: str | None = None,
    device_fcm_token: Iterable[str] | None = None,
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
        device_fcm_token=device_fcm_token,
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
    device_fcm_token: Iterable[str] | None,
    user_uid: str,
    db: firestore.Client,
) -> list[str]:
    tokens: list[str] = []
    if fcm_token:
        tokens.append(str(fcm_token))
    if device_fcm_token:
        tokens.extend([str(token) for token in device_fcm_token if token])

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
    token_keys = (
        "deviceFcmToken",
        "device_fcm_token",
        "fcmToken",
        "fcm_token",
    )
    for key in token_keys:
        token = data.get(key)
        if token:
            tokens.append(str(token))

    list_token_keys = ("fcmTokens", "deviceFcmTokens", "device_fcm_tokens")
    for key in list_token_keys:
        list_token = data.get(key)
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
    if "title" not in payload_data:
        payload_data["title"] = title
    if "body" not in payload_data:
        payload_data["body"] = message
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


def save_device_fcm_token(
    user_uid: str,
    device_fcm_token: str,
    role: str | None = None,
    platform: str | None = None,
    db: firestore.Client | None = None,
) -> None:
    db = db or firestore_client()
    payload = {
        # Store one canonical token field only (no token arrays).
        "deviceFcmToken": device_fcm_token,
        "deviceFcmTokenUpdatedAt": utc_now_iso(),
    }
    if platform:
        payload["devicePlatform"] = platform

    log_firestore_request(
        "device_fcm_token.save",
        user_uid=user_uid,
        role=role,
        platform=platform,
        payload=payload,
    )

    if role == "lawyer":
        try:
            db.collection("lawyers").document(user_uid).set(payload, merge=True)
            log_firestore_response("device_fcm_token.save", collection="lawyers", user_uid=user_uid)
        except Exception as exc:
            log_firestore_error("device_fcm_token.save", exc, collection="lawyers", user_uid=user_uid)
            raise
        return
    if role in {"user", "admin"}:
        try:
            db.collection("users").document(user_uid).set(payload, merge=True)
            log_firestore_response("device_fcm_token.save", collection="users", user_uid=user_uid)
        except Exception as exc:
            log_firestore_error("device_fcm_token.save", exc, collection="users", user_uid=user_uid)
            raise
        return

    user_doc = db.collection("users").document(user_uid).get()
    if user_doc.exists:
        try:
            db.collection("users").document(user_uid).set(payload, merge=True)
            log_firestore_response("device_fcm_token.save", collection="users", user_uid=user_uid)
        except Exception as exc:
            log_firestore_error("device_fcm_token.save", exc, collection="users", user_uid=user_uid)
            raise
        return

    lawyer_doc = db.collection("lawyers").document(user_uid).get()
    if lawyer_doc.exists:
        try:
            db.collection("lawyers").document(user_uid).set(payload, merge=True)
            log_firestore_response("device_fcm_token.save", collection="lawyers", user_uid=user_uid)
        except Exception as exc:
            log_firestore_error("device_fcm_token.save", exc, collection="lawyers", user_uid=user_uid)
            raise
        return

    try:
        db.collection("users").document(user_uid).set(payload, merge=True)
        log_firestore_response("device_fcm_token.save", collection="users", user_uid=user_uid)
    except Exception as exc:
        log_firestore_error("device_fcm_token.save", exc, collection="users", user_uid=user_uid)
        raise
