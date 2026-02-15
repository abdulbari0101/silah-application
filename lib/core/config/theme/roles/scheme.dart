// import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:flutter/material.dart';

import '../tokens/brand_tokens.dart';

ColorScheme buildScheme(BrandTokens t, Brightness b) {
  final base = ColorScheme.fromSeed(seedColor: t.seed, brightness: b);

  if (b == Brightness.light) {
    return base.copyWith(
      surface: t.pageBg,
      primary: t.seed,
      // tertiary: t.titleColor,
      onSurface: t.onSurface,
      surfaceContainerLowest: t.card,
      surfaceContainerLow: t.card,
      surfaceContainer: t.fieldFill,
      surfaceContainerHigh: t.fieldFill,
      surfaceContainerHighest: t.fieldFill,
      surfaceDim: t.pageBg,
     
      onSurfaceVariant: t.onSurfaceVariant,
      outline: t.outline,
    );
  }

  // Dark: use algorithmic neutrals (good contrast), just disable tint.
  return base.copyWith(surfaceTint: Colors.transparent);
}
