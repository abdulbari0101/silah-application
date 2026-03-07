from __future__ import annotations

from fastapi import APIRouter, Depends, HTTPException, status

from ..auth import verify_id_token
from ..schemas import DeviceTokenRequest, DeviceTokenResponse
from ..services.firestore_service import save_device_fcm_token
from ..utils.responses import success_response

router = APIRouter(prefix="/devices", tags=["devices"])


@router.post("/fcm_token")
def register_device_fcm_token(
    payload: DeviceTokenRequest,
    decoded: dict = Depends(verify_id_token),
) -> dict:
    user_uid = decoded.get("uid")
    if not user_uid:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Unauthorized")

    save_device_fcm_token(
        user_uid=user_uid,
        device_fcm_token=payload.deviceFcmToken,
        role=decoded.get("role"),
        platform=payload.platform,
    )
# //fcmToken
    response = DeviceTokenResponse(status="ok")
    return success_response(response.model_dump())
