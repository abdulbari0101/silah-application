import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/color_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

SegmentedButtonThemeData buildSegmentedTheme(ColorScheme cs, TextTheme text) {
  final label = text.labelMedium; // Label-3 13/18

  return SegmentedButtonThemeData(
    style: ButtonStyle(
      // M3 recommends pill corners
      shape: const WidgetStatePropertyAll(StadiumBorder()),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      side: WidgetStateProperty.resolveWith((states) {
        final sel = states.contains(WidgetState.selected);
        return sel ? BorderSide.none : BorderSide(color: cs.outline);
      }),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        final sel = states.contains(WidgetState.selected);
        return sel ? cs.primaryContainer : Colors.transparent;
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        final sel = states.contains(WidgetState.selected);
        return sel ? cs.onPrimaryContainer : cs.onSurfaceVariant;
      }),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return (states.contains(WidgetState.selected)
                  ? cs.onPrimaryContainer
                  : cs.onSurfaceVariant)
              .withAlphaOpacity(.08);
        }
        if (states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.focused)) {
          return (states.contains(WidgetState.selected)
                  ? cs.onPrimaryContainer
                  : cs.onSurfaceVariant)
              .withAlphaOpacity(.06);
        }
        return null;
      }),
      textStyle: WidgetStateProperty.resolveWith((states) {
        final sel = states.contains(WidgetState.selected);
        return label?.copyWith(
          fontWeight: sel ? FontWeight.w600 : FontWeight.w400,
        );
      }),
      iconColor: WidgetStateProperty.resolveWith((states) {
        final sel = states.contains(WidgetState.selected);
        return sel ? cs.onPrimaryContainer : cs.onSurfaceVariant;
      }),
    ),
  );
}
