import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

enum FintureButtonStyle { primary, success, danger }

class WhiteButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isDisabled;
  final bool isLoading;
  final FintureButtonStyle style;

  final LinearGradient? gradient; // (kept for API compat; unused in MD3 button)
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final double? fontSize;
  final Color? overrideColor;
  final double backgroundRadius; // provided by theme; kept for compat

  const WhiteButton({
    super.key,
    required this.text,
    this.onTap,
    this.isDisabled = false,
    this.isLoading = false,
    this.style = FintureButtonStyle.primary,
    this.gradient,
    this.prefixWidget,
    this.suffixWidget,
    this.fontSize,
    this.overrideColor,
    this.backgroundRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    final labelStyle = context.textTheme.labelLarge!.copyWith(
      // your OutlinedButtonTheme already sets Label-2 (15/18) + w600;
      // only let callers shrink/enlarge if they passed fontSize.
      fontSize: fontSize ?? context.textTheme.labelLarge!.fontSize,
    );

    final child = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (prefixWidget != null) ...[prefixWidget!, UIConstants.smallWidth],
        Flexible(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        if (suffixWidget != null) ...[UIConstants.smallWidth, suffixWidget!],
      ],
    );

    return SizedBox(
      width: double.infinity,
      height: UIConstants.buttonHeight,
      child: OutlinedButton(
        onPressed: (isDisabled || isLoading) ? null : onTap,
        style: ButtonStyle(
          // don’t fight your global theme; just set textStyle
          textStyle: WidgetStatePropertyAll(labelStyle),
        ),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator.adaptive(strokeWidth: 2),
              )
            : child,
      ),
    );
  }
}
