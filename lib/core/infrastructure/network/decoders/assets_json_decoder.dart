import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<R> assetJsonCall<R>({
  required String methodName,
  required String assetPath,
  required void Function(Object error, StackTrace st) logError,
  MapperContainer? container,
}) async {
  final mapper = container ?? MapperContainer.globals;

  try {
    final jsonString = await rootBundle.loadString(assetPath);
    return mapper.fromJson<R>(jsonString);
  } on FlutterError catch (error, stack) {
    logError(error, stack);
    rethrow;
  } on MapperException catch (error, stack) {
    logError(error, stack);
    rethrow;
  }
}
