import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

enum FintureButtonStyle { primary, success, danger } // keep if you still use it

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isDisabled;
  final bool isLoading;
  final FintureButtonStyle style; // currently not switching styles; using theme's primary
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final double? fontSize;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onTap,
    this.isDisabled = false,
    this.isLoading = false,
    this.style = FintureButtonStyle.primary,
    this.prefixWidget,
    this.suffixWidget,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final semantic = context.semantic;
    final Color? background = switch (style) {
      FintureButtonStyle.success => semantic.success,
      FintureButtonStyle.danger => cs.error,
      _ => null,
    };
    final Color? foreground = switch (style) {
      FintureButtonStyle.success => Colors.white,
      FintureButtonStyle.danger => cs.onError,
      _ => null,
    };
    final ButtonStyle? localStyle = background != null
        ? FilledButton.styleFrom(backgroundColor: background, foregroundColor: foreground)
        : null;

    Widget child;
    if (isLoading) {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation(foreground ?? cs.onPrimary),
            ),
          ),
          const SizedBox(width: 8),
          Flexible(child: Text(text, overflow: TextOverflow.ellipsis)),
        ],
      );
    } else {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixWidget != null) ...[prefixWidget!, const SizedBox(width: 8)],
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              // If you need font size override, do it here; otherwise theme textStyle applies.
              style: (fontSize != null)
                  ? context.textTheme.labelLarge?.copyWith(fontSize: fontSize)
                  : null,
            ),
          ),
          if (suffixWidget != null) ...[const SizedBox(width: 8), suffixWidget!],
        ],
      );
    }

    return SizedBox(
      width: double.infinity,
      height: UIConstants.buttonHeight, // keep your height contract at call site
      child: FilledButton(
        onPressed: (isDisabled || isLoading) ? null : onTap,
        style: localStyle,
        child: child,
      ),
    );
  }
}
