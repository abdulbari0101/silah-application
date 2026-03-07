from __future__ import annotations

from fastapi import APIRouter, Depends, HTTPException, Query, status
from firebase_admin import firestore

from ..auth import verify_id_token
from ..firebase import firestore_client
from ..schemas import (
    NotificationItemResponse,
    NotificationsListResponse,
    NotificationsSeenResponse,
)
from ..utils.firebase_logger import (
    log_firestore_error,
    log_firestore_request,
    log_firestore_response,
)
from ..utils.responses import success_response
from ..utils.time import utc_now_iso

router = APIRouter(prefix="/notifications", tags=["notifications"])


def _require_uid(decoded: dict) -> str:
    uid = str(decoded.get("uid") or "").strip()
    if not uid:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Unauthorized")
    return uid


@router.get("")
def fetch_notifications(
    limit: int = Query(default=50, ge=1, le=200),
    decoded: dict = Depends(verify_id_token),
) -> dict:
    user_uid = _require_uid(decoded)
    db = firestore_client()
    items_ref = db.collection("notifications").document(user_uid).collection("items")

    log_firestore_request("notifications.fetch", user_uid=user_uid, limit=limit)
    try:
        docs = (
            items_ref.order_by("timestamp", direction=firestore.Query.DESCENDING)
            .limit(limit)
            .stream()
        )
        items: list[NotificationItemResponse] = []
        for doc in docs:
            data = doc.to_dict() or {}
            payload = data.get("data")
            item = NotificationItemResponse(
                notificationId=doc.id,
                type=str(data.get("type")) if data.get("type") is not None else None,
                title=str(data.get("title")) if data.get("title") is not None else None,
                message=str(data.get("message")) if data.get("message") is not None else None,
                data=payload if isinstance(payload, dict) else {},
                isSeen=bool(data.get("isSeen") is True),
                timestamp=str(data.get("timestamp")) if data.get("timestamp") is not None else None,
            )
            items.append(item)
    except Exception as exc:
        log_firestore_error("notifications.fetch", exc, user_uid=user_uid)
        raise

    unseen_count = 0
    log_firestore_request("notifications.unseen_count", user_uid=user_uid)
    try:
        unseen_docs = items_ref.where("isSeen", "==", False).stream()
        unseen_count = sum(1 for _ in unseen_docs)
        log_firestore_response(
            "notifications.unseen_count",
            user_uid=user_uid,
            unSeenCount=unseen_count,
        )
    except Exception as exc:
        log_firestore_error("notifications.unseen_count", exc, user_uid=user_uid)
        raise

    response = NotificationsListResponse(notifications=items, unSeenCount=unseen_count)
    log_firestore_response("notifications.fetch", user_uid=user_uid, count=len(items))
    return success_response(response.model_dump())


@router.patch("/seen")
def mark_notifications_seen(decoded: dict = Depends(verify_id_token)) -> dict:
    user_uid = _require_uid(decoded)
    db = firestore_client()
    items_ref = db.collection("notifications").document(user_uid).collection("items")

    log_firestore_request("notifications.mark_seen", user_uid=user_uid)
    try:
        unseen_docs = list(items_ref.where("isSeen", "==", False).stream())
    except Exception as exc:
        log_firestore_error("notifications.mark_seen", exc, user_uid=user_uid)
        raise

    if not unseen_docs:
        log_firestore_response("notifications.mark_seen", user_uid=user_uid, updated=0)
        response = NotificationsSeenResponse(updatedCount=0)
        return success_response(response.model_dump())

    batch = db.batch()
    now = utc_now_iso()
    for doc in unseen_docs:
        batch.set(
            doc.reference,
            {
                "isSeen": True,
                "seenAt": now,
                "updatedAt": now,
            },
            merge=True,
        )
    try:
        batch.commit()
    except Exception as exc:
        log_firestore_error("notifications.mark_seen", exc, user_uid=user_uid)
        raise

    updated_count = len(unseen_docs)
    log_firestore_response(
        "notifications.mark_seen",
        user_uid=user_uid,
        updated=updated_count,
    )
    response = NotificationsSeenResponse(updatedCount=updated_count)
    return success_response(response.model_dump())
