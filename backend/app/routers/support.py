from __future__ import annotations

from firebase_admin import firestore
from fastapi import APIRouter, Depends, HTTPException, status

from ..auth import verify_id_token
from ..firebase import firestore_client
from ..schemas import (
    SupportReportCreateRequest,
    SupportReportCreateResponse,
    SupportReportItemResponse,
    SupportReportsListResponse,
)
from ..services.firestore_service import create_admin_task
from ..utils.firebase_logger import (
    log_firestore_error,
    log_firestore_request,
    log_firestore_response,
)
from ..utils.responses import success_response
from ..utils.time import utc_now_iso

router = APIRouter(prefix="/support", tags=["support"])


@router.post("/reports")
def create_support_report(
    payload: SupportReportCreateRequest,
    decoded: dict = Depends(verify_id_token),
) -> dict:
    if decoded.get("uid") != payload.reporterUid and decoded.get("role") != "admin":
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Forbidden")
    role = str(decoded.get("role") or "user").strip().lower()
    if role == "admin":
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Admins cannot submit support reports",
        )
    details = payload.details.strip()
    if not details:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Missing support report details",
        )

    db = firestore_client()
    created_at = utc_now_iso()
    subject = payload.subject.strip() if payload.subject else None
    record = {
        "reporterUid": payload.reporterUid,
        "role": role or "user",
        "subject": subject,
        "details": details,
        "status": "open",
        "adminNotes": None,
        "createdAt": created_at,
        "updatedAt": created_at,
    }

    log_firestore_request("support_reports.create", data=record)
    try:
        ref = db.collection("support_reports").document()
        ref.set(record)
        log_firestore_response("support_reports.create", report_id=ref.id)
    except Exception as exc:
        log_firestore_error("support_reports.create", exc)
        raise
    create_admin_task("support_report", ref.id, "New support report")

    response = SupportReportCreateResponse(reportId=ref.id)
    return success_response(response.model_dump())


@router.get("/reports")
def list_support_reports(decoded: dict = Depends(verify_id_token)) -> dict:
    if decoded.get("role") != "admin":
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Admin role required",
        )

    db = firestore_client()
    log_firestore_request("support_reports.list")
    try:
        docs = (
            db.collection("support_reports")
            .order_by("createdAt", direction=firestore.Query.DESCENDING)
            .stream()
        )
        reports: list[SupportReportItemResponse] = []
        for doc in docs:
            if not doc.exists:
                continue

            data = doc.to_dict() or {}
            report = SupportReportItemResponse(
                reportId=doc.id,
                reporterUid=str(data.get("reporterUid") or ""),
                role=str(data.get("role") or "user"),
                subject=data.get("subject"),
                details=str(data.get("details") or ""),
                status=str(data.get("status") or "open"),
                adminNotes=data.get("adminNotes"),
                createdAt=data.get("createdAt"),
                updatedAt=data.get("updatedAt") or data.get("createdAt"),
            )
            reports.append(report)
        log_firestore_response("support_reports.list", count=len(reports))
    except Exception as exc:
        log_firestore_error("support_reports.list", exc)
        raise

    response = SupportReportsListResponse(reports=reports)
    return success_response(response.model_dump())
