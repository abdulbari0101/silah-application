import 'package:dio/dio.dart';
import 'package:silah_app/core/config/constants/api_constants.dart';
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
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      

      final token = await  authCacheReader.loginToken();

      final versionEither = await appInfoService.getAppVersion();
      final version = versionEither.fold((l) {
        logger.appWarn('getVersion failed: $l');
        return "1.0.0";
      }, (r) => r);

      final timestamp = DateTime.now().millisecondsSinceEpoch.toString();

      options.headers.addAll({
        'AppVer': version,
        'Timestamp': timestamp,
        'Accept': 'application/json',
      });

      if (!options.path.contains('token')) {
        options.headers.addAll({
          'MobileVersion': version,
          //'MobileVersion': "2.5.0",
        });

        if (token.bearerToken != null) {
          options.headers['Authorization'] = token.bearerToken;
        }
      }
    } catch (error, stack) {
      logger.networkError(tag: 'HeaderInterceptor.onRequest', error, stack: stack);
    }

    if (!ApiConstants.isDemoMode) {
      handler.next(options);
      return;
    }
  }
}
