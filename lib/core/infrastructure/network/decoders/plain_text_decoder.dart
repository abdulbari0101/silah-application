import 'package:dart_mappable/dart_mappable.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' show HttpResponse;
import 'package:silah_app/core/infrastructure/errors/dio_error_handler.dart';

Future<R> plainTextCall<R>({
  required String methodName,
  required Future<HttpResponse<String>> Function() call,
  required void Function(Object error, StackTrace st) logError,
  MapperContainer? container,
}) async {
  final mapper = container ?? MapperContainer.globals;

  try {
    final raw = await call();
    return mapper.fromJson<R>(raw.data);
  } on MapperException catch (error, stack) {
    logError(error, stack);
    rethrow;
  } on DioException catch (error, stack) {
    logError(error, stack);
    throw DioErrorHandler.handle(error);
  }
}
