from __future__ import annotations

from typing import Iterable

from firebase_admin import auth, firestore

from ..firebase import firestore_client, init_firebase
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
    docs = db.collection("specializations").where("active", "==", True).stream()
    items = [doc.to_dict() for doc in docs if doc.exists]
    return items


def get_specialization_names(db: firestore.Client | None = None) -> list[str]:
    items = get_active_specializations(db)
    if not items:
        return DEFAULT_SPECIALIZATIONS
    names = []
    for item in items:
        name_en = item.get("nameEn")
        if name_en:
            names.append(str(name_en))
    return names or DEFAULT_SPECIALIZATIONS


def find_verified_lawyers(
    specialization: str,
    city: str | None = None,
    availability: str | None = None,
    db: firestore.Client | None = None,
) -> list[str]:
    db = db or firestore_client()
    base_query = db.collection("lawyers").where("verified", "==", True)
    if city:
        base_query = base_query.where("city", "==", city)
    if availability:
        base_query = base_query.where("availability", "==", availability)

    lawyer_ids: set[str] = set()

    if specialization and specialization != "unknown":
        try:
            docs = base_query.where("specializations", "array_contains", specialization).stream()
            for doc in docs:
                lawyer_ids.add(doc.id)
        except Exception:
            pass
        try:
            docs = base_query.where("legalField", "==", specialization).stream()
            for doc in docs:
                lawyer_ids.add(doc.id)
        except Exception:
            pass

    return sorted(lawyer_ids)


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
    db.collection("notifications").document(user_uid).collection("items").add(notification)


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
    ref = db.collection("admin_tasks").document()
    ref.set(payload)
    return ref.id
