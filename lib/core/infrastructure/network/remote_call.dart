import 'package:dio/dio.dart';

import '../analytics/logger/app_logger.dart';
import '../errors/dio_error_handler.dart';

/// Generic remote wrapper: normalizes Dio errors and logs unexpected ones.
Future<T> remoteCall<T>(Future<T> Function() body) async {
  try {
    return await body();
  } on DioException catch (e, stack) {
    AppLogger().apiError(tag: 'remoteCall', e, stack: stack);
    throw DioErrorHandler.handle(e);
  } catch (e, stack) {
    AppLogger().apiError(tag: 'remoteCall', e, stack: stack);
    rethrow;
  }
}
