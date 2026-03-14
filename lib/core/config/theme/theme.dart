// theme.dart
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/localization/app_language.dart';
import 'package:silah_app/core/config/theme/components/list_tile.dart';
import 'package:silah_app/core/config/theme/components/segmented.dart';
import 'package:silah_app/core/config/theme/components/tabs.dart';
import 'package:silah_app/core/config/theme/extentions/color_extantion.dart';

import 'components/app_bar.dart';
import 'components/buttons.dart';
import 'components/inputs.dart';
import 'components/misc.dart';
import 'components/navigation.dart';
import 'components/surfaces.dart';
import 'extentions/brand_palette_ex.dart';
import 'extentions/f_input_fill_colors.dart';
import 'extentions/semantic_colors.dart';
import 'roles/scheme.dart';
import 'roles/shapes.dart';
import 'roles/typography.dart';
import 'tokens/brand_tokens.dart';

ThemeData buildTheme(
  BrandTokens t, {
  Brightness brightness = Brightness.light,
  AppLanguage language = AppLanguage.fallbackLanguage,
  ColorScheme? schemeOverride, // <- NEW
  bool harmonizeBrandWithScheme = true, // <- NEW
}) {
  // 1) Resolve ColorScheme: dynamic (Android) or brand fallback.
  final baseScheme = schemeOverride ?? buildScheme(brightness, seed: t.seed);
  final scheme = _applyBrandTokens(baseScheme, t, brightness);

  // 2) Build a brand palette and (optionally) harmonize its extra colors
  //    with the resolved scheme’s primary (Material 3 guidance).
  var brand = BrandPalette.fromSeed(t.seed, brightness: brightness);

  var baseShape = ShapeScale(); // use default shape (radius)
  if (harmonizeBrandWithScheme) {
    brand = brand.copyWith(
      primaryDark: brand.primaryDark.harmonizeWith(scheme.primary),
    );
  }

  // 3) Typography from M3 ramp using the resolved scheme & brand accents.
  final baseTextTheme = buildTextTheme(scheme, language, brand: brand);
  final baseThemeData = ThemeData(
    useMaterial3: true,
    fontFamily: 'Cairo',
    colorScheme: scheme,
    scaffoldBackgroundColor: scheme.surface,
    iconTheme: buildIconTheme(scheme),

    textTheme: baseTextTheme,
    appBarTheme: buildAppBarTheme(scheme, baseTextTheme),
    cardTheme: buildCardTheme(scheme, baseShape),
    dialogTheme: buildDialogTheme(scheme, baseShape),
    bottomSheetTheme: buildBottomSheetTheme(scheme, baseShape),

    filledButtonTheme: buildFilledButtonTheme(scheme, baseTextTheme),
    elevatedButtonTheme: buildElevatedButtonTheme(scheme, baseTextTheme),
    outlinedButtonTheme: buildOutlinedButtonTheme(scheme, baseTextTheme),
    textButtonTheme: buildTextButtonTheme(scheme, baseTextTheme),

    inputDecorationTheme: buildInputTheme(scheme, baseTextTheme, baseShape),
    navigationBarTheme: buildNavBarTheme(scheme, baseTextTheme),
    bottomNavigationBarTheme: buildbottomNavTheme(scheme, baseTextTheme),
    segmentedButtonTheme: buildSegmentedTheme(scheme, baseTextTheme),
    tabBarTheme: buildTabBarTheme(scheme, baseTextTheme),
    chipTheme: buildChipTheme(scheme, baseTextTheme),
    listTileTheme: buildListTileTheme(scheme, baseTextTheme),
    snackBarTheme: buildSnackBarTheme(scheme, baseTextTheme, baseShape),
    tooltipTheme: buildTooltipTheme(scheme, baseTextTheme, baseShape),
    badgeTheme: buildBadgeTheme(scheme, baseTextTheme),

    dividerTheme: DividerThemeData(thickness: 1, color: scheme.outline),

    extensions: <ThemeExtension<dynamic>>[
      buildTiny(baseTextTheme),
      brand,
      baseShape,
      FInputFillColors(
        empty: brightness == Brightness.light
            ? t.fieldFill
            : scheme.surfaceContainerLowest,
        filled: brightness == Brightness.light
            ? t.fieldFill
            : scheme.surfaceContainerLowest,
      ),
      SemanticColors(
        success: const Color(0xFF54B203),
        warning: const Color(0xFFC5B135),
        danger: const Color(0xFFB20303),
        info: const Color(0xFF60B0ED),
      ),
    ],
  );

  return baseThemeData;
}

ColorScheme _applyBrandTokens(
  ColorScheme scheme,
  BrandTokens t,
  Brightness brightness,
) {
  if (brightness != Brightness.light) return scheme;

  return scheme.copyWith(
    surface: t.pageBg,
    surfaceContainerLowest: t.fieldFill,
    surfaceContainerLow: t.card,
    surfaceContainer: t.pageBg,
    surfaceContainerHigh: t.card,
    surfaceContainerHighest: t.bottomNavBg,
    outline: t.outline,
    onSurface: t.onSurface,
    onSurfaceVariant: t.onSurfaceVariant,
  );
}
