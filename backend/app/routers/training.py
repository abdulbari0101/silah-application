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
from ..utils.firebase_logger import (
    log_firestore_error,
    log_firestore_request,
    log_firestore_response,
)
from ..utils.responses import success_response
from ..utils.time import utc_now_iso

router = APIRouter(prefix="/training", tags=["training"])


def _to_bool(value: object) -> bool:
    if isinstance(value, bool):
        return value
    if isinstance(value, (int, float)):
        return value != 0
    if isinstance(value, str):
        normalized = value.strip().lower()
        if normalized in {"true", "1", "yes"}:
            return True
        if normalized in {"false", "0", "no"}:
            return False
    return False


def _build_training_application_id(*, lawyer_uid: str, trainee_uid: str) -> str:
    return f"{lawyer_uid.strip()}_{trainee_uid.strip()}"


def _build_training_chat_id(application_id: str) -> str:
    return f"training_{application_id.strip()}"


def _fetch_user_doc(db, uid: str):
    resolved_uid = uid.strip()
    log_firestore_request("users.get", uid=resolved_uid)
    try:
        doc = db.collection("users").document(resolved_uid).get()
        log_firestore_response("users.get", uid=resolved_uid, exists=doc.exists)
        return doc
    except Exception as exc:
        log_firestore_error("users.get", exc, uid=resolved_uid)
        raise


def _fetch_lawyer_doc(db, lawyer_uid: str):
    resolved_uid = lawyer_uid.strip()
    log_firestore_request("lawyers.get", lawyer_uid=resolved_uid)
    try:
        doc = db.collection("lawyers").document(resolved_uid).get()
        log_firestore_response("lawyers.get", lawyer_uid=resolved_uid, exists=doc.exists)
        return doc
    except Exception as exc:
        log_firestore_error("lawyers.get", exc, lawyer_uid=resolved_uid)
        raise


