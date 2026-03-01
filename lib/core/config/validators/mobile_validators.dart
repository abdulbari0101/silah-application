import 'package:easy_localization/easy_localization.dart';
import 'package:form_validation/form_validation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/foundation/formatting/phone_utils.dart';

/// Checks the number starts with a valid KSA mobile prefix.
///   • Saudi Arabia (+966) → starts with 5 ( 5XXXXXXXX (9 digits) or 05XXXXXXXX (10 digits) )
class NetworkPrefixMobileValidator extends ValueValidator {
  @override
  String get type => 'network_prefix_mobile';

  @override
  String? validate({required String label, required String? value}) {
    if (value == null || value.trim().isEmpty) return null;

    final input = value.trim();

    if (!PhoneUtils.hasValidPrefix(input)) {
      return Strings.error_invalid_mobile_prefix.tr(
        namedArgs: {'prefixes': PhoneUtils.localPrefixesString},
      );
    }

    return null;
  }

  @override
  Map<String, dynamic> toJson() => {'type': type};
}

/// Ensures a mobile number is supplied.
class RequiredMobileValidator extends ValueValidator {
  @override
  String get type => 'required_mobile';

  @override
  String? validate({required String label, required String? value}) {
    if (value == null || value.isEmpty) {
      return Strings.error_enter_mobile.tr();
    }
    return null;
  }

  @override
  Map<String, dynamic> toJson() => {'type': type};
}

get LengthMobileValidator => _LengthWithZeroPrefixMobileValidator();

/// AppConstants.mobileLength,
/// allowing an optional leading 0.
class _LengthWithZeroPrefixMobileValidator extends ValueValidator {
  @override
  String get type => 'length_mobile';

  @override
  String? validate({required String label, required String? value}) {
    if (value == null || value.isEmpty) return null;

    if (!PhoneUtils.hasValidLength(value.trim())) {
      return Strings.error_invalid_mobile_length.tr();
    }
    return null;
  }

  @override
  Map<String, dynamic> toJson() => {'type': type};
}

class _LengthMobileValidator extends ValueValidator {
  @override
  String get type => 'length_mobile';

  @override
  String? validate({required String label, required String? value}) {
    if (value == null || value.isEmpty) return null;

    if (!PhoneUtils.hasValidLength(value.trim())) {
      return Strings.error_invalid_mobile_length.tr();
    }
    return null;
  }

  @override
  Map<String, dynamic> toJson() => {'type': type};
}
