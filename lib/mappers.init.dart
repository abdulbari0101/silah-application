// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element

import 'core/data/local/cache/prefs/prefs_key.dart' as p0;
import 'core/data/local/cache/secure/secure_key.dart' as p1;
import 'core/data/model/api/auth/customer_model.dart' as p2;
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
import 'features/auth/domain/entities/auth_ex_data_entity.dart' as p29;
import 'features/consultations/data/models/request_item_model.dart' as p30;
import 'features/consultations/domain/entities/request_item_entity.dart' as p31;
import 'features/discovery/data/models/specification_item_model.dart' as p32;
import 'features/discovery/domain/entities/specification_item_entity.dart'
    as p33;
import 'features/messaging/data/models/chat_item_model.dart' as p34;
import 'features/messaging/domain/entities/chat_item_entity.dart' as p35;
import 'features/notifications/data/models/notification/notification_model.dart'
    as p36;
import 'features/notifications/domain/entities/notification/notification_entity.dart'
    as p37;
import 'features/notifications/domain/entities/notification/notification_group.dart'
    as p38;
import 'features/notifications/domain/entities/notification/notification_result.dart'
    as p39;
import 'features/profiles/domain/entities/availability_status.dart' as p40;
import 'features/profiles/domain/entities/lawyer_profile_entity.dart' as p41;
import 'features/profiles/domain/entities/profile_entity.dart' as p42;
import 'features/settings/data/models/settings_response_wrapper.dart' as p43;
import 'features/support/data/models/support_item_model.dart' as p44;
import 'features/support/domain/entities/support_item_entity.dart' as p45;
import 'features/training/domain/entities/training_application_entity.dart'
    as p46;
import 'features/training/domain/entities/training_application_status.dart'
    as p47;
import 'features/training/domain/entities/training_opportunity_entity.dart'
    as p48;
import 'features/verification/domain/entities/license_verification_entity.dart'
    as p49;
import 'features/verification/domain/entities/verification_status.dart' as p50;

void initializeMappers() {
  p0.PrefsKeyMapper.ensureInitialized();
  p1.SecureKeyMapper.ensureInitialized();
  p2.CustomerModelMapper.ensureInitialized();
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
  p29.ExDataAuthEntityMapper.ensureInitialized();
  p30.RequestItemModelMapper.ensureInitialized();
  p31.RequestItemEntityMapper.ensureInitialized();
  p32.SpecificationItemModelMapper.ensureInitialized();
  p33.SpecificationItemEntityMapper.ensureInitialized();
  p34.ChatItemModelMapper.ensureInitialized();
  p35.ChatItemEntityMapper.ensureInitialized();
  p36.NotificationModelMapper.ensureInitialized();
  p37.NotificationEntityMapper.ensureInitialized();
  p38.NotificationGroupMapper.ensureInitialized();
  p39.NotificationResultMapper.ensureInitialized();
  p40.AvailabilityStatusMapper.ensureInitialized();
  p41.LawyerProfileEntityMapper.ensureInitialized();
  p42.ProfileEntityMapper.ensureInitialized();
  p43.SettingsRespWrapperMapper.ensureInitialized();
  p44.SupportItemModelMapper.ensureInitialized();
  p45.SupportItemEntityMapper.ensureInitialized();
  p46.TrainingApplicationEntityMapper.ensureInitialized();
  p47.TrainingApplicationStatusMapper.ensureInitialized();
  p48.TrainingOpportunityEntityMapper.ensureInitialized();
  p49.LicenseVerificationEntityMapper.ensureInitialized();
  p50.VerificationStatusMapper.ensureInitialized();
}

