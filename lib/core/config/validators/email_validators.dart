import 'package:easy_localization/easy_localization.dart';
import 'package:form_validation/form_validation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';

class RequiredEmailValidator extends ValueValidator {
  @override
  String get type => 'required_email';

  @override
  String? validate({required String label, required String? value}) {
    if (value == null || value.trim().isEmpty) {
      return Strings.error_enter_email.tr();
    }
    return null;
  }

  @override
  Map<String, dynamic> toJson() => {'type': type};
}

class EmailFormatValidator extends ValueValidator {
  static final _emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$", caseSensitive: false);

  @override
  String get type => 'email_format';

  @override
  String? validate({required String label, required String? value}) {
    if (value != null && !_emailRegex.hasMatch(value)) {
      return Strings.error_invalid_email.tr();
    }
    return null;
  }

  @override
  Map<String, dynamic> toJson() => {'type': type};
}
