import 'package:silah_app/core/config/localization/localizations_string_keys.dart';

enum ForgetPassStateType {
  RestPassword,
  ReSendMobile,
  ResetConfirm;

  String get errorTitleKey {
    switch (this) {
      case ForgetPassStateType.RestPassword:
        return Strings.err_reset_pass;
      case ForgetPassStateType.ReSendMobile:
        return Strings.error_resend_mobile_request;
      case ForgetPassStateType.ResetConfirm:
        return Strings.error_mobile_confirm;
    }
  }
}
