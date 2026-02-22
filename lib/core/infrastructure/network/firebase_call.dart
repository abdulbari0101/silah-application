import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/firebase_error_handler.dart';

Future<T> firebaseCall<T>({
  required String method,
  required AppLogger logger,
  required Future<T> Function() call,
  Object? payload,
}) async {
  final start = DateTime.now();
  logger.databaseDebug(
    _formatRequest(method: method, payload: payload),
    tag: 'Firebase',
  );
  try {
    final result = await call();
    final elapsed = DateTime.now().difference(start);
    logger.databaseDebug(
      _formatResponse(method: method, result: result, elapsed: elapsed),
      tag: 'Firebase',
    );
    return result;
  } on FirebaseException catch (e, stack) {
    logger.apiError(tag: method, e, stack: stack);
    throw FirebaseErrorHandler.handle(e);
  } catch (e, stack) {
    logger.apiError(tag: method, e, stack: stack);
    rethrow;
  }
}

String _formatRequest({required String method, Object? payload}) {
  final safePayload = _sanitize(payload);
  final payloadStr = _shortJson(safePayload);
  return '--> FIREBASE $method${payloadStr.isEmpty ? '' : '\n$payloadStr'}\n--> END FIREBASE';
}

String _formatResponse({
  required String method,
  required Object? result,
  required Duration elapsed,
}) {
  final summary = _summarize(result);
  return '<-- FIREBASE $method (${elapsed.inMilliseconds}ms)\n$summary\n<-- END FIREBASE';
}

String _shortJson(Object? value) {
  if (value == null) return '';
  try {
    return const JsonEncoder().convert(value);
  } catch (_) {
    return value.toString();
  }
}

Object? _sanitize(Object? value) {
  if (value is Map) {
    return value.map((key, val) {
      final k = key.toString();
      return MapEntry(k, _maskIfNeeded(k, _sanitize(val)));
    });
  }
  if (value is List) {
    return value.map(_sanitize).toList();
  }
  return value;
}

Object? _maskIfNeeded(String key, Object? value) {
  final lowered = key.toLowerCase();
  if (lowered.contains('password') ||
      lowered.contains('token') ||
      lowered.contains('nationalid') ||
      lowered.contains('license') ||
      lowered == 'email' ||
      lowered == 'phone') {
    return '***';
  }
  return value;
}

String _summarize(Object? value) {
  if (value == null) return 'null';
  if (value is List) return 'List(len=${value.length})';
  if (value is Map) return 'Map(keys=${value.keys.toList()})';
  final str = value.toString();
  if (str.length > 500) {
    return '${str.substring(0, 500)}...';
  }
  return str;
}
