import 'package:silah_app/core/config/localization/localizations_string_keys.dart';

enum LoginOperationType {
  /// Login
  LoginToken,
  Login,
  LoginTokenAfterSelfReg,

  /// otp states
  RequestPhoneOTP,
  ReSendPhoneOTP,
  ConfirmPhoneOTP,

  /// Change Password

  ChangePassword,
  ChangePin;

  String get errorTitleKey {
    switch (this) {
      case LoginOperationType.RequestPhoneOTP:
        return Strings.error_mobile_request;
      case LoginOperationType.ReSendPhoneOTP:
        return Strings.error_resend_mobile_request;
      case LoginOperationType.ConfirmPhoneOTP:
        return Strings.error_mobile_confirm;

      case LoginOperationType.LoginToken:
        return Strings.error_mobile_request;
      case LoginOperationType.Login:
        return Strings.error_mobile_request;
      case LoginOperationType.LoginTokenAfterSelfReg:
        return Strings.error_mobile_request;

      case LoginOperationType.ChangePassword:
        return Strings.error_mobile_request;
      case LoginOperationType.ChangePin:
        return Strings.err_change_secret_code;
    }
  }
}
