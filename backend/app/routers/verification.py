from __future__ import annotations

from fastapi import APIRouter, Depends

from ..auth import ensure_same_user_or_admin, require_admin, verify_id_token
from ..firebase import firestore_client
from ..schemas import VerificationRequest, VerificationResponse, VerificationReviewRequest
from ..services.firestore_service import create_admin_task, set_user_verified
from ..utils.firebase_logger import (
    log_firestore_error,
    log_firestore_request,
    log_firestore_response,
)
from ..services.verification import mock_najiz_check
from ..utils.responses import success_response
from ..utils.time import utc_now_iso

router = APIRouter(prefix="/verification", tags=["verification"])


@router.post("/request")
def request_verification(
    payload: VerificationRequest,
    decoded: dict = Depends(verify_id_token),
) -> dict:
    ensure_same_user_or_admin(payload.lawyerUid, decoded)

    db = firestore_client()
    status_value = mock_najiz_check(payload.licenseNumber, payload.nationalId)

    verification_doc = {
        "licenseNumber": payload.licenseNumber,
        "nationalId": payload.nationalId,
        "status": status_value,
        "reviewNotes": None,
        "requestedAt": utc_now_iso(),
        "verifiedAt": utc_now_iso() if status_value == "verified" else None,
    }
    log_firestore_request(
        "license_verifications.upsert",
        lawyer_uid=payload.lawyerUid,
        data=verification_doc,
    )
    try:
        db.collection("license_verifications").document(payload.lawyerUid).set(
            verification_doc,
            merge=True,
        )
        log_firestore_response("license_verifications.upsert", lawyer_uid=payload.lawyerUid)
    except Exception as exc:
        log_firestore_error("license_verifications.upsert", exc, lawyer_uid=payload.lawyerUid)
        raise

    if status_value == "verified":
        log_firestore_request("lawyers.update", lawyer_uid=payload.lawyerUid, verified=True)
        try:
            db.collection("lawyers").document(payload.lawyerUid).set({"verified": True}, merge=True)
            log_firestore_response("lawyers.update", lawyer_uid=payload.lawyerUid)
        except Exception as exc:
            log_firestore_error("lawyers.update", exc, lawyer_uid=payload.lawyerUid)
            raise
        try:
            set_user_verified(payload.lawyerUid, True)
        except Exception:
            pass
    elif status_value == "needsReview":
        create_admin_task("license_review", payload.lawyerUid, "Auto-verification needs review")

    response = VerificationResponse(status=status_value)
    return success_response(response.model_dump())


@router.post("/review")
def review_verification(
    payload: VerificationReviewRequest,
    _decoded: dict = Depends(require_admin),
) -> dict:
    db = firestore_client()
    status_value = payload.status

    update_data = {
        "status": status_value,
        "reviewNotes": payload.reviewNotes,
        "verifiedAt": utc_now_iso(),
    }
    log_firestore_request(
        "license_verifications.review",
        lawyer_uid=payload.lawyerUid,
        data=update_data,
    )
    try:
        db.collection("license_verifications").document(payload.lawyerUid).set(
            update_data,
            merge=True,
        )
        log_firestore_response("license_verifications.review", lawyer_uid=payload.lawyerUid)
    except Exception as exc:
        log_firestore_error("license_verifications.review", exc, lawyer_uid=payload.lawyerUid)
        raise

    if status_value == "verified":
        log_firestore_request("lawyers.update", lawyer_uid=payload.lawyerUid, verified=True)
        try:
            db.collection("lawyers").document(payload.lawyerUid).set({"verified": True}, merge=True)
            log_firestore_response("lawyers.update", lawyer_uid=payload.lawyerUid)
        except Exception as exc:
            log_firestore_error("lawyers.update", exc, lawyer_uid=payload.lawyerUid)
            raise
        try:
            set_user_verified(payload.lawyerUid, True)
        except Exception:
            pass
    else:
        log_firestore_request("lawyers.update", lawyer_uid=payload.lawyerUid, verified=False)
        try:
            db.collection("lawyers").document(payload.lawyerUid).set({"verified": False}, merge=True)
            log_firestore_response("lawyers.update", lawyer_uid=payload.lawyerUid)
        except Exception as exc:
            log_firestore_error("lawyers.update", exc, lawyer_uid=payload.lawyerUid)
            raise
        try:
            set_user_verified(payload.lawyerUid, False)
        except Exception:
            pass

    response = VerificationResponse(status=status_value)
    return success_response(response.model_dump())
