// lib/core/infrastructure/network/adapters/json_body_mappable_adapter.dart
import 'package:dart_mappable/dart_mappable.dart';
import 'package:retrofit/retrofit.dart';

/// Converts a `Future<dynamic>` (already JSON-decoded by Dio) into your model `T`.
class JsonBodyMappableAdapter<T>
    extends CallAdapter<Future<dynamic>, Future<T>> {
  final MapperContainer _container;

   JsonBodyMappableAdapter({MapperContainer? container})
      : _container = container ?? MapperContainer.globals;

  @override
  Future<T> adapt(Future<dynamic> Function() call) async {
    final dynamic data = await call();

    // Pass-through for dynamic
    if (T == dynamic) return data as T;

    // Fast paths for raw collections
    if ((T == Map || T == Map<String, dynamic>) && data is Map) {
      return data as T;
    }
    if (T == List && data is List) {
      return data as T;
    }

    // Be forgiving if some routes still return a raw JSON string
    if (data is String) {
      return _container.fromJson<T>(data);
    }

    // Default: map any JSON structure (Map/List) into T via dart_mappable
    return _container.fromValue<T>(data);
  }
}

/// Optional: use this if your generated private methods return HttpResponse<dynamic>
class JsonHttpResponseMappableAdapter<T>
    extends CallAdapter<Future<HttpResponse<dynamic>>, Future<T>> {
  final MapperContainer _container;

   JsonHttpResponseMappableAdapter({MapperContainer? container})
      : _container = container ?? MapperContainer.globals;

  @override
  Future<T> adapt(Future<HttpResponse<dynamic>> Function() call) async {
    final resp = await call();
    final data = resp.data;

    if (T == dynamic) return data as T;
    if ((T == Map || T == Map<String, dynamic>) && data is Map) {
      return data as T;
    }
    if (T == List && data is List) {
      return data as T;
    }
    if (data is String) {
      return _container.fromJson<T>(data);
    }
    return _container.fromValue<T>(data);
  }
}
