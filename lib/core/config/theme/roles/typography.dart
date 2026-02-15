import 'package:flutter/material.dart';
import 'package:silah_app/core/config/localization/app_language.dart';

import '../extentions/brand_palette_ex.dart'; // <-- add this

FontWeight _fontWeightFor(double w) {
  if (w >= 700) return FontWeight.w700;
  if (w >= 600) return FontWeight.w600;
  if (w >= 500) return FontWeight.w500;
  if (w >= 400) return FontWeight.w400;
  if (w >= 300) return FontWeight.w300;
  return FontWeight.w200;
}

// helper to apply a static weight to a style
TextStyle? vf(TextStyle? base, double w) => base?.copyWith(fontWeight: _fontWeightFor(w));

@immutable
class TinyText extends ThemeExtension<TinyText> {
  final TextStyle tiny;
  const TinyText({required this.tiny});
  @override
  TinyText copyWith({TextStyle? tiny}) => TinyText(tiny: tiny ?? this.tiny);
  @override
  TinyText lerp(ThemeExtension<TinyText>? other, double t) => this;
}

class ExtraLabels extends ThemeExtension<ExtraLabels> {
  final TextStyle label5; // 11/14 Medium
  const ExtraLabels({required this.label5});
  @override
  ExtraLabels copyWith({TextStyle? label5}) => ExtraLabels(label5: label5 ?? this.label5);
  @override
  ThemeExtension<ExtraLabels> lerp(covariant ExtraLabels? other, double t) => this;
}

TextTheme buildTextTheme(
  ColorScheme cs,
  AppLanguage language, {
  BrandPalette? brand, // <-- new (optional)
}) {
  final m3Base = ThemeData(
    colorScheme: cs,
    brightness: cs.brightness,
    useMaterial3: true,
    typography: Typography.material2021(),
  ).textTheme;

  // final withFonts = isArabic
  //     ? GoogleFonts.cairoTextTheme(m3Base)
  //     : GoogleFonts.kumbhSansTextTheme(m3Base);

  // Apply family to the whole text theme
  final baseWithFamily = m3Base.apply(fontFamily: 'IBMPlexSansArabic');

  final colored = baseWithFamily.apply(bodyColor: cs.onSurface, displayColor: cs.onSurface);

  return colored.copyWith(
    titleLarge: vf(colored.titleLarge, 600)?.copyWith(
      fontSize: 20,
      height: 24 / 20,
      color: brand?.primaryDark ?? colored.titleLarge?.color,
    ),
    titleMedium: vf(colored.titleMedium, 600)?.copyWith(fontSize: 18, height: 22 / 18),
    titleSmall: vf(colored.titleSmall, 600)?.copyWith(fontSize: 15, height: 22 / 18),

    displaySmall: vf(colored.displaySmall, 600)?.copyWith(fontSize: 36, height: 42 / 36),
    headlineMedium: vf(colored.headlineMedium, 600)?.copyWith(fontSize: 30, height: 36 / 30),
    headlineSmall: vf(colored.headlineSmall, 600)?.copyWith(fontSize: 24, height: 28 / 24),

    bodyLarge: vf(colored.bodyLarge, 400)?.copyWith(fontSize: 17, height: 25 / 17),
    bodyMedium: vf(colored.bodyMedium, 400)?.copyWith(fontSize: 15, height: 22 / 15),
    bodySmall: vf(colored.bodySmall, 400)?.copyWith(fontSize: 13, height: 18 / 13),

    labelLarge: vf(colored.labelLarge, 600)?.copyWith(fontSize: 15, height: 18 / 15),
    labelMedium: vf(colored.labelMedium, 400)?.copyWith(fontSize: 13, height: 18 / 13),
    labelSmall: vf(colored.labelSmall, 500)?.copyWith(fontSize: 12, height: 16 / 12),
  );
}

TinyText buildTiny(TextTheme text) => TinyText(
  tiny: text.labelSmall!.copyWith(fontSize: 10, height: 12 / 10, fontWeight: FontWeight.w500),
);
