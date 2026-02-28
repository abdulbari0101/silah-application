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
import 'core/presentation/state_magment/blocs/app_setting/app_setting_bloc.dart'
    as p18;
import 'core/presentation/state_magment/blocs/app_state/app_state_bloc.dart'
    as p19;
import 'core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart'
    as p20;
import 'core/presentation/state_magment/blocs/app_state/state_data/app_state_data.dart'
    as p21;
import 'features/admin/domain/entities/admin_task_entity.dart' as p22;
import 'features/admin/domain/entities/admin_task_status.dart' as p23;
import 'features/app_shell/data/models/intro_model.dart' as p24;
import 'features/app_shell/data/models/intro_response_wrapper.dart' as p25;
import 'features/app_shell/domain/entities/intro_entity.dart' as p26;
import 'features/auth/data/models/auth_user_model.dart' as p27;
import 'features/auth/domain/entities/auth_user_entity.dart' as p28;
import 'features/auth/domain/entities/registration_payload.dart' as p29;
import 'features/consultations/data/models/consultation_models.dart' as p30;
import 'features/consultations/domain/entities/case_attachment_entity.dart'
    as p31;
import 'features/consultations/domain/entities/consultation_close_reason.dart'
    as p32;
import 'features/consultations/domain/entities/consultation_request_entity.dart'
    as p33;
import 'features/consultations/domain/entities/consultation_status.dart' as p34;
import 'features/discovery/data/models/ai_models.dart' as p35;
import 'features/discovery/data/models/legal_specialization_model.dart' as p36;
import 'features/discovery/domain/entities/ai_classification_request_entity.dart'
    as p37;
import 'features/discovery/domain/entities/ai_classification_result_entity.dart'
    as p38;
import 'features/discovery/domain/entities/ai_recommendation_entity.dart'
    as p39;
import 'features/discovery/domain/entities/discovery_request_entity.dart'
    as p40;
import 'features/discovery/domain/entities/legal_specialization_entity.dart'
    as p41;
import 'features/discovery/domain/entities/specification_item_entity.dart'
    as p42;
import 'features/lookups/data/models/lookup_item_model.dart' as p43;
import 'features/lookups/domain/entities/lookup_item_entity.dart' as p44;
import 'features/messaging/data/models/chat_item_model.dart' as p45;
import 'features/messaging/domain/entities/chat_item_entity.dart' as p46;
import 'features/messaging/domain/entities/chat_thread_entity.dart' as p47;
import 'features/messaging/domain/entities/message_entity.dart' as p48;
import 'features/messaging/domain/entities/message_type.dart' as p49;
import 'features/notifications/data/models/device_token_models.dart' as p50;
import 'features/notifications/data/models/notification/notification_model.dart'
    as p51;
import 'features/notifications/domain/entities/notification/notification_entity.dart'
    as p52;
import 'features/notifications/domain/entities/notification/notification_group.dart'
    as p53;
import 'features/notifications/domain/entities/notification/notification_result.dart'
    as p54;
import 'features/profiles/domain/entities/availability_status.dart' as p55;
import 'features/profiles/domain/entities/lawyer_profile_entity.dart' as p56;
import 'features/profiles/domain/entities/profile_entity.dart' as p57;
import 'features/settings/data/models/settings_response_wrapper.dart' as p58;
import 'features/settings/domain/entities/setting_item_entity.dart' as p59;
import 'features/settings/domain/entities/setting_item_type.dart' as p60;
import 'features/settings/domain/entities/setting_section_entity.dart' as p61;
import 'features/support/data/models/support_report_models.dart' as p62;
import 'features/support/domain/entities/support_ticket_entity.dart' as p63;
import 'features/support/domain/entities/support_ticket_status.dart' as p64;
import 'features/training/data/models/training_models.dart' as p65;
import 'features/training/domain/entities/training_application_entity.dart'
    as p66;
import 'features/training/domain/entities/training_application_status.dart'
    as p67;
import 'features/training/domain/entities/training_opportunity_entity.dart'
    as p68;
import 'features/verification/data/models/verification_models.dart' as p69;
import 'features/verification/domain/entities/license_verification_entity.dart'
    as p70;
