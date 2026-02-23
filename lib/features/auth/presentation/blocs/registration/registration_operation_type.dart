import 'package:silah_app/core/config/localization/localizations_string_keys.dart';

enum RegistrationOperType {
  SelfReqComplete;

  String get errorTitleKey {
    return Strings.error_self_reg;
  }
}
