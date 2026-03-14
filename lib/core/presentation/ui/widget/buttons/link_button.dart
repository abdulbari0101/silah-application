import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/color_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class LinkButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isDisabled;
  final double? fontSize;
  final FontWeight? fontWeight;

  /// If you want a permanent underline, pass [TextDecoration.underline].
  final TextDecoration? decoration;

  const LinkButton({
    super.key,
    required this.text,
    this.onTap,
    this.isDisabled = false,
    this.fontSize,
    this.fontWeight, // defaults to w500 (Medium) from theme
    this.decoration, // default: none (underline appears on hover/focus only)
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    // Material mapping: "link" = Label-4 (12/16) in your spec → text.labelSmall
    final base = tt.labelSmall!;
    final baseStyled = base.copyWith(
      fontSize: fontSize ?? base.fontSize, // 12 by default
      fontWeight: fontWeight ?? FontWeight.w500, // Medium
    );

    return TextButton(
      onPressed: isDisabled ? null : onTap,
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        ),
        minimumSize: const WidgetStatePropertyAll(Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: WidgetStateProperty.resolveWith((states) {
          final showUnderline =
              states.contains(WidgetState.hovered) ||
              states.contains(WidgetState.focused);
          return baseStyled.copyWith(
            decoration:
                decoration ??
                (showUnderline
                    ? TextDecoration.underline
                    : TextDecoration.none),
          );
        }),
        // Color per M3 roles
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            // M3 disabled text ≈ onSurface @ 38%
            return Theme.of(
              context,
            ).colorScheme.onSurface.withAlphaOpacity(0.38);
          }
          return cs.primary;
        }),
        overlayColor: WidgetStatePropertyAll(cs.primary.withAlphaOpacity(.08)),
      ),
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}
