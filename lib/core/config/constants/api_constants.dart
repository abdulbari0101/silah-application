import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static const bool isDemoMode = bool.fromEnvironment('DEMO_MODE', defaultValue: false);

  static String get getEnvFileName => 'env/.env';

  //  Server 

  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';
}
