import 'package:easy_localization/easy_localization.dart';
import 'package:silah_app/core/config/extentions/string_validation.dart';

import '../../config/localization/localizations_string_keys.dart';

class TextUtil {
  static isEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  static String generateDefaultCustomerName({required String customerAccount, bool? isRtl}) {
    final shortName = Strings.app_short_name.tr(); // e.g., "Finture"
    final userLabel = Strings.user.tr(); // e.g., "User" or "حساب"

    isRtl = isRtl ?? Intl.getCurrentLocale().startsWith('ar');
    // If Arabic, format: "حساب Finture 05321"
    if (isRtl) {
      return "$userLabel $shortName $customerAccount";
    }

    // If English or others, format: "Finture User 05321"
    return "$shortName $userLabel $customerAccount";
  }
}

extension StringNoteExt on String? {
  String? sanitizeNoteText() {
    if (this == null) return null;

    var value = this;

    // 1) remove new lines (CR / LF) => replace with single space
    value = value?.replaceAll(RegExp(r'[\r\n]+'), ' ');

    // 2) remove disallowed characters like & * $ # @
    value = value?.replaceAll(RegExp(r'[&*\$#@]'), '');

    // 3) normalize spaces & trim
    value = value?.replaceAll(RegExp(r'\s+'), ' ').trim();

    // if everything got stripped out, don't send an empty string
    return value.isNullOrEmpty ? null : value;
  }
}
