from __future__ import annotations

from firebase_admin import firestore
from fastapi import APIRouter, Depends, HTTPException, status

from ..auth import verify_id_token
from ..firebase import firestore_client
from ..schemas import (
    SupportReportCreateRequest,
    SupportReportCreateResponse,
    SupportReportItemResponse,
    SupportReportReviewRequest,
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


def _normalize_support_status(value: str) -> str:
    normalized = value.strip().lower().replace("-", "_").replace(" ", "_")
    if normalized == "inprogress":
        normalized = "in_progress"
    if normalized not in {"open", "in_progress", "resolved", "closed"}:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Unsupported support report status",
        )
    return normalized


def _map_support_report(doc: firestore.DocumentSnapshot) -> SupportReportItemResponse:
    data = doc.to_dict() or {}
    return SupportReportItemResponse(
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
    db = firestore_client()
    is_admin = decoded.get("role") == "admin"
    user_uid = str(decoded.get("uid") or "").strip()
    if not is_admin and not user_uid:
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Authenticated user required",
        )

    log_firestore_request("support_reports.list")
    try:
        collection = db.collection("support_reports")
        docs = (
            collection.stream()
            if is_admin
            else collection.where("reporterUid", "==", user_uid).stream()
        )
        reports: list[SupportReportItemResponse] = []
        for doc in docs:
            if not doc.exists:
                continue

            reports.append(_map_support_report(doc))

        reports.sort(key=lambda item: item.createdAt or "", reverse=True)
        log_firestore_response("support_reports.list", count=len(reports))
    except Exception as exc:
        log_firestore_error("support_reports.list", exc)
        raise

    response = SupportReportsListResponse(reports=reports)
    return success_response(response.model_dump())


@router.patch("/reports/{report_id}")
def review_support_report(
    report_id: str,
    payload: SupportReportReviewRequest,
    decoded: dict = Depends(verify_id_token),
) -> dict:
    if decoded.get("role") != "admin":
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Admin role required",
        )

    resolved_report_id = report_id.strip()
    if not resolved_report_id:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Missing support report id",
        )

    db = firestore_client()
    report_ref = db.collection("support_reports").document(resolved_report_id)
    log_firestore_request(
        "support_reports.review",
        report_id=resolved_report_id,
        payload=payload.model_dump(exclude_none=True),
    )
    try:
        report_doc = report_ref.get()
        if not report_doc.exists:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="Support report not found",
            )

        normalized_status = _normalize_support_status(payload.status)
        updated_at = utc_now_iso()
        update_payload = {
            "status": normalized_status,
            "updatedAt": updated_at,
        }
        if "adminNotes" in payload.model_fields_set:
            notes = payload.adminNotes.strip() if payload.adminNotes else None
            update_payload["adminNotes"] = notes or None

        report_ref.set(update_payload, merge=True)

        task_status = "rejected" if normalized_status == "closed" else "approved"
        task_docs = (
            db.collection("admin_tasks")
            .where("targetId", "==", resolved_report_id)
            .stream()
        )
        for task_doc in task_docs:
            if not task_doc.exists:
                continue
            task_data = task_doc.to_dict() or {}
            task_type = str(task_data.get("type") or "").strip().lower().replace(
                "-",
                "_",
            )
            if task_type != "support_report":
                continue
            task_doc.reference.set(
                {
                    "status": task_status,
                    "updatedAt": updated_at,
                },
                merge=True,
            )

        updated_doc = report_ref.get()
        response = _map_support_report(updated_doc)
        log_firestore_response(
            "support_reports.review",
            report_id=resolved_report_id,
            status=response.status,
        )
    except HTTPException:
        raise
    except Exception as exc:
        log_firestore_error("support_reports.review", exc, report_id=resolved_report_id)
        raise

    return success_response(response.model_dump())
