import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

extension FintureSchemeX on ColorScheme {
  // Brand-like variants
  bool get isDark => brightness == Brightness.dark;

  Color get shimmerBase => brightness == Brightness.dark
      ? const Color(0xFF3A3A3A)
      : const Color(0xFFE0E0E0);
  Color get shimmerHighlight => brightness == Brightness.dark
      ? const Color(0xFF4F4F4F)
      : const Color(0xFFF5F5F5);

  Color get blackOrWhite =>
      brightness == Brightness.dark ? Colors.white : Colors.black;

  // Old helpers
  Color greyDark({bool reverse = false}) => brightness == Brightness.dark
      ? (reverse ? Colors.grey[800]! : Colors.grey[300]!)
      : (reverse ? Colors.grey[300]! : Colors.grey[800]!);

  Color get greyLight => isDark ? Colors.grey[300]! : Colors.grey[500]!;

  Color get disabled =>
      onSurface.withAlphaOpacity(0.38); // M3 disabled guidance

  Color get lightBlue1 => (primaryContainer.mix(surface, 0.05))!;
  Color get lightBlue2 => (primaryContainer.mix(surface, 0.15))!;
  Color get lightBlue3 => (primaryContainer.mix(surface, 0.30))!;
  Color get lightBlue4 => (primaryContainer.mix(surface, 0.45))!;
}
