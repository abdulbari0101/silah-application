from __future__ import annotations

from fastapi import APIRouter, Depends, HTTPException, status

from ..auth import verify_id_token
from ..firebase import firestore_client
from ..schemas import (
    TrainingApplicationCreateRequest,
    TrainingApplicationCreateResponse,
    TrainingApplicationStatusUpdateRequest,
    TrainingApplicationStatusUpdateResponse,
)
from ..services.firestore_service import create_notification
from ..utils.responses import success_response
from ..utils.time import utc_now_iso

router = APIRouter(prefix="/training", tags=["training"])


@router.post("/applications")
def create_training_application(
    payload: TrainingApplicationCreateRequest,
    decoded: dict = Depends(verify_id_token),
) -> dict:
    if decoded.get("uid") != payload.traineeUid and decoded.get("role") != "admin":
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Forbidden")

    db = firestore_client()
    opp_doc = db.collection("training_opportunities").document(payload.opportunityId).get()
    if not opp_doc.exists:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Opportunity not found")

    opp_data = opp_doc.to_dict() or {}
    lawyer_uid = opp_data.get("lawyerUid")

    record = {
        "opportunityId": payload.opportunityId,
        "traineeUid": payload.traineeUid,
        "lawyerUid": lawyer_uid,
        "fullName": payload.fullName,
        "university": payload.university,
        "faculty": payload.faculty,
        "city": payload.city,
        "graduationYear": payload.graduationYear,
        "cvUrl": payload.cvUrl,
        "status": "pending",
        "submittedAt": utc_now_iso(),
    }
    ref = db.collection("training_applications").document()
    ref.set(record)

    if lawyer_uid:
        create_notification(
            lawyer_uid,
            title="New training application",
            message="A trainee applied for your training opportunity.",
            data={"type": "training", "applicationId": ref.id},
        )

    response = TrainingApplicationCreateResponse(applicationId=ref.id)
    return success_response(response.model_dump())


@router.patch("/applications/{application_id}")
def update_training_application_status(
    application_id: str,
    payload: TrainingApplicationStatusUpdateRequest,
    decoded: dict = Depends(verify_id_token),
) -> dict:
    db = firestore_client()
    doc = db.collection("training_applications").document(application_id).get()
    if not doc.exists:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Application not found")

    app_data = doc.to_dict() or {}
    trainee_uid = app_data.get("traineeUid")
    lawyer_uid = app_data.get("lawyerUid")

    if decoded.get("role") != "admin" and decoded.get("uid") != lawyer_uid:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Forbidden")

    db.collection("training_applications").document(application_id).set(
        {"status": payload.status, "updatedAt": utc_now_iso()},
        merge=True,
    )

    if trainee_uid:
        create_notification(
            trainee_uid,
            title="Training application update",
            message=f"Your training application status changed to {payload.status}.",
            data={"type": "training", "applicationId": application_id},
        )

    response = TrainingApplicationStatusUpdateResponse(status=payload.status)
    return success_response(response.model_dump())
