import 'dart:ui' as ui; // fallback locale

import 'package:easy_localization/easy_localization.dart';
import 'package:silah_app/core/config/router/global_navigator.dart';

class LocalUtils {
  /// Returns a display name based on the app’s current language.
  ///
  /// * If `EasyLocalization` hasn’t built yet we fall back to the platform’s
  ///   first locale (`ui.window.locale.languageCode`) or `"en"`.
  /// * Trims whitespace and swaps to the secondary value when the primary is
  ///   null / blank.
  static String generateLocalName({
    required String? localName,
    required String? foreignName,
    String? alternative,
  }) {
    final lang =
        rootNavigatorKey.currentContext?.locale.languageCode ??
        ui.PlatformDispatcher.instance.locale.languageCode;

    // Choose primary / secondary text

    final wantArabic = lang.toLowerCase().startsWith('ar');

    String? primary = wantArabic ? localName : foreignName;
    String? secondary = wantArabic ? foreignName : localName;

    // Clean & fall back
    primary = _clean(primary);
    secondary = _clean(secondary);

    return primary ?? secondary ?? alternative ?? '';
  }

  // Trim, then turn empty-string into null for convenience.
  static String? _clean(String? v) {
    if (v == null) return null;
    final t = v.trim();
    return t.isEmpty ? null : t;
  }
}
