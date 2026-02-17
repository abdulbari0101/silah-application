import 'package:silah_app/core/config/localization/localizations_string_keys.dart';

enum LoginOperationType {
  signIn;

  String get errorTitleKey {
    return Strings.err_login;
  }
}
