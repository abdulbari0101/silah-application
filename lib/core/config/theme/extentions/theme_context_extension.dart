import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silah_app/core/config/theme/roles/shapes.dart';
import 'package:silah_app/core/config/theme/theme_gradiants.dart';
import 'package:silah_app/core/domain/enums/app_theme_mode.dart';
import 'package:silah_app/core/presentation/ui/styles/shadow.dart';

import '../theme_controller.dart';
import 'brand_palette_ex.dart';
import 'semantic_colors.dart';

export 'package:silah_app/core/config/theme/extentions/color_extantion.dart';
export 'package:silah_app/core/config/theme/extentions/color_scheme_ext.dart';
export 'package:silah_app/core/config/theme/roles/shapes.dart';

extension ThemeContextX on BuildContext {
  bool get isDarkTheme => read<ThemeController>().isDark;
  // If you want the widget to rebuild on theme change

  bool get isDarkThemeWatch => watch<ThemeController>().isDark;

  bool get isLightTheme => read<ThemeController>().isLight;
  // If you want the widget to rebuild on theme change

  bool get isLightThemeWatch => watch<ThemeController>().isLight;

  bool get isSystemTheme => read<ThemeController>().isSystem;
  // If you want the widget to rebuild on theme change

  bool get isSystemThemeWatch => watch<ThemeController>().isSystem;

  AppThemeMode get appAppThemeMode => read<ThemeController>().appAppThemeMode;
  // If you want the widget to rebuild on theme change

  AppThemeMode get appAppThemeModeWatch => watch<ThemeController>().appAppThemeMode;

  /// ColorScheme is the new single source of truth (Material 3).
  /// Theme.of(context) is an InheritedWidget; callers will rebuild on theme changes.
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => Theme.of(this).colorScheme;
  IconThemeData get iconsTheme => Theme.of(this).iconTheme;
  InputDecorationThemeData get inputTheme => Theme.of(this).inputDecorationTheme;
  // InputDecorationTheme get inputTheme => Theme.of(this).inputDecorationTheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  AppBarThemeData get appBarTheme => Theme.of(this).appBarTheme;
  //  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;
  BrandPalette get brand => Theme.of(this).extension<BrandPalette>()!;
  ShapeScale get shapes => Theme.of(this).extension<ShapeScale>()!;
  SemanticColors get semantic => Theme.of(this).extension<SemanticColors>()!;

  // Build gradients directly from ColorScheme
  ThemeGradients get themeGradients => ThemeGradients(colors: colors);
  ThemeGradients get themeGradientsWatch => ThemeGradients(colors: colors);

  /// Returns a value based on the current theme (without listening).
  T themeValue<T>({required T light, required T dark}) {
    return isDarkTheme ? dark : light;
  }

  /// Returns a value based on the current theme (listens for changes).
  T themeValueWatch<T>({required T light, required T dark}) {
    return isDarkThemeWatch ? dark : light;
  }

  /// Full token object (auto-updates when Theme changes).
  AppShadows get appShadows => Theme.of(this).extension<AppShadows>() ?? AppShadows.light;

  List<BoxShadow> get shadowSoft => appShadows.soft;
  List<BoxShadow> get shadowMedium => appShadows.medium;
  List<BoxShadow> get shadowHard => appShadows.hard;
}
