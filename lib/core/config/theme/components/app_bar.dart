import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/brand_palette_ex.dart';

AppBarTheme buildAppBarTheme(ColorScheme cs, TextTheme text, BrandPalette brand) => AppBarTheme(
  backgroundColor: cs.surface,
  elevation: 0,
  centerTitle: true,

  // Ensure both text & icons use the brand tone instead of onSurface
  foregroundColor: brand.primaryDark,
  titleTextStyle: text.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: brand.primaryDark),
  iconTheme: IconThemeData(color: brand.primaryDark),
  actionsIconTheme: IconThemeData(color: brand.primaryDark),
);
