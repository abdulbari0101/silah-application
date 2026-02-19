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
from ..services.firestore_service import create_notification
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
    record = {
        "clientUid": payload.clientUid,
        "lawyerUid": payload.lawyerUid,
        "caseText": payload.caseText,
        "specialization": payload.specialization,
        "status": "pending",
        "createdAt": utc_now_iso(),
    }
    ref = db.collection("consultations").document()
    ref.set(record)

    create_notification(
        payload.lawyerUid,
        title="New consultation request",
        message="A client requested a consultation.",
        data={"type": "consultation", "consultationId": ref.id},
    )

    response = ConsultationCreateResponse(consultationId=ref.id)
    return success_response(response.model_dump())


@router.patch("/{consultation_id}")
def update_consultation_status(
    consultation_id: str,
    payload: ConsultationStatusUpdateRequest,
    decoded: dict = Depends(verify_id_token),
) -> dict:
    db = firestore_client()
    doc = db.collection("consultations").document(consultation_id).get()
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

    db.collection("consultations").document(consultation_id).set(
        {"status": payload.status, "updatedAt": utc_now_iso()},
        merge=True,
    )

    if payload.status == "accepted":
        chat_ref = db.collection("chats").document()
        chat_ref.set(
            {
                "participants": [client_uid, lawyer_uid],
                "consultationId": consultation_id,
                "lastMessage": None,
                "updatedAt": utc_now_iso(),
            }
        )

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
