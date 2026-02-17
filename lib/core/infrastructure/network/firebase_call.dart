import 'package:firebase_core/firebase_core.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/firebase_error_handler.dart';

Future<T> firebaseCall<T>({
  required String method,
  required AppLogger logger,
  required Future<T> Function() call,
}) async {
  try {
    return await call();
  } on FirebaseException catch (e, stack) {
    logger.apiError(tag: method, e, stack: stack);
    throw FirebaseErrorHandler.handle(e);
  } catch (e, stack) {
    logger.apiError(tag: method, e, stack: stack);
    rethrow;
  }
}
