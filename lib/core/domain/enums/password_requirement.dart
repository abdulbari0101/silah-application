import 'package:silah_app/core/config/localization/localizations_string_keys.dart';

enum PasswordRequirement {
  exactly6Digits(Strings.exactly_6_digits),
  noRepeatingDigits(Strings.no_repeating_digits),
  noOldPasswordReuse(Strings.no_old_password_reuse);
  // noGuessablePassword(Strings.no_guessable_password),

  final text;
  const PasswordRequirement(this.text);
}
