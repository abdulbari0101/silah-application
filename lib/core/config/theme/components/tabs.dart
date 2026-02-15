import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/color_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

TabBarThemeData buildTabBarTheme(ColorScheme cs, TextTheme text) => TabBarThemeData(
  indicatorSize: TabBarIndicatorSize.tab,
  indicator: UnderlineTabIndicator(
    borderSide: BorderSide(color: cs.primary, width: 2),
    insets: const EdgeInsets.symmetric(horizontal: 16),
  ),
  labelStyle: text.labelMedium!.copyWith(fontWeight: FontWeight.w600), // Label-3 Semi
  unselectedLabelStyle: text.labelMedium,
  labelColor: cs.primary,
  unselectedLabelColor: cs.onSurfaceVariant,
  dividerColor: cs.outlineVariant,
  overlayColor: WidgetStatePropertyAll(cs.primary.withAlphaOpacity(.06)),
);
