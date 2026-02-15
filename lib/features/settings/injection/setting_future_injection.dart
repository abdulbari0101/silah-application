import 'package:silah_app/core/config/constants/api_constants.dart';
import 'package:silah_app/core/domain/repositories/app_setting_repo.dart';
import 'package:silah_app/core/infrastructure/network/dio_client.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/settings/data/repositories/app_settings_repo_impl.dart';
import 'package:silah_app/features/settings/data/repositories/user_settings_repo_impl.dart';
import 'package:silah_app/features/settings/domain/repositories/user_setting_repo.dart';
import 'package:silah_app/features/settings/presentation/blocs/user_setting/user_setting_bloc.dart';

import '../data/datasources/remote/settings_remote_data_source.dart';
import '../data/datasources/remote/settings_service.dart';
//! Features -Settings

Future<void> initSettings() async {
  // Bloc

  locator.registerLazySingleton(
    () => UserSettingBloc(settingRep: locator(), appStateBloc: locator()),
  );
  // Repo
  locator.registerLazySingleton<AppSettingsRepo>(
    () => AppSettingsRepoImpl(
      remoteDS: locator(),
      cacheDS: locator(),
      executor: locator(),
      deviceInfoHelper: locator(),
    ),
  );

  locator.registerLazySingleton<UserSettingsRepo>(
    () => UserSettingsRepoImpl(
      remoteDS: locator(),
      cacheDS: locator(),
      executor: locator(),
      deviceInfoHelper: locator(),
    ),
  );

  locator.registerLazySingleton<SettingsRemoteDataSource>(
    () => SettingsRemoteDataSourceImpl(settingsService: locator(), logger: locator()),
  );

  // Settings services
  locator.registerLazySingleton(
    () => SettingsService(locator<DioClient>().dio, baseUrl: ApiConstants.baseUrl),
  );
}
