import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';

/// A wrapper around Dio's HttpClientAdapter using Http2Adapter,
/// allowing optional disabling of certificate validation.
class DioAdapter {
  final AppLogger logger;

  DioAdapter({required this.logger});

  /// Returns an Http2Adapter that ignores certificate validation.
  /// Only use in development or test environments.
  HttpClientAdapter adapterWithoutCertificateCheck({bool logBypass = true}) {
    if (logBypass) {
      logger.networkWarn(
        '⚠️ Certificate validation is disabled. Do NOT use this in production.',
      );
    }

    return Http2Adapter(
      ConnectionManager(
        idleTimeout: const Duration(seconds: 10),
        onClientCreate: (_, config) {
          config.onBadCertificate = (_) => true;
        },
      ),
    );
  }

  /// Returns a Dio adapter with client certificate support using SecurityContext.
  HttpClientAdapter adapterWithClientCertificate({
    required String caPath,
    required String certPath,
    required String keyPath,
  }) {
    final context = SecurityContext()
      ..setTrustedCertificates(caPath)
      ..useCertificateChain(certPath)
      ..usePrivateKey(keyPath);

    return Http2Adapter(
      ConnectionManager(
        idleTimeout: const Duration(seconds: 60),
        onClientCreate: (_, config) {
          config.context = context;
        },
      ),
    );
  }
}
