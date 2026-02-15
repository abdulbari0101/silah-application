import 'package:silah_app/core/config/localization/localizations_string_keys.dart';

enum SelfRegOperType {
  Token,
  MobileRquest,
  ReSendMobileRquest,
  MobileConfirm,
  EmailRquest,
  ReSendEmailRquest,
  EmailConfirm,
  FillFormWithoutEmail,
  SelfReqComplete;

  String get errorTitleKey {
    switch (this) {
      case SelfRegOperType.MobileRquest:
        return Strings.error_mobile_request;
      case SelfRegOperType.ReSendMobileRquest:
        return Strings.error_resend_mobile_request;
      case SelfRegOperType.MobileConfirm:
        return Strings.error_mobile_confirm;
      case SelfRegOperType.FillFormWithoutEmail:
        return Strings.error_email_request;
      case SelfRegOperType.EmailRquest:
        return Strings.error_email_request;
      case SelfRegOperType.ReSendEmailRquest:
        return Strings.error_resend_email_request;
      case SelfRegOperType.EmailConfirm:
        return Strings.error_email_confirm;
      default:
        return Strings.error_self_reg;
    }
  }
}
