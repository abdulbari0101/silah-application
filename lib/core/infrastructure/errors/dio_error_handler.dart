// lib/core/infrastructure/errors/dio_error_handler.dart
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../config/localization/localizations_string_keys.dart';
import '../analytics/logger/app_logger.dart';
import 'error_codes.dart';
import 'exceptions.dart';

class DioErrorHandler {
  static final _log = AppLogger();

  static ServerException handle(DioException e) {
    try {
      final int? status = e.response?.statusCode;

      switch (e.type) {
        // ---- TIMEOUTS -------------------------------------------------------
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return TimeoutException(
            Strings.err_conn_timeout.tr(),
            ErrorCodes.requestTimeout408,
          );

        // ---- CANCELLED ------------------------------------------------------
        case DioExceptionType.cancel:
          // Treat as user-aborted; keep 408 semantics you had, but with a clearer message.
          return ServerException(
            Strings.err_request_cancelled.tr(),
            ErrorCodes.requestTimeout408,
          );

        // ---- TLS / CERT -----------------------------------------------------
        case DioExceptionType.badCertificate:
          return CertificateException(
            Strings.err_in_certificate.tr(),
            ErrorCodes.sslCertificateErr495,
          );

        // ---- HTTP BAD RESPONSE ---------------------------------------------
        case DioExceptionType.badResponse:
          return _mapHttpResponse(e);

        // ---- TRANSPORT LAYER ------------------------------------------------
        case DioExceptionType.connectionError:
          final err = e.error;
          if (err is SocketException) {
            return _mapSocket(err);
          }
          // Unknown transport failure → generic network
          return NetworkException(
            Strings.server_unreachable.tr(),
            ErrorCodes.noInternetNegtive100,
          );

        // ---- UNKNOWN BUCKET -------------------------------------------------
        case DioExceptionType.unknown:
          final err = e.error;

          if (err is HandshakeException || err is TlsException) {
            return CertificateException(
              Strings.err_in_certificate.tr(),
              ErrorCodes.sslCertificateErr495,
            );
          }
          if (err is FormatException) {
            return ServerException(
              Strings.parse_error.tr(),
              ErrorCodes.internalServer500,
            );
          }
          if (err is SocketException) {
            return _mapSocket(err);
          }

          // If an HTTP response actually exists, fall back to HTTP mapping WITHOUT parsing server body.
          if (e.response != null) {
            final code = status ?? ErrorCodes.internalServer500;
            return _mapHttpStatus(code, _httpStatusFallback(code));
          }

          // Last resort: generic network
          return NetworkException(
            Strings.server_unreachable.tr(),
            ErrorCodes.noInternetNegtive100,
          );
      }
    } catch (ex, stack) {
      // Use positional arg for tag to avoid named+positional mix.
      _log.networkError(tag:'DioErrorHandler.handle', ex, stack: stack);
      return ServerException(
        Strings.err_error_occured.tr(),
        ErrorCodes.internalServer500,
      );
    }
  }

  // -------------------------- HELPERS ---------------------------------------

  // NOTE: _bestServerMessage REMOVED intentionally (server response parsing handled elsewhere).

  static ServerException _mapHttpResponse(DioException e) {
    final int status = e.response?.statusCode ?? ErrorCodes.internalServer500;
    final data = e.response?.data;

    // Empty or missing payload (some proxies return 200/204 with empty body even on errors)
    if (data == null ||
        (data is String && data.trim().isEmpty) ||
        (data is List && data.isEmpty)) {
      return ServerException(Strings.empty_response.tr(), status);
    }

    // Do NOT inspect/parse server body here. Use only fallback by status.
    final msg = _httpStatusFallback(status);
    return _mapHttpStatus(status, msg);
  }

  static ServerException _mapHttpStatus(int status, String message) {
    switch (status) {
      case ErrorCodes.unauthorized401:
        return SessionException(message, status);

      case ErrorCodes.forbidden403:
        return ServerException(message, status);

      case ErrorCodes.badRequest400:
        return BadRequestException(Strings.err_bad_request.tr(), status);

      case ErrorCodes.requestTimeout408:
        return TimeoutException(Strings.err_conn_timeout.tr(), status);

      case ErrorCodes.conflict409:
        return ConflictException(message, status);

      case 413: // Payload Too Large
      case 415: // Unsupported Media Type
        return BadRequestException(Strings.err_bad_request.tr(), status);

      case 429: // Rate-limited
        return ServerException(Strings.rate_limited.tr(), status);

      case 500:
      case 502: // Bad Gateway
      case ErrorCodes.serviceUnavailable503:
      case ErrorCodes.gatewayTimeout504:
        return ServerException(message, status);

      case ErrorCodes.notFound404:
      case ErrorCodes.unprocessable422:
      default:
        return ServerException(Strings.err_error_occured.tr(), status);
    }
  }

  /// DNS/transport heuristics with OS errno support.
  /// Returns specific messages and uses `errno` when available; otherwise your negative codes.
  static ServerException _mapSocket(SocketException se) {
    final int? errno = se.osError?.errorCode;
    final String msg = se.message.toLowerCase();

    // --- Timeouts ---
    if (errno == ErrorCodes.requestTimedOut110 || msg.contains('timed out') || msg.contains('timeout')) {
      final code = errno ?? ErrorCodes.requestTimedOut110; // prefer 110 over 408 here
      return TimeoutException(Strings.request_timeout.tr(), code);
    }

    // --- DNS / host lookup failures ---
    if (errno == ErrorCodes.dnsFailed7 ||
        msg.contains('failed host lookup') || msg.contains('hostname') || msg.contains('getaddrinfo')) {
      final code = errno ?? ErrorCodes.dnsFailed7;
      return NetworkException(Strings.host_lookup_failed.tr(), code);
    }

    // --- Connection refused ---
    if (errno == ErrorCodes.connectionRefused111 || msg.contains('refused')) {
      final code = errno ?? ErrorCodes.connectionRefused111;
      return NetworkException(Strings.connection_refused.tr(), code);
    }

    // --- Network/Host unreachable ---
    if (errno == ErrorCodes.networkUnreachable101 ||
        errno == ErrorCodes.hostUnreachable113 ||
        msg.contains('unreachable') || msg.contains('no route')) {
      final code = errno ?? ErrorCodes.networkUnreachable101;
      return NetworkException(Strings.network_unreachable.tr(), code);
    }

    // --- Peer reset / aborted / broken pipe / EOF ---
    if (errno == ErrorCodes.connectionReset104 ||
        errno == ErrorCodes.connectionAborted103 ||
        errno == ErrorCodes.brokenPipe32 ||
        msg.contains('connection reset') ||
        msg.contains('reset by peer') ||
        msg.contains('broken pipe') ||
        msg.contains('eof')) {
      final code =
          errno ??
          (msg.contains('broken pipe')
              ? ErrorCodes.brokenPipe32
              : ErrorCodes.connectionReset104);
      return ServerException(Strings.connection_reset.tr(), code);
    }

    // --- Fallback: generic server unreachable ---
    return NetworkException(
      Strings.server_unreachable.tr(),
      errno ?? ErrorCodes.noInternetNegtive100,
    );
  }

  /// Safe fallbacks for raw HTTP statuses when the server doesn't send a message.
  static String _httpStatusFallback(int status) {
    switch (status) {
      case 401:
        return Strings.err_unauthorized401.tr();
      case 408:
        return Strings.request_timeout.tr();
      case 429:
        return Strings.rate_limited.tr();
      default:
        return Strings.err_internal_server.tr();
    }
  }
}