@router.post("/applications")
def create_training_application(
    payload: TrainingApplicationCreateRequest,
    decoded: dict = Depends(verify_id_token),
) -> dict:
    if decoded.get("uid") != payload.traineeUid and decoded.get("role") != "admin":
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Forbidden")

    db = firestore_client()
    target_id = payload.opportunityId.strip()
    log_firestore_request("training_target.resolve", target_id=target_id)
    try:
        opp_doc = db.collection("training_opportunities").document(target_id).get()
        log_firestore_response(
            "training_target.resolve",
            target_id=target_id,
            exists=opp_doc.exists,
        )
    except Exception as exc:
        log_firestore_error("training_target.resolve", exc, target_id=target_id)
        raise

    has_opportunity = opp_doc.exists
    opp_data = opp_doc.to_dict() or {}
    lawyer_uid = str(opp_data.get("lawyerUid") or "").strip() if has_opportunity else target_id
    if not lawyer_uid:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Missing lawyer uid")

    trainee_doc = _fetch_user_doc(db, payload.traineeUid)
    if not trainee_doc.exists:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="User not found")
    trainee_data = trainee_doc.to_dict() or {}
    if not _to_bool(trainee_data.get("isTrainee")):
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="User is not enabled as trainee",
        )

    lawyer_doc = _fetch_lawyer_doc(db, lawyer_uid)
    if not lawyer_doc.exists:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Lawyer not found")

    lawyer_data = lawyer_doc.to_dict() or {}
    is_verified = _to_bool(lawyer_data.get("verified"))
    accepts_trainees = _to_bool(lawyer_data.get("acceptsTrainees"))
    if not is_verified:
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Lawyer is not verified for training",
        )
    if not accepts_trainees:
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Lawyer is not accepting trainees",
        )

    application_id = _build_training_application_id(
        lawyer_uid=lawyer_uid,
        trainee_uid=payload.traineeUid,
    )
    existing_ref = db.collection("training_applications").document(application_id)
    log_firestore_request(
        "training_applications.duplicate_check",
        application_id=application_id,
        lawyer_uid=lawyer_uid,
        trainee_uid=payload.traineeUid,
    )
    try:
        existing_doc = existing_ref.get()
        if existing_doc.exists:
            log_firestore_response(
                "training_applications.duplicate_check",
                application_id=application_id,
                exists=True,
            )
            raise HTTPException(
                status_code=status.HTTP_409_CONFLICT,
                detail="Training application already exists for this lawyer",
            )

        legacy_docs = (
            db.collection("training_applications")
            .where("lawyerUid", "==", lawyer_uid)
            .stream()
        )
        for legacy_doc in legacy_docs:
            legacy_data = legacy_doc.to_dict() or {}
            if str(legacy_data.get("traineeUid") or "").strip() == payload.traineeUid.strip():
                log_firestore_response(
                    "training_applications.duplicate_check",
                    application_id=application_id,
                    exists=True,
                    legacy_application_id=legacy_doc.id,
                )
                raise HTTPException(
                    status_code=status.HTTP_409_CONFLICT,
                    detail="Training application already exists for this lawyer",
                )

        log_firestore_response(
            "training_applications.duplicate_check",
            application_id=application_id,
            exists=False,
        )
    except HTTPException:
        raise
    except Exception as exc:
        log_firestore_error(
            "training_applications.duplicate_check",
            exc,
            application_id=application_id,
        )
        raise

    record = {
        "opportunityId": payload.opportunityId if has_opportunity else None,
        "traineeUid": payload.traineeUid,
        "lawyerUid": lawyer_uid,
        "fullName": payload.fullName,
        "university": payload.university,
        "faculty": payload.faculty,
        "cityId": payload.cityId,
        "city": payload.city,
        "countryId": payload.countryId,
        "area": payload.area,
        "graduationYear": payload.graduationYear,
        "cvUrl": payload.cvUrl,
        "status": "pending",
        "submittedAt": utc_now_iso(),
        "dedupeKey": application_id,
    }
    log_firestore_request("training_applications.create", data=record)
    try:
        ref = existing_ref
        ref.set(record)
        log_firestore_response("training_applications.create", application_id=ref.id)
    except Exception as exc:
        log_firestore_error("training_applications.create", exc)
        raise

    if lawyer_uid:
        create_notification(
            lawyer_uid,
            title="New training application",
            message="A trainee submitted a training application.",
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
    log_firestore_request("training_applications.get", application_id=application_id)
    try:
        doc = db.collection("training_applications").document(application_id).get()
        log_firestore_response(
            "training_applications.get",
            application_id=application_id,
            exists=doc.exists,
        )
    except Exception as exc:
        log_firestore_error("training_applications.get", exc, application_id=application_id)
        raise
    if not doc.exists:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Application not found")

    app_data = doc.to_dict() or {}
    trainee_uid = app_data.get("traineeUid")
    lawyer_uid = app_data.get("lawyerUid")

    if decoded.get("role") != "admin" and decoded.get("uid") != lawyer_uid:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Forbidden")

    if payload.status == "accepted":
        resolved_lawyer_uid = str(lawyer_uid or "").strip()
        if not resolved_lawyer_uid:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="Missing lawyer uid",
            )
        lawyer_doc = _fetch_lawyer_doc(db, resolved_lawyer_uid)
        if not lawyer_doc.exists:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="Lawyer not found",
            )
        lawyer_data = lawyer_doc.to_dict() or {}
        if not _to_bool(lawyer_data.get("acceptsTrainees")):
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Lawyer is not accepting trainees",
            )

    log_firestore_request(
        "training_applications.update",
        application_id=application_id,
        status=payload.status,
    )
    try:
        db.collection("training_applications").document(application_id).set(
            {"status": payload.status, "updatedAt": utc_now_iso()},
            merge=True,
        )
        log_firestore_response("training_applications.update", application_id=application_id)
    except Exception as exc:
        log_firestore_error("training_applications.update", exc, application_id=application_id)
        raise

    if payload.status == "accepted":
        chat_id = _build_training_chat_id(application_id)
        log_firestore_request(
            "training_chats.upsert",
            application_id=application_id,
            chat_id=chat_id,
        )
        try:
            db.collection("chats").document(chat_id).set(
                {
                    "participants": [trainee_uid, lawyer_uid],
                    "trainingApplicationId": application_id,
                    "lastMessage": None,
                    "updatedAt": utc_now_iso(),
                },
                merge=True,
            )
            log_firestore_response(
                "training_chats.upsert",
                application_id=application_id,
                chat_id=chat_id,
            )
        except Exception as exc:
            log_firestore_error(
                "training_chats.upsert",
                exc,
                application_id=application_id,
                chat_id=chat_id,
            )
            raise

    if trainee_uid:
        create_notification(
            trainee_uid,
            title="Training application update",
            message=f"Your training application status changed to {payload.status}.",
            data={"type": "training", "applicationId": application_id},
        )

    response = TrainingApplicationStatusUpdateResponse(status=payload.status)
    return success_response(response.model_dump())
