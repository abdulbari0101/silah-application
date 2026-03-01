// components/surfaces.dart
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/roles/shapes.dart';

CardThemeData buildCardTheme(ColorScheme cs, ShapeScale shapes) =>
    CardThemeData(elevation: 1, shape: shapes.roundedLg, color: cs.surfaceContainerLow);

DialogThemeData buildDialogTheme(ColorScheme cs, ShapeScale shapes) => DialogThemeData(
  shape: shapes.roundedXl,
  alignment: Alignment.center,

  insetPadding: const EdgeInsets.all(12),

  elevation: 2,

  titleTextStyle: TextStyle(
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 20, // Heading/H5/fontSize
    height: 24 / 16, // Heading/H5/lineHeight
    letterSpacing: 0.15, // Heading/H5/letterSpacing
    color: cs.onSurface,
  ),
  contentTextStyle: const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 20 / 14,
    letterSpacing: 0.10,
  ),
);

BottomSheetThemeData buildBottomSheetTheme(ColorScheme cs, ShapeScale shapes) =>
    BottomSheetThemeData(
      backgroundColor: cs.surfaceContainerHighest,
      modalBackgroundColor: cs.surfaceContainerHighest,
      shape: shapes.roundedXl,
    );
