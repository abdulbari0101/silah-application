import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

IconThemeData buildIconTheme(ColorScheme cs) => IconThemeData(color: cs.primary);

ChipThemeData buildChipTheme(ColorScheme cs, TextTheme text) => ChipThemeData(
  shape: StadiumBorder(side: BorderSide(color: cs.outline)),
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  labelStyle: text.labelSmall, // 12/16 Medium as base
  backgroundColor: cs.surfaceContainer, // unselected
  selectedColor: cs.primaryContainer, // selected
  secondarySelectedColor: cs.primaryContainer,
  checkmarkColor: cs.onPrimaryContainer,
  disabledColor: cs.surfaceContainer.withAlphaOpacity(.6),
  deleteIconColor: cs.onSurfaceVariant,
  selectedShadowColor: Colors.transparent,
  shadowColor: Colors.transparent,
);

SnackBarThemeData buildSnackBarTheme(ColorScheme cs, TextTheme text, ShapeScale shapes) =>
    SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: cs.inverseSurface,
      contentTextStyle: text.bodyMedium!.copyWith(color: cs.onInverseSurface),
      actionTextColor: cs.primary,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: shapes.brMd),
    );

TooltipThemeData buildTooltipTheme(ColorScheme cs, TextTheme text, ShapeScale shapes) {
  final tiny = text.labelSmall!.copyWith(
    fontSize: 10,
    height: 12 / 10,
    fontWeight: FontWeight.w500,
  );

  return TooltipThemeData(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    waitDuration: const Duration(milliseconds: 400),
    textStyle: tiny.copyWith(color: cs.onInverseSurface),
    decoration: ShapeDecoration(
      color: cs.inverseSurface,
      shape: RoundedRectangleBorder(borderRadius: shapes.brSm),
    ),
  );
}

BadgeThemeData buildBadgeTheme(ColorScheme cs, TextTheme text) => BadgeThemeData(
  backgroundColor: cs.error,
  textColor: cs.onError,
  largeSize: 22,
  smallSize: 8,
  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
);
