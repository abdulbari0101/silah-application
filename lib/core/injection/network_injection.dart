import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:silah_app/core/data/local/cache/readers/auth_readers.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/custom_log_interceptor.dart';
import 'package:silah_app/core/infrastructure/network/dio_adpater.dart';
import 'package:silah_app/core/infrastructure/network/dio_client.dart';
import 'package:silah_app/core/infrastructure/network/header_interceptor.dart';
import 'package:silah_app/core/infrastructure/network/network_info.dart';
import 'package:silah_app/core/infrastructure/system/app_info_service.dart';

import 'injection_container.dart';

Future<void> initNetwork() async {
  //  await locator.isReady<CoreCacheDataSource>();
  await locator.isReady<AppInfoService>();

  locator.registerLazySingleton(() => DioAdapter(logger: locator()));

  void registerClient() {
    // For slow / unstable networks (e.g. Yemen)
    const _kConnectTimeout = Duration(seconds: 25);
    const _kSendTimeoutRegular = Duration(seconds: 40); // Normal APIs
    const _kReceiveTimeoutRegular = Duration(seconds: 50);

    final dio = Dio(
      BaseOptions(
        connectTimeout: _kConnectTimeout,
        sendTimeout: _kSendTimeoutRegular,
        receiveTimeout: _kReceiveTimeoutRegular,
        responseType: ResponseType.json,
        headers: const {'Accept': 'application/json', 'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.addAll([
      HeaderInterceptor(
        authCacheReader: locator<SessionReader>(),
        appInfoService: locator<AppInfoService>(),
        logger: locator<AppLogger>(),
      ),
      if (!kReleaseMode) CustomLogInterceptor(),
    ]);

    locator.registerLazySingleton<Dio>(() => dio);

    locator.registerLazySingleton<DioClient>(
      () => DioClient(
        dio: locator<Dio>(),
        authCacheReader: locator<SessionReader>(),
        appInfoService: locator<AppInfoService>(),
        logger: locator<AppLogger>(),
      ),
    );
  }

  registerClient();

  locator.registerLazySingleton(() => Connectivity());
  locator.registerLazySingleton<Netwokinfo>(() => NetworkIfnoImpl(locator()));
}
