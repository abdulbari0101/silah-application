import 'package:flutter/material.dart';

ListTileThemeData buildListTileTheme(ColorScheme cs, TextTheme text) => ListTileThemeData(
  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  titleTextStyle: text.labelLarge!.copyWith(
    // Label-2 Medium 15/18
    color: cs.onSurface,
    fontWeight: FontWeight.w500,
  ),
  subtitleTextStyle: text.labelMedium!.copyWith(
    // Label-3 Regular
    color: cs.onSurfaceVariant,
    fontWeight: FontWeight.w400,
  ),
  iconColor: cs.onSurfaceVariant,
  dense: false,
);
