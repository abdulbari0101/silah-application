from __future__ import annotations

from fastapi import APIRouter, Depends

from ..auth import verify_id_token
from ..schemas import AIClassifyRequest, AIRecommendRequest, AIRecommendResponse
from ..services.firestore_service import find_verified_lawyers, get_specialization_names
from ..services.openai_client import OpenAIClassifier
from ..utils.responses import success_response

router = APIRouter(prefix="/ai", tags=["ai"])

_classifier = OpenAIClassifier()


@router.post("/classify")
def classify_case(
    payload: AIClassifyRequest,
    _decoded: dict = Depends(verify_id_token),
) -> dict:
    specializations = get_specialization_names()
    result = _classifier.classify(payload.caseText, specializations)
    return success_response(result.model_dump())


@router.post("/recommend")
def recommend_lawyers(
    payload: AIRecommendRequest,
    _decoded: dict = Depends(verify_id_token),
) -> dict:
    specializations = get_specialization_names()
    classification = _classifier.classify(payload.caseText, specializations)

    filters = payload.filters
    lawyer_ids = find_verified_lawyers(
        classification.specialization,
        city=filters.city if filters else None,
        availability=filters.availability if filters else None,
    )

    response = AIRecommendResponse(
        specialization=classification.specialization,
        lawyerIds=lawyer_ids,
    )
    return success_response(response.model_dump())
