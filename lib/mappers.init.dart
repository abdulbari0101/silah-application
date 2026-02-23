// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element

import 'core/data/local/cache/prefs/prefs_key.dart' as p0;
import 'core/data/local/cache/secure/secure_key.dart' as p1;
import 'core/data/model/api/auth/token_model.dart' as p3;
import 'core/data/model/api/base/data_response_wrapper.dart' as p4;
import 'core/data/model/api/base/response_wrapper.dart' as p5;
import 'core/data/model/api/data_model.dart' as p6;
import 'core/data/model/api/offer_model.dart' as p7;
import 'core/data/model/api/request/post_request_model.dart' as p8;
import 'core/data/model/api/result_model.dart' as p9;
import 'core/data/model/local/app_setting_model.dart' as p10;
import 'core/data/model/local/user_setting_model.dart' as p11;
import 'core/domain/entities/api/auth/customer_entity.dart' as p12;
import 'core/domain/entities/api/offer_entity.dart' as p13;
import 'core/domain/entities/api/request/post_request_entity.dart' as p14;
import 'core/domain/entities/api/result_entity.dart' as p15;
import 'core/domain/entities/data_entity.dart' as p16;
import 'core/domain/entities/local/setting/app_setting_entity.dart' as p17;
import 'core/domain/entities/local/setting/user_setting_entity.dart' as p18;
import 'core/domain/enums/app_theme_mode.dart' as p19;
import 'core/presentation/state_magment/blocs/app_setting/app_setting_bloc.dart'
    as p20;
import 'core/presentation/state_magment/blocs/app_state/app_state_bloc.dart'
    as p21;
import 'core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart'
    as p22;
import 'core/presentation/state_magment/blocs/app_state/state_data/app_state_data.dart'
    as p23;
import 'features/admin/domain/entities/admin_task_entity.dart' as p24;
import 'features/admin/domain/entities/admin_task_status.dart' as p25;
import 'features/app_shell/data/models/intro_model.dart' as p26;
import 'features/app_shell/data/models/intro_response_wrapper.dart' as p27;
import 'features/app_shell/domain/entities/intro_entity.dart' as p28;
import 'features/auth/domain/entities/auth_user_entity.dart' as p69;
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
import 'features/discovery/domain/entities/legal_specialization_entity.dart'
    as p40;
import 'features/discovery/domain/entities/specification_item_entity.dart'
    as p41;
import 'features/lookups/data/models/lookup_item_model.dart' as p42;
import 'features/lookups/domain/entities/lookup_item_entity.dart' as p43;
import 'features/messaging/data/models/chat_item_model.dart' as p44;
import 'features/messaging/domain/entities/chat_item_entity.dart' as p45;
import 'features/messaging/domain/entities/chat_thread_entity.dart' as p46;
import 'features/messaging/domain/entities/message_entity.dart' as p47;
import 'features/messaging/domain/entities/message_type.dart' as p48;
import 'features/notifications/data/models/device_token_models.dart' as p49;
import 'features/notifications/data/models/notification/notification_model.dart'
    as p50;
import 'features/notifications/domain/entities/notification/notification_entity.dart'
    as p51;
import 'features/notifications/domain/entities/notification/notification_group.dart'
    as p52;
import 'features/notifications/domain/entities/notification/notification_result.dart'
    as p53;
import 'features/profiles/domain/entities/availability_status.dart' as p54;
import 'features/profiles/domain/entities/lawyer_profile_entity.dart' as p55;
import 'features/profiles/domain/entities/profile_entity.dart' as p56;
import 'features/settings/data/models/settings_response_wrapper.dart' as p57;
import 'features/settings/domain/entities/setting_item_entity.dart' as p58;
import 'features/settings/domain/entities/setting_item_type.dart' as p59;
import 'features/settings/domain/entities/setting_section_entity.dart' as p60;
import 'features/support/domain/entities/support_ticket_entity.dart' as p61;
import 'features/support/domain/entities/support_ticket_status.dart' as p62;
import 'features/training/domain/entities/training_application_entity.dart'
    as p63;
import 'features/training/domain/entities/training_application_status.dart'
    as p64;
import 'features/training/domain/entities/training_opportunity_entity.dart'
    as p65;
import 'features/verification/data/models/verification_models.dart' as p66;
import 'features/verification/domain/entities/license_verification_entity.dart'
    as p67;
import 'features/verification/domain/entities/verification_status.dart' as p68;

