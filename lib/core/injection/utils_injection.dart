import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:silah_app/core/config/localization/locale_manager.dart';
import 'package:silah_app/core/config/theme/navigation_theme_util.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/platform/device_info_helper.dart';
import 'package:silah_app/core/infrastructure/platform/device_serial_service.dart';
import 'package:silah_app/core/infrastructure/system/app_info_service.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/core/infrastructure/system/session_timeout_service.dart';

import 'injection_container.dart';

Future<void> initUtils() async {
  locator.registerLazySingleton<AppLogger>(() => AppLogger());

  locator.registerLazySingleton(() => DeviceInfoPlugin());
  locator.registerSingletonAsync<PackageInfo>(() async => PackageInfo.fromPlatform());

  locator.registerSingletonWithDependencies<AppInfoService>(
    () => AppInfoServiceImpl(logger: locator(), packageInfo: locator<PackageInfo>()),

    dependsOn: [PackageInfo],
  );

  locator.registerLazySingleton<DeviceSerialService>(
    () => DeviceSerialServiceImpl(deviceInfo: locator()),
  );

  // LocaleManager
  locator.registerLazySingleton<LocaleManager>(() => LocaleManagerImpl(logger: locator()));

  locator.registerLazySingleton<DeviceInfoHelper>(
    () => DeviceInfoHelper(
      deviceInfo: locator(),
      settingReaer: locator(),
      identityRepo: locator(),
      sesstionReader: locator(),
      logger: locator(),
    ),
  );

  locator.registerLazySingleton<NavigationThemeUtil>(() => NavigationThemeUtil());

  /// locator.registerLazySingleton(() => SesstionReader(appCache: locator()));

  locator.registerLazySingleton(
    () => Executor(networkInfo: locator(), logger: locator(), authCacheReader: locator()),
  );

  locator.registerLazySingleton(() => SessionTimeoutService());
}
