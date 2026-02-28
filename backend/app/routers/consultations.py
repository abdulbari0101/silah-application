from __future__ import annotations

from fastapi import APIRouter, Depends, HTTPException, status
from firebase_admin import firestore

from ..auth import verify_id_token
from ..firebase import firestore_client
from ..schemas import (
    ConsultationCreateRequest,
    ConsultationCreateResponse,
    ConsultationStatusUpdateRequest,
    ConsultationStatusUpdateResponse,
)
from ..services.firestore_service import create_notification, get_active_specializations
from ..utils.firebase_logger import (
    log_firestore_error,
    log_firestore_request,
    log_firestore_response,
)
from ..utils.responses import success_response
from ..utils.time import utc_now_iso

router = APIRouter(prefix="/consultations", tags=["consultations"])


@router.post("")
def create_consultation(
    payload: ConsultationCreateRequest,
    decoded: dict = Depends(verify_id_token),
) -> dict:
    if decoded.get("uid") != payload.clientUid and decoded.get("role") != "admin":
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Forbidden")

    db = firestore_client()
    specialization_value = payload.specializationId or payload.specialization
    if not specialization_value:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Missing specialization")
    specialization_id = _resolve_specialization_id(db, specialization_value)
    if not specialization_id:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Invalid specialization")

    record = {
        "clientUid": payload.clientUid,
        "lawyerUid": payload.lawyerUid,
        "caseText": payload.caseText,
        "specializationId": specialization_id,
        "status": "pending",
        "createdAt": utc_now_iso(),
    }
    log_firestore_request("consultations.create", data=record)
    try:
        ref = db.collection("consultations").document()
        ref.set(record)
        log_firestore_response("consultations.create", doc_id=ref.id)
    except Exception as exc:
        log_firestore_error("consultations.create", exc)
        raise

    create_notification(
        payload.lawyerUid,
        title="New consultation request",
        message="A client requested a consultation.",
        data={"type": "consultation", "consultationId": ref.id},
    )

    response = ConsultationCreateResponse(consultationId=ref.id)
    return success_response(response.model_dump())


def _resolve_specialization_id(db: firestore.Client, value: str) -> str | None:
    normalized = value.strip().lower()
    items = get_active_specializations(db)
    for item in items:
        item_id = str(item.get("id") or "").strip()
        if item_id and item_id.lower() == normalized:
            return item_id
        name_en = str(item.get("nameEn") or "").strip()
        if name_en and name_en.lower() == normalized:
            return item_id
        name_ar = str(item.get("nameAr") or "").strip()
        if name_ar and name_ar.lower() == normalized:
            return item_id
    return None


@router.patch("/{consultation_id}")
def update_consultation_status(
    consultation_id: str,
    payload: ConsultationStatusUpdateRequest,
    decoded: dict = Depends(verify_id_token),
) -> dict:
    db = firestore_client()
    log_firestore_request("consultations.get", consultation_id=consultation_id)
    try:
        doc = db.collection("consultations").document(consultation_id).get()
        log_firestore_response(
            "consultations.get",
            consultation_id=consultation_id,
            exists=doc.exists,
        )
    except Exception as exc:
        log_firestore_error("consultations.get", exc, consultation_id=consultation_id)
        raise
    if not doc.exists:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Consultation not found")

    data = doc.to_dict() or {}
    client_uid = data.get("clientUid")
    lawyer_uid = data.get("lawyerUid")

    if payload.status in {"accepted", "rejected"}:
        if decoded.get("uid") != lawyer_uid and decoded.get("role") != "admin":
            raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Forbidden")
    elif payload.status == "closed":
        if decoded.get("uid") not in {client_uid, lawyer_uid} and decoded.get("role") != "admin":
            raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Forbidden")

    log_firestore_request(
        "consultations.update",
        consultation_id=consultation_id,
        status=payload.status,
    )
    try:
        db.collection("consultations").document(consultation_id).set(
            {"status": payload.status, "updatedAt": utc_now_iso()},
            merge=True,
        )
        log_firestore_response("consultations.update", consultation_id=consultation_id)
    except Exception as exc:
        log_firestore_error("consultations.update", exc, consultation_id=consultation_id)
        raise

    if payload.status == "accepted":
        log_firestore_request(
            "chats.create",
            consultation_id=consultation_id,
            participants=[client_uid, lawyer_uid],
        )
        try:
            chat_ref = db.collection("chats").document()
            chat_ref.set(
                {
                    "participants": [client_uid, lawyer_uid],
                    "consultationId": consultation_id,
                    "lastMessage": None,
                    "updatedAt": utc_now_iso(),
                }
            )
            log_firestore_response("chats.create", chat_id=chat_ref.id)
        except Exception as exc:
            log_firestore_error("chats.create", exc, consultation_id=consultation_id)
            raise

    if payload.status == "accepted":
        create_notification(
            client_uid,
            title="Consultation accepted",
            message="Your consultation request was accepted.",
            data={"type": "consultation", "consultationId": consultation_id},
        )
    if payload.status == "rejected":
        create_notification(
            client_uid,
            title="Consultation rejected",
            message="Your consultation request was rejected.",
            data={"type": "consultation", "consultationId": consultation_id},
        )

    response = ConsultationStatusUpdateResponse(status=payload.status)
    return success_response(response.model_dump())
