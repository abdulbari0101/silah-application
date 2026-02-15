import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/color_scheme_ext.dart';

class ThemeGradients {
  final ColorScheme colors;

  ThemeGradients({required this.colors});

  bool get isDark => colors.isDark;

  // Primary & Accent gradients
  LinearGradient get primaryGradient =>
      const LinearGradient(colors: [Color(0xFF1C75B9), Color(0xFF1C78BE)]);

  LinearGradient get secondaryGradient =>
      const LinearGradient(colors: [Color(0xFFE7F2FC), Color(0xFFDAE9F9)]);

  LinearGradient get primaryToSurfaceGradient =>
      LinearGradient(colors: [colors.primary, const Color(0xFFFAFAFA)]);

  // Based on theme mode (light/dark) and optional reverse flag
  LinearGradient primarySecondryGradient({bool reverse = false}) => isDark
      ? (reverse ? primaryGradient : secondaryGradient)
      : (reverse ? secondaryGradient : primaryGradient);
}
