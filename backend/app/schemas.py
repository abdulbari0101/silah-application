from __future__ import annotations

from typing import Any, Optional

from pydantic import BaseModel, Field


class AIClassifyRequest(BaseModel):
    caseText: str = Field(..., min_length=1)
    lang: str = Field(default="ar")


class AIClassifyResponse(BaseModel):
    specialization: str
    confidence: float
    reason: str


class AIRecommendFilters(BaseModel):
    city: Optional[str] = None
    availability: Optional[str] = None


class AIRecommendRequest(BaseModel):
    caseText: str = Field(..., min_length=1)
    filters: Optional[AIRecommendFilters] = None


class AIRecommendResponse(BaseModel):
    specialization: str
    lawyerIds: list[str]


class VerificationRequest(BaseModel):
    licenseNumber: str = Field(..., min_length=1)
    nationalId: str = Field(..., min_length=1)
    lawyerUid: str = Field(..., min_length=1)


class VerificationResponse(BaseModel):
    status: str


class VerificationReviewRequest(BaseModel):
    lawyerUid: str = Field(..., min_length=1)
    status: str = Field(..., pattern="^(verified|rejected)$")
    reviewNotes: Optional[str] = None


class ConsultationCreateRequest(BaseModel):
    clientUid: str = Field(..., min_length=1)
    lawyerUid: str = Field(..., min_length=1)
    caseText: str = Field(..., min_length=1)
    specialization: str = Field(..., min_length=1)


class ConsultationCreateResponse(BaseModel):
    consultationId: str


class ConsultationStatusUpdateRequest(BaseModel):
    status: str = Field(..., pattern="^(accepted|rejected|closed)$")


class ConsultationStatusUpdateResponse(BaseModel):
    status: str


class TrainingApplicationCreateRequest(BaseModel):
    opportunityId: str = Field(..., min_length=1)
    traineeUid: str = Field(..., min_length=1)
    cvUrl: str = Field(..., min_length=1)
    fullName: Optional[str] = None
    university: Optional[str] = None
    faculty: Optional[str] = None
    city: Optional[str] = None
    graduationYear: Optional[int] = None


class TrainingApplicationCreateResponse(BaseModel):
    applicationId: str


class TrainingApplicationStatusUpdateRequest(BaseModel):
    status: str = Field(..., pattern="^(accepted|rejected|cancelled)$")


class TrainingApplicationStatusUpdateResponse(BaseModel):
    status: str


class SupportReportCreateRequest(BaseModel):
    reporterUid: str = Field(..., min_length=1)
    details: str = Field(..., min_length=1)


class SupportReportCreateResponse(BaseModel):
    reportId: str


class WrappedResponse(BaseModel):
    Result: dict[str, Any]


class WrappedDataResponse(WrappedResponse):
    data: dict[str, Any]

    class Config:
        extra = "allow"
