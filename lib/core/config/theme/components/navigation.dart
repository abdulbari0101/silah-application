import 'package:flutter/material.dart';

NavigationBarThemeData buildNavBarTheme(ColorScheme cs, TextTheme text) => NavigationBarThemeData(
  backgroundColor: cs.surfaceContainerHighest,
  elevation: 0,
  indicatorColor: Colors.transparent,
  iconTheme: WidgetStateProperty.resolveWith((states) {
    final sel = states.contains(WidgetState.selected);
    return IconThemeData(color: sel ? cs.primary : cs.onSurfaceVariant);
  }),
  labelTextStyle: WidgetStateProperty.resolveWith((states) {
    final sel = states.contains(WidgetState.selected);
    return text.labelMedium!.copyWith(
      color: sel ? cs.primary : cs.onSurfaceVariant,
      fontWeight: sel ? FontWeight.w600 : FontWeight.w400, // Label-3 spec
    );
  }),
);

BottomNavigationBarThemeData buildbottomNavTheme(ColorScheme cs, TextTheme text) =>
    BottomNavigationBarThemeData(
      backgroundColor: cs.surfaceContainerHighest,
      elevation: 0,
      selectedItemColor: cs.primary,
      unselectedItemColor: cs.onSurfaceVariant,
      selectedIconTheme: IconThemeData(color: cs.primary),
      unselectedIconTheme: IconThemeData(color: cs.onSurfaceVariant),
      selectedLabelStyle: text.labelMedium!.copyWith(fontWeight: FontWeight.w600),
      unselectedLabelStyle: text.labelMedium,
    );
