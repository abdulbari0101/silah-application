import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/color_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class SecondaryNoBgButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isDisabled;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final double? fontSize;

  final double backgroundRadius;
  final Color? textColor;

  const SecondaryNoBgButton({
    super.key,
    required this.text,
    this.onTap,
    this.isDisabled = false,
    this.prefixWidget,
    this.suffixWidget,
    this.fontSize,
    this.backgroundRadius = 16,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    // Build the label; inherit the app font (labelLarge). Allow fontSize override.
    final child = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (prefixWidget != null) ...[prefixWidget!, UIConstants.smallWidth],
        Flexible(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: (fontSize != null)
                ? tt.labelLarge?.copyWith(fontSize: fontSize)
                : null,
          ),
        ),
        if (suffixWidget != null) ...[UIConstants.smallWidth, suffixWidget!],
      ],
    );

    ButtonStyle? localStyle;
    if (textColor != null || backgroundRadius != 16) {
      final c = textColor ?? cs.primary;
      localStyle = ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(backgroundRadius),
          ),
        ),
        // Keep bg transparent; let overlayColor provide feedback.
        backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled))
            return c.withAlphaOpacity(0.5);
          return c;
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed))
            return c.withAlphaOpacity(0.08);
          if (states.contains(WidgetState.hovered) ||
              states.contains(WidgetState.focused)) {
            return c.withAlphaOpacity(0.06);
          }
          return null;
        }),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: UIConstants.buttonHeight,
      child: TextButton(
        onPressed: isDisabled ? null : onTap,
        style: localStyle, // null → use global TextButtonThemeData
        child: child,
      ),
    );
  }
}
