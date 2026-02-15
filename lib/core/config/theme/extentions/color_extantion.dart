import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

extension ColorHelper on Color {
  Color withAlphaOpacity(double opacity) => withValues(alpha: opacity.clamp(0.0, 1.0));

  Color onDark(bool isDark, Color darkColor) => isDark ? darkColor : this;
  Color onDarkLighter(bool isDark, int percent) => isDark ? lighter(percent) : this;
  Color onDarkDarker(bool isDark, int percent) => isDark ? darker(percent) : this;
  Color onLightDarker(bool isDark, int percent) => isDark ? this : darker(percent);
  Color onLightLighter(bool isDark, int percent) => isDark ? this : lighter(percent);

  Color lighter(int percent) {
    assert(percent >= 1 && percent <= 100);
    final double origA = a;                     // 0..1 alpha
    final hct = Hct.fromInt(toARGB32());        // build from current color
    hct.tone = (hct.tone + percent).clamp(0.0, 100.0);
    return Color(hct.toInt()).withValues(alpha: origA);
  }

  Color darker(int percent) {
    assert(percent >= 1 && percent <= 100);
    final double origA = a;
    final hct = Hct.fromInt(toARGB32());
    hct.tone = (hct.tone - percent).clamp(0.0, 100.0);
    return Color(hct.toInt()).withValues(alpha: origA);
  }

  // --------- Blending / mixing ---------
  /// Simple RGBA lerp. For brand harmony, prefer [harmonizeWith].
  Color? mix(Color other, double t) => Color.lerp(this, other, t);

  /// Material 3 brand harmony: shift this color’s hue toward [source].
  Color harmonizeWith(Color source) =>
      Color(Blend.harmonize(toARGB32(), source.toARGB32())).withValues(alpha: a);

  // --------- Utilities ---------
  /// Returns #AARRGGBB (always 8 hex digits).
  String get asHexString => '#${toARGB32().toRadixString(16).padLeft(8, '0').toUpperCase()}';
}
