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
  final baseScheme = schemeOverride ?? buildScheme(brightness);

  // 2) Build a brand palette and (optionally) harmonize its extra colors
  //    with the resolved scheme’s primary (Material 3 guidance).
  var brand = BrandPalette.fromSeed(t.seed, brightness: brightness);

  var baseShape = ShapeScale(); // use default shape (radius)
  if (harmonizeBrandWithScheme) {
    brand = brand.copyWith(primaryDark: brand.primaryDark.harmonizeWith(baseScheme.primary));
  }

  // 3) Typography from M3 ramp using the resolved scheme & brand accents.
  final baseTextTheme = buildTextTheme(baseScheme, language, brand: brand);
  final baseThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: baseScheme,
    scaffoldBackgroundColor: baseScheme.surface,
    iconTheme: buildIconTheme(baseScheme),

    textTheme: baseTextTheme,
    appBarTheme: buildAppBarTheme(baseScheme, baseTextTheme, brand),
    cardTheme: buildCardTheme(baseScheme, baseShape),
    dialogTheme: buildDialogTheme(baseScheme, baseShape),
    bottomSheetTheme: buildBottomSheetTheme(baseScheme, baseShape),

    filledButtonTheme: buildFilledButtonTheme(baseScheme, baseTextTheme),
    elevatedButtonTheme: buildElevatedButtonTheme(baseScheme, baseTextTheme),
    outlinedButtonTheme: buildOutlinedButtonTheme(baseScheme, baseTextTheme),
    textButtonTheme: buildTextButtonTheme(baseScheme, baseTextTheme),

    inputDecorationTheme: buildInputTheme(baseScheme, baseTextTheme, baseShape),
    navigationBarTheme: buildNavBarTheme(baseScheme, baseTextTheme),
    bottomNavigationBarTheme: buildbottomNavTheme(baseScheme, baseTextTheme),
    segmentedButtonTheme: buildSegmentedTheme(baseScheme, baseTextTheme),
    tabBarTheme: buildTabBarTheme(baseScheme, baseTextTheme),
    chipTheme: buildChipTheme(baseScheme, baseTextTheme),
    listTileTheme: buildListTileTheme(baseScheme, baseTextTheme),
    snackBarTheme: buildSnackBarTheme(baseScheme, baseTextTheme, baseShape),
    tooltipTheme: buildTooltipTheme(baseScheme, baseTextTheme, baseShape),
    badgeTheme: buildBadgeTheme(baseScheme, baseTextTheme),

    dividerTheme: DividerThemeData(thickness: 1, color: baseScheme.outline),

    extensions: <ThemeExtension<dynamic>>[
      buildTiny(baseTextTheme),
      brand,
      baseShape,
      FInputFillColors(
        empty: baseScheme.surfaceContainerLowest, // match XD: clean white fields
        filled: baseScheme.surfaceContainerLowest, // keep consistent after input
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
