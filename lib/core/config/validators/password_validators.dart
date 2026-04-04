import 'package:easy_localization/easy_localization.dart';
import 'package:form_validation/form_validation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';

bool _digitsOnly(String s) => RegExp(r'^\d+$').hasMatch(s);

class RequiredPasswordValidator extends ValueValidator {
  @override
  String get type => 'required_password';

  @override
  String? validate({required String label, required String? value}) =>
      (value == null || value.isEmpty)
      ? Strings.error_enter_password.tr()
      : null;

  @override
  Map<String, dynamic> toJson() => {'type': type};
}

class MinLengthPasswordValidator extends ValueValidator {
  final int length;
  MinLengthPasswordValidator({this.length = 6});

  @override
  String get type => 'min_length_password';

  @override
  String? validate({required String label, required String? value}) =>
      (value?.isNotEmpty == true && value!.length < length)
      ? Strings.password_min_length_error.tr(namedArgs: {'length': '$length'})
      : null;

  @override
  Map<String, dynamic> toJson() => {'type': type, 'length': length};
}

class MaxLengthPasswordValidator extends ValueValidator {
  final int length;
  MaxLengthPasswordValidator({this.length = 6});

  @override
  String get type => 'max_length_password';

  @override
  String? validate({required String label, required String? value}) =>
      (value?.isNotEmpty == true && value!.length > length)
      ? Strings.password_max_length_error.tr(namedArgs: {'length': '$length'})
      : null;

  @override
  Map<String, dynamic> toJson() => {'type': type, 'length': length};
}

class NumberOnlyPasswordValidator extends ValueValidator {
  @override
  String get type => 'number_only_password';

  @override
  String? validate({required String label, required String? value}) =>
      (value?.isNotEmpty == true && !_digitsOnly(value!))
      ? Strings.password_number_only_error.tr()
      : null;

  @override
  Map<String, dynamic> toJson() => {'type': type};
}

class ConsecutiveRepeatingDigitsValidator extends ValueValidator {
  @override
  String get type => 'consecutive_repeating_digits';

  @override
  String? validate({required String label, required String? value}) {
    if (value == null || value.isEmpty) return null;
    for (int i = 0; i < value.length - 2; i++) {
      final a = int.parse(value[i]),
          b = int.parse(value[i + 1]),
          c = int.parse(value[i + 2]);
      if (b == a + 1 && c == b + 1)
        return Strings.password_consecutive_error.tr();
      if (a == b && b == c) return Strings.password_repeating_error.tr();
    }
    return null;
  }

  @override
  Map<String, dynamic> toJson() => {'type': type};
}
