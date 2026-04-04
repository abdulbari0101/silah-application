import 'package:easy_localization/easy_localization.dart';
import 'package:form_validation/form_validation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/validators/mobile_validators.dart';

import 'email_validators.dart';
import 'name_validators.dart';
import 'password_validators.dart';

/// Combines a list of [String? Function(String?)] validators into a single validator.
String? Function(String?) validateCombine(
  List<String? Function(String?)> validators,
) {
  return (String? value) {
    for (final validator in validators) {
      final result = validator(value);
      if (result != null) return result;
    }
    return null;
  };
}

/// Runs required + length mobile validations.
String? validateMobileDefault(String? value, {String? label}) {
  final validator = Validator(
    validators: [
      RequiredMobileValidator(),
      NetworkPrefixMobileValidator(),
      LengthMobileValidator,
    ],
  );

  return validator.validate(
    label: label ?? Strings.mobile_number.tr(),
    value: value,
  );
}

/// Validates required mobile + length + not own number.

String? validateMobileTransfer(
  String? value, {
  required String? currentUserMobile,
  String? label,
}) {
  if (currentUserMobile == null) {
    return Strings.msg_phone_number_missing.tr();
  }

  final validator = Validator(
    validators: [
      RequiredMobileValidator(),
      NetworkPrefixMobileValidator(),
      LengthMobileValidator,
    ],
  );

  return validator.validate(
    label: label ?? Strings.mobile_number.tr(),
    value: value,
  );
}

/// passord validation

String? validateCurrentPassword({
  required String? currentPassword,
  String? label,
}) {
  final validator = Validator(validators: [RequiredPasswordValidator()]);

  return validator.validate(
    label: label ?? Strings.password.tr(),
    value: currentPassword,
  );
}

String? validateNewPassword({required String? newValue, String? label}) {
  final validator = Validator(validators: [RequiredPasswordValidator()]);

  return validator.validate(
    label: label ?? Strings.password.tr(),
    value: newValue,
  );
}

String? validateConfirmNewPassword({
  required String? newValue,
  required String? confirmValue,
  String? label,
}) {
  final passwordError = validateNewPassword(
    newValue: confirmValue,
    label: null,
  );
  if (passwordError != null) return passwordError;

  if (confirmValue == null || confirmValue.isEmpty) {
    return 'confirmNewPassword';
  }

  if (newValue != confirmValue) {
    return Strings.confirming_wrong_password.tr();
  }

  return null;
}

// email validations

/// Validates optional email: empty is valid, non-empty must be a valid email format.
String? validateOptionalEmail(String? value, {String? label}) {
  if (value == null || value.trim().isEmpty) return null;

  final validator = Validator(validators: [EmailFormatValidator()]);

  return validator.validate(
    label: label ?? Strings.email_address_label.tr(),
    value: value,
  );
}

/// Validates required email: must be non-empty and match email format.
String? validateRequiredEmail(String? value, {String? label}) {
  final validator = Validator(
    validators: [RequiredEmailValidator(), EmailFormatValidator()],
  );

  return validator.validate(
    label: label ?? Strings.email_address_label.tr(),
    value: value,
  );
}

String? validateName(String? value, {String? label}) {
  final validator = Validator(
    validators: [RequiredNameValidator(), NameFormatValidator()],
  );
  return validator.validate(
    label: label ?? Strings.name_title.tr(),
    value: value,
  );
}

String? validateJustRequired(String? value, {String? label}) {
  final validator = Validator(validators: [JustRequiredValidator()]);
  return validator.validate(
    label: label ?? Strings.required_field.tr(),
    value: value,
  );
}