void initializeMappers() {
  p0.PrefsKeyMapper.ensureInitialized();
  p1.SecureKeyMapper.ensureInitialized();
  p3.TokenModelMapper.ensureInitialized();
  p4.DataRespWrapperMapper.ensureInitialized();
  p5.BaseRespWrapperMapper.ensureInitialized();
  p6.DataModelMapper.ensureInitialized();
  p7.OfferModelMapper.ensureInitialized();
  p8.PostRequestModelMapper.ensureInitialized();
  p9.ResultModelMapper.ensureInitialized();
  p10.AppSettingModelMapper.ensureInitialized();
  p11.UserSettingModelMapper.ensureInitialized();
  p12.CustomerEntityMapper.ensureInitialized();
  p13.OfferEntityMapper.ensureInitialized();
  p14.PostRequestEntityMapper.ensureInitialized();
  p15.ResultEntityMapper.ensureInitialized();
  p16.DataEntityMapper.ensureInitialized();
  p17.AppSettingEntityMapper.ensureInitialized();
  p18.UserSettingEntityMapper.ensureInitialized();
  p19.AppThemeModeMapper.ensureInitialized();
  p20.AppSettingEventMapper.ensureInitialized();
  p20.InjectAppSettingEventMapper.ensureInitialized();
  p20.GetAppSettingEventMapper.ensureInitialized();
  p20.ChangeThemeEventMapper.ensureInitialized();
  p20.ChangeLanguageEventMapper.ensureInitialized();
  p20.ChangeLocalEventMapper.ensureInitialized();
  p20.AppSettingStateMapper.ensureInitialized();
  p20.AppSettingInitialMapper.ensureInitialized();
  p20.AppSettingLoadingMapper.ensureInitialized();
  p20.AppSettingErrorMapper.ensureInitialized();
  p20.AppSettingLoadedMapper.ensureInitialized();
  p21.AppStateEventMapper.ensureInitialized();
  p21.UpdateSessionMapper.ensureInitialized();
  p21.UserLoggedInMapper.ensureInitialized();
  p21.InjectDataBeforeAppStartMapper.ensureInitialized();
  p21.SyncLocalDataToAppStateMapper.ensureInitialized();
  p21.AppStateStateMapper.ensureInitialized();
  p21.AppStateInitialMapper.ensureInitialized();
  p21.AppStateLoadedMapper.ensureInitialized();
  p22.UserAuthStatusMapper.ensureInitialized();
  p23.AppStateDataMapper.ensureInitialized();
  p24.AdminTaskEntityMapper.ensureInitialized();
  p25.AdminTaskStatusMapper.ensureInitialized();
  p26.IntroModelMapper.ensureInitialized();
  p27.IntroRespWrapperMapper.ensureInitialized();
  p28.IntroEntityMapper.ensureInitialized();
  p69.AuthAccountTypeMapper.ensureInitialized();
  p69.AuthUserEntityMapper.ensureInitialized();
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
  p40.LegalSpecializationEntityMapper.ensureInitialized();
  p41.SpecificationItemEntityMapper.ensureInitialized();
  p42.LookupItemModelMapper.ensureInitialized();
  p43.LookupItemEntityMapper.ensureInitialized();
  p44.ChatItemModelMapper.ensureInitialized();
  p45.ChatItemEntityMapper.ensureInitialized();
  p46.ChatThreadEntityMapper.ensureInitialized();
  p47.MessageEntityMapper.ensureInitialized();
  p48.MessageTypeMapper.ensureInitialized();
  p49.DeviceTokenRequestModelMapper.ensureInitialized();
  p49.DeviceTokenResponseModelMapper.ensureInitialized();
  p50.NotificationModelMapper.ensureInitialized();
  p51.NotificationEntityMapper.ensureInitialized();
  p52.NotificationGroupMapper.ensureInitialized();
  p53.NotificationResultMapper.ensureInitialized();
  p54.AvailabilityStatusMapper.ensureInitialized();
  p55.LawyerProfileEntityMapper.ensureInitialized();
  p56.ProfileEntityMapper.ensureInitialized();
  p57.SettingsRespWrapperMapper.ensureInitialized();
  p58.SettingItemEntityMapper.ensureInitialized();
  p59.SettingItemTypeMapper.ensureInitialized();
  p60.SettingSectionEntityMapper.ensureInitialized();
  p61.SupportTicketEntityMapper.ensureInitialized();
  p62.SupportTicketStatusMapper.ensureInitialized();
  p63.TrainingApplicationEntityMapper.ensureInitialized();
  p64.TrainingApplicationStatusMapper.ensureInitialized();
  p65.TrainingOpportunityEntityMapper.ensureInitialized();
  p66.VerificationRequestModelMapper.ensureInitialized();
  p66.VerificationResponseModelMapper.ensureInitialized();
  p67.LicenseVerificationEntityMapper.ensureInitialized();
  p68.VerificationStatusMapper.ensureInitialized();
}

