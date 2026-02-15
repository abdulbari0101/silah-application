import 'package:easy_localization/easy_localization.dart';
import 'package:form_validation/form_validation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';

class RequiredNameValidator extends ValueValidator {
  @override
  String get type => 'required_name';

  @override
  String? validate({required String label, required String? value}) {
    if (value == null || value.trim().isEmpty) {
      return Strings.error_enter_name.tr();
    }
    return null;
  }

  @override
  Map<String, dynamic> toJson() => {'type': type};
}

class JustRequiredValidator extends ValueValidator {
  @override
  String get type => 'required_name';

  @override
  String? validate({required String label, required String? value}) {
    if (value == null || value.trim().isEmpty) {
      return label;
    }
    return null;
  }

  @override
  Map<String, dynamic> toJson() => {'type': type};
}

class NameFormatValidator extends ValueValidator {
  static final _nameRegex = RegExp(r"^[a-zA-ZçÇğĞıİöÖşŞüÜ\u0600-\u06FF\s'-]{2,50}$");

  @override
  String get type => 'name_format';

  @override
  String? validate({required String label, required String? value}) {
    if (value != null && !_nameRegex.hasMatch(value.trim())) {
      return Strings.error_invalid_name.tr();
    }
    return null;
  }

  @override
  Map<String, dynamic> toJson() => {'type': type};
}
