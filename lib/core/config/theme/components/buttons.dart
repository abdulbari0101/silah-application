import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/color_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

const double _kBtnHeight = UIConstants.buttonHeight;
const EdgeInsets _kPadding = EdgeInsets.symmetric(horizontal: 16);

ButtonStyle _baseFilled(ColorScheme cs, TextTheme text) {
  return ButtonStyle(
    minimumSize: WidgetStateProperty.all(const Size.fromHeight(_kBtnHeight)),
    padding: WidgetStateProperty.all(_kPadding),
    shape: const WidgetStatePropertyAll(StadiumBorder()),
    // Label-2 15/18, make CTAs SemiBold
    textStyle: WidgetStateProperty.all(text.labelLarge?.copyWith(fontWeight: FontWeight.w600)),
    // Colors per state
    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return cs.onPrimary.withAlphaOpacity(0.72);
      }
      return cs.onPrimary;
    }),
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return cs.primary.withAlphaOpacity(0.50); // your old 0.5 disabled look
      }
      if (states.contains(WidgetState.pressed))
        return cs.primary.darker(5); // darker brand on press
      return cs.primary;
    }),
    overlayColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.hovered) || states.contains(WidgetState.focused)) {
        return cs.onPrimary.withAlphaOpacity(0.08);
      }
      if (states.contains(WidgetState.pressed)) {
        return cs.onPrimary.withAlphaOpacity(0.12);
      }
      return null;
    }),
    elevation: WidgetStateProperty.all(0), // keep flat (you were using boxShadow before)
    shadowColor: WidgetStateProperty.all(Colors.transparent),
  );
}

ButtonStyle _baseOutlined(ColorScheme cs, TextTheme text) {
  return ButtonStyle(
    minimumSize: WidgetStateProperty.all(const Size.fromHeight(_kBtnHeight)),
    padding: WidgetStateProperty.all(_kPadding),
    shape: const WidgetStatePropertyAll(StadiumBorder()),
    // textStyle: WidgetStateProperty.all(const TextStyle(fontWeight: FontWeight.w600)),
    textStyle: WidgetStateProperty.all(text.labelLarge?.copyWith(fontWeight: FontWeight.w600)),
    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return cs.primary.withAlphaOpacity(0.5);
      }
      return cs.primary;
    }),
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return cs.surfaceContainerLowest.withAlphaOpacity(0.6);
      }
      return cs.surfaceContainerLowest; // white pill in your design
    }),
    side: WidgetStateProperty.resolveWith((states) {
      final base = cs.primary;
      final disabled = base.withAlphaOpacity(.4);
      return BorderSide(color: states.contains(WidgetState.disabled) ? disabled : base, width: 1.5);
    }),
    overlayColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.hovered) || states.contains(WidgetState.focused)) {
        return cs.primary.withAlphaOpacity(0.05);
      }
      if (states.contains(WidgetState.pressed)) {
        return cs.primary.withAlphaOpacity(0.08);
      }
      return null;
    }),
    elevation: WidgetStateProperty.all(0),
    shadowColor: WidgetStateProperty.all(Colors.transparent),
  );
}

FilledButtonThemeData buildFilledButtonTheme(ColorScheme cs, TextTheme text) =>
    FilledButtonThemeData(style: _baseFilled(cs, text));

/// Optional: tonal variant for use with `FilledButton.tonal(...)`
ElevatedButtonThemeData buildElevatedButtonTheme(ColorScheme cs, TextTheme text) =>
    ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(text.labelLarge), // 15/18
        elevation: const WidgetStatePropertyAll(1),
      ),
      // _baseFilled(cs, text),
    );

OutlinedButtonThemeData buildOutlinedButtonTheme(ColorScheme cs, TextTheme text) =>
    OutlinedButtonThemeData(style: _baseOutlined(cs, text));

/// If you also use TextButtons anywhere, nice to align them too
TextButtonThemeData buildTextButtonTheme(ColorScheme cs, TextTheme text) => TextButtonThemeData(
  style: ButtonStyle(
    textStyle: WidgetStatePropertyAll(text.labelLarge),
    padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16)),
  ),
);

// import 'package:silah_app/core/config/constants/ui_constants.dart';
// import 'package:silah_app/core/config/extentions/color_extantion.dart';
// import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
//import 'package:flutter/material.dart';
//import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

// import '../tokens/brand_tokens.dart';

// FilledButtonThemeData buildFilledButtonTheme(ColorScheme cs, BrandTokens t, TextTheme text) {
//   return FilledButtonThemeData(
//     style: ButtonStyle(
//       minimumSize: const WidgetStatePropertyAll(Size.fromHeight(48)),
//       textStyle: WidgetStatePropertyAll(text.labelLarge?.copyWith(fontWeight: FontWeight.w600)), // Label-2
//       foregroundColor: WidgetStatePropertyAll(cs.onPrimary),
//       backgroundColor: WidgetStatePropertyAll(cs.primary),
//       overlayColor: WidgetStatePropertyAll(cs.onPrimary.withAlphaOpacity(.08)),
//       shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: context.shapes.brMd)),
//     ),
//   );
// }

// ElevatedButtonThemeData buildElevatedButtonTheme(ColorScheme cs, TextTheme text) {
//   return ElevatedButtonThemeData(
//     style: ButtonStyle(
//       textStyle: WidgetStatePropertyAll(text.labelLarge),
//       foregroundColor: WidgetStatePropertyAll(cs.onPrimary),
//       backgroundColor: WidgetStatePropertyAll(cs.primary),
//       elevation: const WidgetStatePropertyAll(1),
//     ),
//   );
// }

// OutlinedButtonThemeData buildOutlinedButtonTheme(ColorScheme cs, TextTheme text) {
//   return OutlinedButtonThemeData(
//     style: ButtonStyle(
//       textStyle: WidgetStatePropertyAll(text.labelLarge),
//       foregroundColor: WidgetStatePropertyAll(cs.primary),
//       side: WidgetStatePropertyAll(BorderSide(color: cs.outline)),
//     ),
//   );
// }

// TextButtonThemeData buildTextButtonTheme(ColorScheme cs, TextTheme text) {
//   return TextButtonThemeData(
//     style: ButtonStyle(
//       textStyle: WidgetStatePropertyAll(text.labelLarge),
//       foregroundColor: WidgetStatePropertyAll(cs.primary),
//       overlayColor: WidgetStatePropertyAll(cs.primary.withAlphaOpacity(.08)),
//     ),
//   );
// }
