// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element

import 'core/data/local/cache/prefs/prefs_key.dart' as p0;
import 'core/data/local/cache/secure/secure_key.dart' as p1;
import 'core/data/model/api/auth/token_model.dart' as p2;
import 'core/data/model/api/base/response_wrapper.dart' as p3;
import 'core/data/model/api/data_model.dart' as p4;
import 'core/data/model/api/offer_model.dart' as p5;
import 'core/data/model/api/request/post_request_model.dart' as p6;
import 'core/data/model/api/result_model.dart' as p7;
import 'core/data/model/local/app_setting_model.dart' as p8;
import 'core/data/model/local/user_setting_model.dart' as p9;
import 'core/domain/entities/api/auth/customer_entity.dart' as p10;
import 'core/domain/entities/api/offer_entity.dart' as p11;
import 'core/domain/entities/api/request/post_request_entity.dart' as p12;
import 'core/domain/entities/api/result_entity.dart' as p13;
import 'core/domain/entities/data_entity.dart' as p14;
import 'core/domain/entities/local/setting/app_setting_entity.dart' as p15;
import 'core/domain/entities/local/setting/user_setting_entity.dart' as p16;
import 'core/domain/enums/app_theme_mode.dart' as p17;
import 'core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart'
    as p18;
import 'core/presentation/state_magment/blocs/app_state/state_data/app_state_data.dart'
    as p19;
import 'features/admin/domain/entities/admin_task_entity.dart' as p20;
import 'features/admin/domain/entities/admin_task_status.dart' as p21;
import 'features/auth/data/models/auth_role_models.dart' as p22;
import 'features/auth/data/models/auth_user_model.dart' as p23;
import 'features/auth/domain/entities/auth_user_entity.dart' as p24;
import 'features/auth/domain/entities/registration_payload.dart' as p25;
import 'features/consultations/data/models/consultation_models.dart' as p26;
import 'features/consultations/domain/entities/case_attachment_entity.dart'
    as p27;
import 'features/consultations/domain/entities/consultation_close_reason.dart'
    as p28;
import 'features/consultations/domain/entities/consultation_request_entity.dart'
    as p29;
import 'features/consultations/domain/entities/consultation_status.dart' as p30;
import 'features/discovery/data/models/ai_models.dart' as p31;
import 'features/discovery/data/models/legal_specialization_model.dart' as p32;
import 'features/discovery/domain/entities/ai_classification_request_entity.dart'
    as p33;
import 'features/discovery/domain/entities/ai_classification_result_entity.dart'
    as p34;
import 'features/discovery/domain/entities/ai_recommendation_entity.dart'
    as p35;
import 'features/discovery/domain/entities/discovery_request_entity.dart'
    as p36;
import 'features/discovery/domain/entities/legal_specialization_entity.dart'
    as p37;
import 'features/discovery/domain/entities/specification_item_entity.dart'
    as p38;
import 'features/lookups/data/models/lookup_item_model.dart' as p39;
import 'features/lookups/domain/entities/lookup_item_entity.dart' as p40;
import 'features/messaging/data/models/chat_item_model.dart' as p41;
import 'features/messaging/domain/entities/chat_item_entity.dart' as p42;
import 'features/messaging/domain/entities/chat_thread_entity.dart' as p43;
import 'features/messaging/domain/entities/message_entity.dart' as p44;
import 'features/messaging/domain/entities/message_type.dart' as p45;
import 'features/notifications/data/models/device_token_models.dart' as p46;
import 'features/notifications/data/models/notification/notification_model.dart'
    as p47;
import 'features/notifications/domain/entities/notification/notification_entity.dart'
    as p48;
import 'features/notifications/domain/entities/notification/notification_result.dart'
    as p49;
import 'features/profiles/domain/entities/availability_status.dart' as p50;
import 'features/profiles/domain/entities/lawyer_profile_entity.dart' as p51;
import 'features/profiles/domain/entities/profile_entity.dart' as p52;
import 'features/settings/data/models/settings_response_wrapper.dart' as p53;
import 'features/settings/domain/entities/setting_item_entity.dart' as p54;
import 'features/settings/domain/entities/setting_item_type.dart' as p55;
import 'features/settings/domain/entities/setting_section_entity.dart' as p56;
import 'features/support/data/models/support_report_models.dart' as p57;
import 'features/support/domain/entities/support_ticket_entity.dart' as p58;
import 'features/support/domain/entities/support_ticket_status.dart' as p59;
import 'features/training/data/models/training_models.dart' as p60;
import 'features/training/domain/entities/training_application_entity.dart'
    as p61;
import 'features/training/domain/entities/training_application_status.dart'
    as p62;
import 'features/training/domain/entities/training_opportunity_entity.dart'
    as p63;
import 'features/verification/data/models/verification_models.dart' as p64;
import 'features/verification/domain/entities/license_verification_entity.dart'
    as p65;
import 'features/verification/domain/entities/verification_status.dart' as p66;