import 'features/verification/domain/entities/verification_status.dart' as p71;

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
  p18.AppSettingEventMapper.ensureInitialized();
  p18.InjectAppSettingEventMapper.ensureInitialized();
  p18.GetAppSettingEventMapper.ensureInitialized();
  p18.ChangeThemeEventMapper.ensureInitialized();
  p18.ChangeLanguageEventMapper.ensureInitialized();
  p18.ChangeLocalEventMapper.ensureInitialized();
  p18.AppSettingStateMapper.ensureInitialized();
  p18.AppSettingInitialMapper.ensureInitialized();
  p18.AppSettingLoadingMapper.ensureInitialized();
  p18.AppSettingErrorMapper.ensureInitialized();
  p18.AppSettingLoadedMapper.ensureInitialized();
  p19.AppStateEventMapper.ensureInitialized();
  p19.UpdateSessionMapper.ensureInitialized();
  p19.UserLoggedInMapper.ensureInitialized();
  p19.InjectDataBeforeAppStartMapper.ensureInitialized();
  p19.SyncLocalDataToAppStateMapper.ensureInitialized();
  p19.AppStateStateMapper.ensureInitialized();
  p19.AppStateInitialMapper.ensureInitialized();
  p19.AppStateLoadedMapper.ensureInitialized();
  p20.UserAuthStatusMapper.ensureInitialized();
  p21.AppStateDataMapper.ensureInitialized();
  p22.AdminTaskEntityMapper.ensureInitialized();
  p23.AdminTaskStatusMapper.ensureInitialized();
  p24.IntroModelMapper.ensureInitialized();
  p25.IntroRespWrapperMapper.ensureInitialized();
  p26.IntroEntityMapper.ensureInitialized();
  p27.AuthUserModelMapper.ensureInitialized();
  p28.AuthUserEntityMapper.ensureInitialized();
  p28.AuthAccountTypeMapper.ensureInitialized();
  p29.RegistrationPayloadMapper.ensureInitialized();
  p29.RegistrationAccountTypeMapper.ensureInitialized();
  p30.ConsultationCreateRequestModelMapper.ensureInitialized();
  p30.ConsultationCreateResponseModelMapper.ensureInitialized();
  p30.ConsultationStatusUpdateRequestModelMapper.ensureInitialized();
  p30.ConsultationStatusUpdateResponseModelMapper.ensureInitialized();
  p31.CaseAttachmentEntityMapper.ensureInitialized();
  p32.ConsultationCloseReasonMapper.ensureInitialized();
  p33.ConsultationRequestEntityMapper.ensureInitialized();
  p34.ConsultationStatusMapper.ensureInitialized();
  p35.AiClassifyRequestModelMapper.ensureInitialized();
  p35.AiClassifyResponseModelMapper.ensureInitialized();
  p35.AiRecommendRequestModelMapper.ensureInitialized();
  p35.AiRecommendFiltersModelMapper.ensureInitialized();
  p35.AiRecommendResponseModelMapper.ensureInitialized();
  p36.LegalSpecializationModelMapper.ensureInitialized();
  p37.AiClassificationRequestEntityMapper.ensureInitialized();
  p38.AiClassificationResultEntityMapper.ensureInitialized();
  p39.AiRecommendationEntityMapper.ensureInitialized();
  p40.DiscoveryRequestEntityMapper.ensureInitialized();
  p41.LegalSpecializationEntityMapper.ensureInitialized();
  p42.SpecificationItemEntityMapper.ensureInitialized();
  p43.LookupItemModelMapper.ensureInitialized();
  p44.LookupItemEntityMapper.ensureInitialized();
  p45.ChatItemModelMapper.ensureInitialized();
  p46.ChatItemEntityMapper.ensureInitialized();
  p47.ChatThreadEntityMapper.ensureInitialized();
  p48.MessageEntityMapper.ensureInitialized();
  p49.MessageTypeMapper.ensureInitialized();
  p50.DeviceTokenRequestModelMapper.ensureInitialized();
  p50.DeviceTokenResponseModelMapper.ensureInitialized();
  p51.NotificationModelMapper.ensureInitialized();
  p52.NotificationEntityMapper.ensureInitialized();
  p53.NotificationGroupMapper.ensureInitialized();
  p54.NotificationResultMapper.ensureInitialized();
  p55.AvailabilityStatusMapper.ensureInitialized();
  p56.LawyerProfileEntityMapper.ensureInitialized();
  p57.ProfileEntityMapper.ensureInitialized();
  p58.SettingsRespWrapperMapper.ensureInitialized();
  p59.SettingItemEntityMapper.ensureInitialized();
  p60.SettingItemTypeMapper.ensureInitialized();
  p61.SettingSectionEntityMapper.ensureInitialized();
  p62.SupportReportRequestModelMapper.ensureInitialized();
  p62.SupportReportResponseModelMapper.ensureInitialized();
  p63.SupportTicketEntityMapper.ensureInitialized();
  p64.SupportTicketStatusMapper.ensureInitialized();
  p65.TrainingApplicationCreateRequestModelMapper.ensureInitialized();
  p65.TrainingApplicationCreateResponseModelMapper.ensureInitialized();
  p65.TrainingApplicationStatusUpdateRequestModelMapper.ensureInitialized();
  p65.TrainingApplicationStatusUpdateResponseModelMapper.ensureInitialized();
  p66.TrainingApplicationEntityMapper.ensureInitialized();
  p67.TrainingApplicationStatusMapper.ensureInitialized();
  p68.TrainingOpportunityEntityMapper.ensureInitialized();
  p69.VerificationRequestModelMapper.ensureInitialized();
  p69.VerificationResponseModelMapper.ensureInitialized();
  p70.LicenseVerificationEntityMapper.ensureInitialized();
  p71.VerificationStatusMapper.ensureInitialized();
}

