import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:silah_app/core/data/local/cache/readers/auth_readers.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/header_interceptor.dart';
import 'package:silah_app/core/infrastructure/system/app_info_service.dart';

class DioClient {
  final Dio dio;
  final SesstionReader authCacheReader;
  final AppInfoService appInfoService;
  final AppLogger logger;
  SecurityContext? mainContext;

  DioClient({
    required this.dio,
    required this.authCacheReader,
    required this.logger,
    required this.appInfoService,
  }) {
    _configureHttpClient();


    _initializeInterceptors();
  }

  void _initializeInterceptors() {
    dio.interceptors.add(
      HeaderInterceptor(
        authCacheReader: authCacheReader,
        logger: logger,
        appInfoService: appInfoService,
      ),
    );
  }

  void _configureHttpClient() {
    final adapter = IOHttpClientAdapter();
    mainContext = SecurityContext(withTrustedRoots: true);
    adapter.onHttpClientCreate = (HttpClient client) {
      return HttpClient(context: mainContext)
        ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    };
    dio.httpClientAdapter = adapter;
  }
}
