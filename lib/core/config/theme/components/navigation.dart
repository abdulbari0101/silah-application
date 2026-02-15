import 'package:flutter/material.dart';

NavigationBarThemeData buildNavBarTheme(ColorScheme cs, TextTheme text) => NavigationBarThemeData(
  backgroundColor: cs.surfaceContainerLow,
  elevation: 0,
  indicatorColor: cs.primaryContainer,
  iconTheme: WidgetStateProperty.resolveWith((states) {
    final sel = states.contains(WidgetState.selected);
    return IconThemeData(color: sel ? cs.onPrimaryContainer : cs.onSurfaceVariant);
  }),
  labelTextStyle: WidgetStateProperty.resolveWith((states) {
    final sel = states.contains(WidgetState.selected);
    return text.labelMedium!.copyWith(
      color: sel ? cs.onPrimaryContainer : cs.onSurfaceVariant,
      fontWeight: sel ? FontWeight.w600 : FontWeight.w400, // Label-3 spec
    );
  }),
);

BottomNavigationBarThemeData buildbottomNavTheme(ColorScheme cs, TextTheme text) =>
    BottomNavigationBarThemeData(
      backgroundColor: cs.surfaceContainerLow,
      elevation: 0,
      selectedItemColor: cs.onPrimaryContainer,
      unselectedItemColor: cs.onSurfaceVariant,
      selectedIconTheme: IconThemeData(color: cs.onPrimaryContainer),
      unselectedIconTheme: IconThemeData(color: cs.onSurfaceVariant),
      selectedLabelStyle: text.labelMedium!.copyWith(fontWeight: FontWeight.w600),
      unselectedLabelStyle: text.labelMedium,
    );
