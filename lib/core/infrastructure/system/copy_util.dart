import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';

class CopyUtil {
  static void copyValue(String value, BuildContext context) {
    Clipboard.setData(ClipboardData(text: value));
    Toasts.success(
      context,
      Strings.copy_success.tr(namedArgs: {'code': value}),
    );
  }
}
