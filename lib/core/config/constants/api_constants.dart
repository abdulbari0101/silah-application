import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static const bool isDemoMode = bool.fromEnvironment('DEMO_MODE', defaultValue: false);

  static String get getEnvFileName => 'env/.env';

  //  Server 

  static String get baseUrl {
    final raw = dotenv.env['BASE_URL'] ?? '';
    return _normalizeAndroidEmulatorLocalhost(raw);
  }

  static String _normalizeAndroidEmulatorLocalhost(String raw) {
    if (raw.isEmpty || kIsWeb) {
      return raw;
    }
    if (defaultTargetPlatform != TargetPlatform.android) {
      return raw;
    }

    final uri = Uri.tryParse(raw);
    if (uri == null) {
      return raw;
    }

    final host = uri.host;
    if (host == 'localhost' || host == '127.0.0.1') {
      return uri.replace(host: '10.0.2.2').toString();
    }

    return raw;
  }
}
