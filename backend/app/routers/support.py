from __future__ import annotations

from fastapi import APIRouter, Depends, HTTPException, status

from ..auth import verify_id_token
from ..firebase import firestore_client
from ..schemas import SupportReportCreateRequest, SupportReportCreateResponse
from ..services.firestore_service import create_admin_task
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

    db = firestore_client()
    record = {
        "reporterUid": payload.reporterUid,
        "role": decoded.get("role", "user"),
        "details": payload.details,
        "status": "open",
        "adminNotes": None,
        "createdAt": utc_now_iso(),
    }

    ref = db.collection("support_reports").document()
    ref.set(record)
    create_admin_task("support_report", ref.id, "New support report")

    response = SupportReportCreateResponse(reportId=ref.id)
    return success_response(response.model_dump())
