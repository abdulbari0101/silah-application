from __future__ import annotations

from typing import Any, Optional

# pyrefly: ignore [missing-import]
from pydantic import AliasChoices, BaseModel, ConfigDict, Field


class AIClassifyRequest(BaseModel):
    caseText: str = Field(..., min_length=1)
    lang: str = Field(default="ar")


class LegalSpecializationPayload(BaseModel):
    id: Optional[str] = None
    nameAr: Optional[str] = None
    nameEn: Optional[str] = None
    iconUrl: Optional[str] = None
    active: Optional[bool] = None


class LawyerProfilePayload(BaseModel):
    id: Optional[str] = None
    fullName: Optional[str] = None
    licenseNumber: Optional[str] = None
    legalFields: list[str] = Field(default_factory=list)
    legalFieldIds: list[str] = Field(default_factory=list)
    city: Optional[str] = None
    cityId: Optional[str] = None
    countryId: Optional[str] = None
    workplace: Optional[str] = None
    workDestinationId: Optional[str] = None
    yearsOfExperience: Optional[int] = None
    avatarUrl: Optional[str] = None
    acceptsTrainees: bool = False
    availability: str = "available"


class AIClassifyResult(BaseModel):
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
    specialization: Optional[LegalSpecializationPayload] = None
    specializationId: Optional[str] = None
    lawyers: list[LawyerProfilePayload] = Field(default_factory=list)
    reason: Optional[str] = None


class AIClassifyResponse(BaseModel):
    specialization: Optional[LegalSpecializationPayload] = None
    specializationId: Optional[str] = None
    confidence: float
    reason: str


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
    specializationId: Optional[str] = None
    specialization: Optional[str] = None


class ConsultationCreateResponse(BaseModel):
    consultationId: str


class ConsultationStatusUpdateRequest(BaseModel):
    status: str = Field(..., pattern="^(accepted|rejected|closed)$")
    closeReason: Optional[str] = Field(
        default=None,
        pattern=(
            "^(legal_procedures_started_outside_platform|"
            "client_inactive_for_long_time|"
            "outside_service_scope|"
            "conflict_of_interest|"
            "consultation_completed)$"
        ),
    )


class ConsultationStatusUpdateResponse(BaseModel):
    status: str


class TrainingApplicationCreateRequest(BaseModel):
    opportunityId: str = Field(..., min_length=1)
    traineeUid: str = Field(..., min_length=1)
    cvUrl: str = Field(..., min_length=1)
    fullName: Optional[str] = None
    university: Optional[str] = None
    faculty: Optional[str] = None
    cityId: Optional[str] = None
    city: Optional[str] = None
    countryId: Optional[str] = None
    area: Optional[str] = None
    graduationYear: Optional[int] = None


class TrainingApplicationCreateResponse(BaseModel):
    applicationId: str


class TrainingApplicationStatusUpdateRequest(BaseModel):
    status: str = Field(..., pattern="^(accepted|rejected|cancelled)$")


class TrainingApplicationStatusUpdateResponse(BaseModel):
    status: str


class NotificationItemResponse(BaseModel):
    notificationId: str
    type: Optional[str] = None
    title: Optional[str] = None
    message: Optional[str] = None
    data: dict[str, Any] = Field(default_factory=dict)
    isSeen: bool = False
    timestamp: Optional[str] = None


class NotificationsListResponse(BaseModel):
    notifications: list[NotificationItemResponse]
    unSeenCount: int


class NotificationsSeenResponse(BaseModel):
    updatedCount: int


class SupportReportCreateRequest(BaseModel):
    reporterUid: str = Field(..., min_length=1)
    subject: Optional[str] = None
    details: str = Field(..., min_length=1)


class SupportReportCreateResponse(BaseModel):
    reportId: str


class SupportReportItemResponse(BaseModel):
    reportId: str
    reporterUid: str
    role: str
    subject: Optional[str] = None
    details: str
    status: str
    adminNotes: Optional[str] = None
    createdAt: Optional[str] = None
    updatedAt: Optional[str] = None


class SupportReportsListResponse(BaseModel):
    reports: list[SupportReportItemResponse]


class SupportReportReviewRequest(BaseModel):
    status: str = Field(..., pattern="^(in_progress|resolved|closed)$")
    adminNotes: Optional[str] = None


class DeviceTokenRequest(BaseModel):
    deviceFcmToken: str = Field(
        ...,
        min_length=1,
        validation_alias=AliasChoices(
            "deviceFcmToken",
            "device_fcm_token",
            "fcmToken",
            "fcm_token",
        ),
    )
    platform: Optional[str] = None


class DeviceTokenResponse(BaseModel):
    status: str


class RoleSyncResponse(BaseModel):
    role: str


class WrappedResponse(BaseModel):
    Result: dict[str, Any]


class WrappedDataResponse(WrappedResponse):
    data: dict[str, Any]
    model_config = ConfigDict(extra="allow")
