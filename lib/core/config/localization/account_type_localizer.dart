import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';

class AccountTypeLocalizer {
  AccountTypeLocalizer._();

  static String? label(BuildContext context, String? accountType) {
    switch (accountType?.trim().toLowerCase()) {
      case 'admin':
        return Strings.account_type_admin.tr();
      case 'lawyer':
        return Strings.account_type_lawyer.tr();
      case 'user':
        return Strings.account_type_user.tr();
      default:
        return null;
    }
  }
}
