from __future__ import annotations

from fastapi import APIRouter

from ..firebase import firestore_client
from ..utils.responses import success_response
from ..utils.firebase_logger import (
    log_firestore_error,
    log_firestore_request,
    log_firestore_response,
)

router = APIRouter(prefix="/lookups", tags=["lookups"])


def _fetch_collection(name: str) -> list[dict]:
    db = firestore_client()
    log_firestore_request("lookups.fetch", collection=name)
    try:
        docs = db.collection(name).stream()
        items: list[dict] = []
        for doc in docs:
            if not doc.exists:
                continue
            data = doc.to_dict() or {}
            if "id" not in data:
                data["id"] = doc.id
            items.append(data)
        log_firestore_response("lookups.fetch", collection=name, count=len(items))
        return items
    except Exception as exc:
        log_firestore_error("lookups.fetch", exc, collection=name)
        raise


@router.get("/genders")
def get_genders() -> dict:
    return success_response({"items": _fetch_collection("genders")})


@router.get("/cities")
def get_cities() -> dict:
    return success_response({"items": _fetch_collection("cities")})


@router.get("/areas")
def get_areas() -> dict:
    return success_response({"items": _fetch_collection("areas")})


@router.get("/work-destinations")
def get_work_destinations() -> dict:
    return success_response({"items": _fetch_collection("work_destinations")})
