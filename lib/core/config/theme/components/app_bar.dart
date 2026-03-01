import 'package:flutter/material.dart';
AppBarTheme buildAppBarTheme(ColorScheme cs, TextTheme text) => AppBarTheme(
  backgroundColor: cs.surfaceContainerHighest,
  elevation: 0,
  centerTitle: true,

  // Ensure both text & icons use the brand tone instead of onSurface
  foregroundColor: cs.primary,
  titleTextStyle: text.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: cs.primary),
  iconTheme: IconThemeData(color: cs.primary),
  actionsIconTheme: IconThemeData(color: cs.primary),
);
