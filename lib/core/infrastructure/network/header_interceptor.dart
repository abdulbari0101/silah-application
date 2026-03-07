import 'package:dio/dio.dart';
import 'package:silah_app/core/config/extentions/string_validation.dart';
import 'package:silah_app/core/data/local/cache/readers/auth_readers.dart';
import 'package:silah_app/core/data/model/extenstions/token_model_extenstion.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/system/app_info_service.dart';

class HeaderInterceptor extends Interceptor {
  final SessionReader authCacheReader;
  final AppLogger logger;
  final AppInfoService appInfoService;

  HeaderInterceptor({
    required this.authCacheReader,
    required this.logger,
    required this.appInfoService,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final token = await authCacheReader.loginToken();
      options.headers.addAll({'Accept': 'application/json'});

      final bearerToken = token.bearerToken;
      if (bearerToken != null && bearerToken.trim().isNotNullOrEmpty) {
        options.headers['Authorization'] = bearerToken;
      }
    } catch (error, stack) {
      logger.networkError(
        tag: 'HeaderInterceptor.onRequest',
        error,
        stack: stack,
      );
    }
    handler.next(options);
  }
}
