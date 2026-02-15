// lib/core/infrastructure/network/json_body_mappable_adapter.dart
import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:retrofit/retrofit.dart';

/// Converts a `Future<String>` (text/plain body) into your model `T`.
class PlainTextJsonAdapter<T> extends CallAdapter<Future<String>, Future<T>> {
  @override
  Future<T> adapt(Future<String> Function() call) async {
    // 1  fetch text response
    final String raw = await call();

    // 2  parse it
    final Map<String, dynamic> map = jsonDecode(raw);

    // 3  return either the map itself or a mapped model
    if (T == Map || T == dynamic) {
      return map as T;
    }
    return MapperContainer.globals.fromValue<T>(map);
  }
}
