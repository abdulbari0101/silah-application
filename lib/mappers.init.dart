// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element

import 'core/data/local/cache/prefs/prefs_key.dart' as p0;
import 'core/data/local/cache/secure/secure_key.dart' as p1;
import 'core/data/model/api/auth/token_model.dart' as p2;
import 'core/data/model/api/base/data_response_wrapper.dart' as p3;
import 'core/data/model/api/base/response_wrapper.dart' as p4;
import 'core/data/model/api/data_model.dart' as p5;
import 'core/data/model/api/offer_model.dart' as p6;
import 'core/data/model/api/request/post_request_model.dart' as p7;
import 'core/data/model/api/result_model.dart' as p8;
import 'core/data/model/local/app_setting_model.dart' as p9;
import 'core/data/model/local/user_setting_model.dart' as p10;
import 'core/domain/entities/api/auth/customer_entity.dart' as p11;
import 'core/domain/entities/api/offer_entity.dart' as p12;
import 'core/domain/entities/api/request/post_request_entity.dart' as p13;
import 'core/domain/entities/api/result_entity.dart' as p14;
import 'core/domain/entities/data_entity.dart' as p15;
import 'core/domain/entities/local/setting/app_setting_entity.dart' as p16;
import 'core/domain/entities/local/setting/user_setting_entity.dart' as p17;
import 'core/domain/enums/app_theme_mode.dart' as p18;
import 'core/presentation/state_magment/blocs/app_setting/app_setting_bloc.dart'
    as p19;
import 'core/presentation/state_magment/blocs/app_state/app_state_bloc.dart'
    as p20;
import 'core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart'
    as p21;
import 'core/presentation/state_magment/blocs/app_state/state_data/app_state_data.dart'
    as p22;
import 'features/admin/domain/entities/admin_task_entity.dart' as p23;
import 'features/admin/domain/entities/admin_task_status.dart' as p24;
import 'features/app_shell/data/models/intro_model.dart' as p25;
import 'features/app_shell/data/models/intro_response_wrapper.dart' as p26;
import 'features/app_shell/domain/entities/intro_entity.dart' as p27;
import 'features/auth/data/models/auth_user_model.dart' as p28;
import 'features/auth/domain/entities/auth_user_entity.dart' as p29;
import 'features/auth/domain/entities/registration_payload.dart' as p30;
import 'features/consultations/data/models/consultation_models.dart' as p31;
import 'features/consultations/domain/entities/case_attachment_entity.dart'
    as p32;
import 'features/consultations/domain/entities/consultation_close_reason.dart'
    as p33;
import 'features/consultations/domain/entities/consultation_request_entity.dart'
    as p34;
import 'features/consultations/domain/entities/consultation_status.dart' as p35;
import 'features/discovery/data/models/ai_models.dart' as p36;
import 'features/discovery/data/models/legal_specialization_model.dart' as p37;
import 'features/discovery/domain/entities/ai_classification_request_entity.dart'
    as p38;
import 'features/discovery/domain/entities/ai_classification_result_entity.dart'
    as p39;
import 'features/discovery/domain/entities/ai_recommendation_entity.dart'
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
  p3.DataRespWrapperMapper.ensureInitialized();
  p4.BaseRespWrapperMapper.ensureInitialized();
  p5.DataModelMapper.ensureInitialized();
  p6.OfferModelMapper.ensureInitialized();
  p7.PostRequestModelMapper.ensureInitialized();
  p8.ResultModelMapper.ensureInitialized();
  p9.AppSettingModelMapper.ensureInitialized();
  p10.UserSettingModelMapper.ensureInitialized();
  p11.CustomerEntityMapper.ensureInitialized();
  p12.OfferEntityMapper.ensureInitialized();
  p13.PostRequestEntityMapper.ensureInitialized();
  p14.ResultEntityMapper.ensureInitialized();
  p15.DataEntityMapper.ensureInitialized();
  p16.AppSettingEntityMapper.ensureInitialized();
  p17.UserSettingEntityMapper.ensureInitialized();
  p18.AppThemeModeMapper.ensureInitialized();
  p19.AppSettingEventMapper.ensureInitialized();
  p19.InjectAppSettingEventMapper.ensureInitialized();
  p19.GetAppSettingEventMapper.ensureInitialized();
  p19.ChangeThemeEventMapper.ensureInitialized();
  p19.ChangeLanguageEventMapper.ensureInitialized();
  p19.ChangeLocalEventMapper.ensureInitialized();
  p19.AppSettingStateMapper.ensureInitialized();
  p19.AppSettingInitialMapper.ensureInitialized();
  p19.AppSettingLoadingMapper.ensureInitialized();
  p19.AppSettingErrorMapper.ensureInitialized();
  p19.AppSettingLoadedMapper.ensureInitialized();
  p20.AppStateEventMapper.ensureInitialized();
  p20.UpdateSessionMapper.ensureInitialized();
  p20.UserLoggedInMapper.ensureInitialized();
  p20.InjectDataBeforeAppStartMapper.ensureInitialized();
  p20.SyncLocalDataToAppStateMapper.ensureInitialized();
  p20.AppStateStateMapper.ensureInitialized();
  p20.AppStateInitialMapper.ensureInitialized();
  p20.AppStateLoadedMapper.ensureInitialized();
  p21.UserAuthStatusMapper.ensureInitialized();
  p22.AppStateDataMapper.ensureInitialized();
  p23.AdminTaskEntityMapper.ensureInitialized();
  p24.AdminTaskStatusMapper.ensureInitialized();
  p25.IntroModelMapper.ensureInitialized();
  p26.IntroRespWrapperMapper.ensureInitialized();
  p27.IntroEntityMapper.ensureInitialized();
  p28.AuthUserModelMapper.ensureInitialized();
  p29.AuthUserEntityMapper.ensureInitialized();
  p29.AuthAccountTypeMapper.ensureInitialized();
  p30.RegistrationPayloadMapper.ensureInitialized();
  p30.RegistrationAccountTypeMapper.ensureInitialized();
  p31.ConsultationCreateRequestModelMapper.ensureInitialized();
  p31.ConsultationCreateResponseModelMapper.ensureInitialized();
  p31.ConsultationStatusUpdateRequestModelMapper.ensureInitialized();
  p31.ConsultationStatusUpdateResponseModelMapper.ensureInitialized();
  p32.CaseAttachmentEntityMapper.ensureInitialized();
  p33.ConsultationCloseReasonMapper.ensureInitialized();
  p34.ConsultationRequestEntityMapper.ensureInitialized();
  p35.ConsultationStatusMapper.ensureInitialized();
  p36.AiClassifyRequestModelMapper.ensureInitialized();
  p36.AiClassifyResponseModelMapper.ensureInitialized();
  p36.AiRecommendRequestModelMapper.ensureInitialized();
  p36.AiRecommendFiltersModelMapper.ensureInitialized();
  p36.AiRecommendResponseModelMapper.ensureInitialized();
  p37.LegalSpecializationModelMapper.ensureInitialized();
  p38.AiClassificationRequestEntityMapper.ensureInitialized();
  p39.AiClassificationResultEntityMapper.ensureInitialized();
  p40.AiRecommendationEntityMapper.ensureInitialized();
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

