import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'app_theme_mode.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.lowerCase)
enum AppThemeMode { system, light, dark }

extension AppThemeModeX on AppThemeMode {
  /// Map to Flutter's ThemeMode
  ThemeMode toFlutter() => switch (this) {
        AppThemeMode.system => ThemeMode.system,
        AppThemeMode.light  => ThemeMode.light,
        AppThemeMode.dark   => ThemeMode.dark,
      };

  /// Return explicit Brightness, or null if following system.
  Brightness? toBrightnessOrNull() => switch (this) {
        AppThemeMode.system => null,
        AppThemeMode.light  => Brightness.light,
        AppThemeMode.dark   => Brightness.dark,
      };

  /// Resolve to an effective Brightness given the current platform brightness.
  Brightness resolve(Brightness platformBrightness) => switch (this) {
        AppThemeMode.system => platformBrightness,
        AppThemeMode.light  => Brightness.light,
        AppThemeMode.dark   => Brightness.dark,
      };

  /// Resolve using a BuildContext. Falls back to platformDispatcher if needed.
  Brightness resolveFrom(BuildContext context) =>
      resolve(
        MediaQuery.maybePlatformBrightnessOf(context) ??
        WidgetsBinding.instance.platformDispatcher.platformBrightness,
      );

  /// Quick helper
  bool isDark(Brightness platformBrightness) =>
      resolve(platformBrightness) == Brightness.dark;

  /// Reverse mapping
  static AppThemeMode fromFlutter(ThemeMode m) => switch (m) {
        ThemeMode.system => AppThemeMode.system,
        ThemeMode.light  => AppThemeMode.light,
        ThemeMode.dark   => AppThemeMode.dark,
      };
}
