from __future__ import annotations

from fastapi import APIRouter, Depends

from ..auth import verify_id_token
from ..schemas import (
    AIClassifyRequest,
    AIClassifyResponse,
    AIRecommendRequest,
    AIRecommendResponse,
    LegalSpecializationPayload,
)
from ..services.firestore_service import (
    find_verified_lawyers,
    get_active_specializations,
    get_specialization_names,
)
from ..services.openai_client import OpenAIClassifier
from ..utils.responses import success_response

router = APIRouter(prefix="/ai", tags=["ai"])

_classifier = OpenAIClassifier()


@router.post("/classify")
def classify_case(
    payload: AIClassifyRequest,
    _decoded: dict = Depends(verify_id_token),
) -> dict:
    specialization_items = get_active_specializations()
    specializations = get_specialization_names()
    result = _classifier.classify(payload.caseText, specializations)
    resolved = _resolve_specialization(specialization_items, result.specialization)
    response = AIClassifyResponse(
        specialization=resolved,
        specializationId=resolved.id if resolved else None,
        confidence=result.confidence,
        reason=result.reason,
    )
    return success_response(response.model_dump(exclude_none=True))


@router.post("/recommend")
def recommend_lawyers(
    payload: AIRecommendRequest,
    _decoded: dict = Depends(verify_id_token),
) -> dict:
    specialization_items = get_active_specializations()
    specializations = get_specialization_names()
    classification = _classifier.classify(payload.caseText, specializations)
    resolved = _resolve_specialization(specialization_items, classification.specialization)
    specialization_id = resolved.id if resolved else None

    filters = payload.filters
    lawyer_ids: list[str] = []
    if specialization_id:
        lawyer_ids = find_verified_lawyers(
            specialization_id,
            city=filters.city if filters else None,
            availability=filters.availability if filters else None,
        )

    response = AIRecommendResponse(
        specialization=resolved,
        specializationId=specialization_id,
        lawyerIds=lawyer_ids,
    )
    return success_response(response.model_dump(exclude_none=True))


def _resolve_specialization(
    items: list[dict],
    specialization_name: str,
) -> LegalSpecializationPayload | None:
    if not specialization_name or specialization_name == "unknown":
        return None
    for item in items:
        name_en = str(item.get("nameEn") or "").strip()
        name_ar = str(item.get("nameAr") or "").strip()
        normalized = specialization_name.strip().lower()
        if name_en and name_en.lower() == normalized:
            return LegalSpecializationPayload(
                id=item.get("id"),
                nameAr=item.get("nameAr"),
                nameEn=item.get("nameEn"),
                iconUrl=item.get("iconUrl"),
                active=item.get("active"),
            )
        if name_ar and name_ar.lower() == normalized:
            return LegalSpecializationPayload(
                id=item.get("id"),
                nameAr=item.get("nameAr"),
                nameEn=item.get("nameEn"),
                iconUrl=item.get("iconUrl"),
                active=item.get("active"),
            )
    return None
