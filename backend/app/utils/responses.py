from __future__ import annotations

from typing import Any


def success_response(data: dict[str, Any] | None = None, message: str = "Operation successful") -> dict:
    payload = data or {}
    payload["Result"] = {"ErrorNo": 1, "ErrorNa": message}
    return payload


def error_response(message: str, code: int = 0) -> dict:
    return {"Result": {"ErrorNo": code, "ErrorNa": message}}
