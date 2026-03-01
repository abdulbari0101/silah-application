// components/inputs.dart
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/color_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/f_input_fill_colors.dart';
import 'package:silah_app/core/config/theme/extentions/text_styling_extantion.dart';
import 'package:silah_app/core/config/theme/roles/shapes.dart';

OutlineInputBorder buildInputBorder(Color color, ShapeScale shapes) => OutlineInputBorder(
  borderRadius: shapes.brLg,
  borderSide: BorderSide(color: color, width: 1),
);

InputDecorationTheme buildInputTheme(ColorScheme cs, TextTheme text, ShapeScale shapes) =>
    InputDecorationTheme(
      hintStyle: text.bodySmall?.regular.copyWith(color: cs.onSurfaceVariant), // Label-3
      labelStyle: (text.labelSmall ?? text.bodySmall)?.regular.copyWith(
        color: cs.primary,
      ), // Label-2
      floatingLabelStyle: (text.labelSmall ?? text.bodySmall)?.semiBold.copyWith(color: cs.primary),
      filled: true,

      errorMaxLines: 2,
      errorStyle: text.bodySmall?.copyWith(color: cs.error),
      isDense: false,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      alignLabelWithHint: true,

      fillColor: cs.surfaceContainerLowest,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),

      enabledBorder: buildInputBorder(cs.outline, shapes),
      focusedBorder: buildInputBorder(cs.primary, shapes),
      errorBorder: buildInputBorder(cs.error, shapes),
      focusedErrorBorder: buildInputBorder(cs.error, shapes),
      disabledBorder: buildInputBorder(cs.outlineVariant.withAlphaOpacity(.5), shapes),
    );

TextStyle? inputLabelStyle(BuildContext context) {
  final text = Theme.of(context).textTheme;
  final cs = Theme.of(context).colorScheme;
  return (text.labelSmall ?? text.bodySmall)?.semiBold.copyWith(color: cs.primary);
}

Widget buildInputLabel(BuildContext context, String label) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: inputLabelStyle(context)),
      UIConstants.xsmallHeight,
    ],
  );
}

Color resolveInputFillColor(
  BuildContext context, {
  required bool enabled,
  required bool isFocused,
  required bool hasValue,
  bool hasError = false,
}) {
  final cs = Theme.of(context).colorScheme;
  final fills = Theme.of(context).extension<FInputFillColors>();

  if (!enabled) return cs.surfaceContainer.withAlphaOpacity(0.6);
  if (hasError || isFocused) return fills?.filled ?? cs.surfaceContainerLowest;
  // if (hasError) return fills?.filled ?? cs.surfaceContainerLowest;

  // empty vs filled colors come from the ThemeExtension with safe fallbacks.
  return hasValue
      ? (fills?.filled ?? cs.surfaceContainerLowest)
      : (fills?.empty ?? cs.surfaceContainer);
}
