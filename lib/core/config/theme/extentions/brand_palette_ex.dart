import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

/// Extra brand colors that don't exist in ColorScheme.
@immutable
class BrandPalette extends ThemeExtension<BrandPalette> {
  final Color primaryDark; // e.g., #002F6C for titles

  const BrandPalette({required this.primaryDark});

  /// Build from the same seed you use for ColorScheme so it stays in-family.
  static BrandPalette fromSeed(Color seed, {required Brightness brightness}) {
    // Color.value is deprecated; use toARGB32() (Flutter 3.27+).
    final core = CorePalette.of(seed.toARGB32());

    // Darker primary tone for light theme; lighter tone for dark theme.
    final tone = brightness == Brightness.light ? 20 : 80;

    // TonalPalette.get(tone) returns ARGB int.
    final argb = core.primary.get(tone);

    //return BrandPalette(primaryDark: Color(argb));
   // return BrandPalette(primaryDark: Color(argb));

    final  color = brightness ==  Brightness.light ?  Color(argb) : Colors.white;
    return BrandPalette(primaryDark: color);
 
  }

  @override
  BrandPalette copyWith({Color? primaryDark}) =>
      BrandPalette(primaryDark: primaryDark ?? this.primaryDark);

  @override
  ThemeExtension<BrandPalette> lerp(ThemeExtension<BrandPalette>? other, double t) {
    if (other is! BrandPalette) return this;
    return BrandPalette(primaryDark: Color.lerp(primaryDark, other.primaryDark, t)!);
  }
}
