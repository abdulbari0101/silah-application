from __future__ import annotations

import json
import logging
from typing import Any


_LOGGER_NAME = "silah.firebase"


def setup_firebase_logging(level: int = logging.INFO) -> None:
    logger = logging.getLogger(_LOGGER_NAME)
    if logger.handlers:
        return
    logging.basicConfig(level=level, format="%(asctime)s %(levelname)s %(name)s %(message)s")


def log_firestore_request(action: str, **payload: Any) -> None:
    _log("firestore.request", action, payload)


def log_firestore_response(action: str, **payload: Any) -> None:
    _log("firestore.response", action, payload)


def log_firestore_error(action: str, error: Exception, **payload: Any) -> None:
    data = {"error": str(error)}
    data.update(payload)
    _log("firestore.error", action, data, level=logging.ERROR)


def _log(event: str, action: str, payload: dict[str, Any], level: int = logging.INFO) -> None:
    logger = logging.getLogger(_LOGGER_NAME)
    safe_payload = _sanitize(payload)
    message = json.dumps(
        {"event": event, "action": action, "payload": safe_payload},
        ensure_ascii=False,
        default=str,
    )
    logger.log(level, message)


def _sanitize(value: Any) -> Any:
    if isinstance(value, dict):
        return {k: _mask_if_needed(k, _sanitize(v)) for k, v in value.items()}
    if isinstance(value, list):
        return [_sanitize(v) for v in value]
    if isinstance(value, str) and len(value) > 1000:
        return value[:1000] + "..."
    return value


def _mask_if_needed(key: str, value: Any) -> Any:
    lowered = key.lower()
    if any(token in lowered for token in ["password", "token", "nationalid", "license"]):
        return "***"
    if lowered in {"email", "phone"}:
        return "***"
    return value
