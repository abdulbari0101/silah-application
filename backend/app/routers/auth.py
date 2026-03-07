from __future__ import annotations

from fastapi import APIRouter, Depends, HTTPException, status

from ..auth import verify_id_token
from ..schemas import RoleSyncResponse
from ..services.firestore_service import resolve_user_role, set_user_role
from ..utils.responses import success_response

router = APIRouter(prefix="/auth", tags=["auth"])


@router.post("/sync-role")
def sync_role(decoded: dict = Depends(verify_id_token)) -> dict:
    user_uid = decoded.get("uid")
    if not user_uid:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Unauthorized")

    if decoded.get("role") == "admin":
        role = "admin"
    else:
        role = resolve_user_role(user_uid)

    set_user_role(user_uid, role)
    response = RoleSyncResponse(role=role)
    return success_response(response.model_dump())
