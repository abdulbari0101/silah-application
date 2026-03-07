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
    _attach_resolved_role(decoded)
    return decoded


def _attach_resolved_role(decoded: dict) -> None:
    role = _extract_role_from_claims(decoded)
    if role:
        decoded["role"] = role
        return

    uid = str(decoded.get("uid") or "").strip()
    if not uid:
        return

    # Lazy import avoids circular dependencies between auth and service modules.
    from .services.firestore_service import resolve_user_role

    decoded["role"] = resolve_user_role(uid)


def _extract_role_from_claims(decoded: dict) -> str | None:
    direct_keys = (
        "role",
        "user_role",
        "rule",
        "auth.rule",
        "auth_rule",
        "authRole",
    )
    for key in direct_keys:
        value = decoded.get(key)
        if isinstance(value, str):
            normalized = value.strip().lower()
            if normalized:
                return normalized

    auth_claim = decoded.get("auth")
    if isinstance(auth_claim, dict):
        for key in ("rule", "role", "user_role"):
            value = auth_claim.get(key)
            if isinstance(value, str):
                normalized = value.strip().lower()
                if normalized:
                    return normalized

    if decoded.get("admin") is True:
        return "admin"

    return None


def require_admin(decoded: dict = Depends(verify_id_token)) -> dict:
    if decoded.get("role") != "admin":
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Admin role required")
    return decoded


def ensure_same_user_or_admin(target_uid: str, decoded: dict) -> None:
    if decoded.get("uid") != target_uid and decoded.get("role") != "admin":
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Forbidden")
