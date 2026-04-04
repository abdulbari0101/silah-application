// lib/core/infrastructure/network/custom_log_interceptor.dart
// Slim log interceptor that funnels all HTTP traffic through AppLogger.
// Response JSON is kept on **one single line** to avoid giant multi‑line logs.
// Request JSON can still be indented for readability.

import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';

class CustomLogInterceptor extends Interceptor {
  CustomLogInterceptor({AppLogger? logger}) : _log = logger ?? AppLogger();

  final AppLogger _log;

  String _jsonStr(Object? data, {bool pretty = true}) {
    try {
      final obj = data is String ? jsonDecode(data) : data;
      return pretty
          ? const JsonEncoder.withIndent(' ').convert(obj) // multi-line
          : const JsonEncoder().convert(obj); // single-line
    } catch (_) {
      return data?.toString() ?? '';
    }
  }

  int _byteLength(Object? data) {
    try {
      if (data == null) return 0;
      if (data is Uint8List) return data.length;
      final str = data is String ? data : jsonEncode(data);
      return utf8.encode(str).length;
    } catch (_) {
      return data.toString().length;
    }
  }

  /*────────────────────────── REQUEST ─────────────────────────*/
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final uri = options.uri;
    final method = options.method.toUpperCase();

    // _log.networkDebug(uri.toString(), tag: 'uri');
    // _log.networkDebug(options.data, tag: 'options');
    // _log.networkDebug(options.headers, tag: 'headers');

    final buf = StringBuffer()..writeln('--> $method $uri');
    //_writeHeaders(buf, options.headers);

    final headerLen = _byteLength(options.headers);

    if (headerLen > 0)
      buf.writeln("header:${_jsonStr(options.headers, pretty: true)}");

    final bodyLen = _byteLength(options.data);
    if (bodyLen > 0)
      buf.writeln("body: ${_jsonStr(options.data, pretty: false)}");

    buf.writeln('--> END $method ($bodyLen-byte body)');

    _log.networkDebug(buf.toString(), tag: 'Request');
    super.onRequest(options, handler);
  }

  /*────────────────────────── RESPONSE ────────────────────────*/
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final status = response.statusCode;
    final uri = response.requestOptions.uri;

    final buf = StringBuffer()..writeln('<-- $status $uri');
    //_writeHeaders(buf, response.headers.map);

    final bodyLen = _byteLength(response.data);
    if (bodyLen > 0)
      buf.writeln(_jsonStr(response.data, pretty: false)); // compact
    buf.writeln('<-- END HTTP ($bodyLen-byte body)');

    _log.networkDebug(buf.toString(), tag: 'Response');
    super.onResponse(response, handler);
  }

  /*────────────────────────── ERROR ───────────────────────────*/
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final uri = err.requestOptions.uri;

    final buf = StringBuffer()
      ..writeln('<-- ERROR $uri')
      ..writeln(err.message);

    if (err.response?.data != null) buf.writeln(_jsonStr(err.response?.data));
    buf.writeln('<-- END ERROR');

    _log.networkError(buf.toString(), stack: err.stackTrace);
    super.onError(err, handler);
  }
}