void initializeMappers() {
  p0.PrefsKeyMapper.ensureInitialized();
  p1.SecureKeyMapper.ensureInitialized();
  p2.TokenModelMapper.ensureInitialized();
  p3.BaseRespWrapperMapper.ensureInitialized();
  p4.DataModelMapper.ensureInitialized();
  p5.OfferModelMapper.ensureInitialized();
  p6.PostRequestModelMapper.ensureInitialized();
  p7.ResultModelMapper.ensureInitialized();
  p8.AppSettingModelMapper.ensureInitialized();
  p9.UserSettingModelMapper.ensureInitialized();
  p10.CustomerEntityMapper.ensureInitialized();
  p11.OfferEntityMapper.ensureInitialized();
  p12.PostRequestEntityMapper.ensureInitialized();
  p13.ResultEntityMapper.ensureInitialized();
  p14.DataEntityMapper.ensureInitialized();
  p15.AppSettingEntityMapper.ensureInitialized();
  p16.UserSettingEntityMapper.ensureInitialized();
  p17.AppThemeModeMapper.ensureInitialized();
  p18.UserAuthStatusMapper.ensureInitialized();
  p19.AppStateDataMapper.ensureInitialized();
  p20.AdminTaskEntityMapper.ensureInitialized();
  p21.AdminTaskStatusMapper.ensureInitialized();
  p22.RoleSyncResponseModelMapper.ensureInitialized();
  p23.AuthUserModelMapper.ensureInitialized();
  p24.AuthUserEntityMapper.ensureInitialized();
  p24.AuthAccountTypeMapper.ensureInitialized();
  p25.RegistrationPayloadMapper.ensureInitialized();
  p25.RegistrationAccountTypeMapper.ensureInitialized();
  p26.ConsultationCreateRequestModelMapper.ensureInitialized();
  p26.ConsultationCreateResponseModelMapper.ensureInitialized();
  p26.ConsultationStatusUpdateRequestModelMapper.ensureInitialized();
  p26.ConsultationStatusUpdateResponseModelMapper.ensureInitialized();
  p27.CaseAttachmentEntityMapper.ensureInitialized();
  p28.ConsultationCloseReasonMapper.ensureInitialized();
  p29.ConsultationRequestEntityMapper.ensureInitialized();
  p30.ConsultationStatusMapper.ensureInitialized();
  p31.AiRecommendRequestModelMapper.ensureInitialized();
  p31.AiRecommendFiltersModelMapper.ensureInitialized();
  p31.AiRecommendResponseModelMapper.ensureInitialized();
  p32.LegalSpecializationModelMapper.ensureInitialized();
  p33.AiClassificationRequestEntityMapper.ensureInitialized();
  p34.AiClassificationResultEntityMapper.ensureInitialized();
  p35.AiRecommendationEntityMapper.ensureInitialized();
  p36.DiscoveryRequestEntityMapper.ensureInitialized();
  p37.LegalSpecializationEntityMapper.ensureInitialized();
  p38.SpecificationItemEntityMapper.ensureInitialized();
  p39.LookupItemModelMapper.ensureInitialized();
  p40.LookupItemEntityMapper.ensureInitialized();
  p41.ChatItemModelMapper.ensureInitialized();
  p42.ChatItemEntityMapper.ensureInitialized();
  p43.ChatThreadEntityMapper.ensureInitialized();
  p44.MessageEntityMapper.ensureInitialized();
  p45.MessageTypeMapper.ensureInitialized();
  p46.DeviceTokenRequestModelMapper.ensureInitialized();
  p46.DeviceTokenResponseModelMapper.ensureInitialized();
  p47.NotificationModelMapper.ensureInitialized();
  p47.NotificationsResponseModelMapper.ensureInitialized();
  p47.NotificationsSeenResponseModelMapper.ensureInitialized();
  p48.NotificationEntityMapper.ensureInitialized();
  p49.NotificationResultMapper.ensureInitialized();
  p50.AvailabilityStatusMapper.ensureInitialized();
  p51.LawyerProfileEntityMapper.ensureInitialized();
  p52.ProfileEntityMapper.ensureInitialized();
  p53.SettingsRespWrapperMapper.ensureInitialized();
  p54.SettingItemEntityMapper.ensureInitialized();
  p55.SettingItemTypeMapper.ensureInitialized();
  p56.SettingSectionEntityMapper.ensureInitialized();
  p57.SupportReportRequestModelMapper.ensureInitialized();
  p57.SupportReportReviewRequestModelMapper.ensureInitialized();
  p57.SupportReportResponseModelMapper.ensureInitialized();
  p57.SupportReportReviewResponseModelMapper.ensureInitialized();
  p57.SupportTicketItemModelMapper.ensureInitialized();
  p57.SupportTicketsResponseModelMapper.ensureInitialized();
  p58.SupportTicketEntityMapper.ensureInitialized();
  p59.SupportTicketStatusMapper.ensureInitialized();
  p60.TrainingApplicationCreateRequestModelMapper.ensureInitialized();
  p60.TrainingApplicationCreateResponseModelMapper.ensureInitialized();
  p60.TrainingApplicationStatusUpdateRequestModelMapper.ensureInitialized();
  p60.TrainingApplicationStatusUpdateResponseModelMapper.ensureInitialized();
  p61.TrainingApplicationEntityMapper.ensureInitialized();
  p62.TrainingApplicationStatusMapper.ensureInitialized();
  p63.TrainingOpportunityEntityMapper.ensureInitialized();
  p64.VerificationRequestModelMapper.ensureInitialized();
  p64.VerificationResponseModelMapper.ensureInitialized();
  p65.LicenseVerificationEntityMapper.ensureInitialized();
  p66.VerificationStatusMapper.ensureInitialized();
}

