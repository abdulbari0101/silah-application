import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/color_scheme_ext.dart';

class ThemeGradients {
  final ColorScheme colors;

  ThemeGradients({required this.colors});

  bool get isDark => colors.isDark;

  // Primary & Accent gradients
  LinearGradient get primaryGradient =>
      LinearGradient(colors: [colors.primary, colors.primary.withAlpha(220)]);

  LinearGradient get secondaryGradient => LinearGradient(
    colors: [colors.primaryContainer, colors.surfaceContainerLow],
  );

  LinearGradient get primaryToSurfaceGradient =>
      LinearGradient(colors: [colors.primary, colors.surface]);

  // Based on theme mode (light/dark) and optional reverse flag
  LinearGradient primarySecondryGradient({bool reverse = false}) => isDark
      ? (reverse ? primaryGradient : secondaryGradient)
      : (reverse ? secondaryGradient : primaryGradient);
}
