import 'package:dio/dio.dart';
import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/data/model/api/base/response_wrapper.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/dio_error_handler.dart';
import 'package:silah_app/core/infrastructure/errors/response_error_handler.dart';

Future<BaseApiResponse<R>> handleBaseApiResponse<R extends BaseRespWrapper>({
  required String method,
  required Future<BaseApiResponse<R>> Function() call,
  required AppLogger logger,
}) async {
  try {
    final res = await call();

    final err = ResponseErrorHandler.handle(baseResObject: res);
    if (err != null) throw err;

    return res;
  } on DioException catch (error, stack) {
    logger.apiError(tag: method, error, stack: stack);
    throw DioErrorHandler.handle(error);
  }
}
