from __future__ import annotations

from fastapi import Depends, Header, HTTPException, status

from firebase_admin import auth

from .firebase import init_firebase


def verify_id_token(authorization: str | None = Header(default=None)) -> dict:
    if not authorization or not authorization.startswith("Bearer "):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Missing or invalid Authorization header",
        )
    token = authorization.split(" ", 1)[1].strip()
    try:
        init_firebase()
        decoded = auth.verify_id_token(token)
    except Exception as exc:  # pragma: no cover - depends on firebase runtime
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid or expired token",
        ) from exc
    return decoded


def require_admin(decoded: dict = Depends(verify_id_token)) -> dict:
    if decoded.get("role") != "admin":
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Admin role required")
    return decoded


def ensure_same_user_or_admin(target_uid: str, decoded: dict) -> None:
    if decoded.get("uid") != target_uid and decoded.get("role") != "admin":
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Forbidden")
