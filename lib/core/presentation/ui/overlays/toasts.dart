import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class Toasts {
  Toasts._();

  static void info(
    BuildContext context,
    String message, {
    Duration? duration,
    FlushbarPosition position = FlushbarPosition.TOP,
  }) {
    _show(
      context,
      message: message,
      position: position,
      duration: duration ?? const Duration(seconds: 2),
      backgroundColor: _tintedSurface(context, context.colors.primary),
      icon: Icon(Icons.info_outline, size: 24, color: context.colors.primary),
      textColor: context.colors.onSurface,
      leftIndicatorColor: context.colors.primary,
    );
  }

  static void success(BuildContext context, String message) {
    _show(
      context,
      message: message,
      position: FlushbarPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      backgroundColor: _tintedSurface(context, context.semantic.success),
      icon: Icon(
        Icons.check_circle_outline,
        size: 24,
        color: context.semantic.success,
      ),
      textColor: context.colors.onSurface,
      leftIndicatorColor: context.semantic.success,
    );
  }

  static void error(
    BuildContext context,
    String message, {
    Duration? duration,
    FlushbarPosition position = FlushbarPosition.TOP,
  }) {
    final text = context.textTheme;

    _show(
      context,
      message: message,
      position: position,
      duration: duration ?? const Duration(seconds: 4),
      backgroundColor: context.colors.errorContainer,
      icon: Icon(
        Icons.error_outline,
        size: 24,
        color: context.colors.onErrorContainer,
      ),
      textColor: context.colors.onErrorContainer,
      leftIndicatorColor: context.colors.error,
      messageText: Text(
        message,
        style: text.bodyMedium?.copyWith(
          color: context.colors.onErrorContainer,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static void _show(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    required Widget icon,
    required Color textColor,
    required Color leftIndicatorColor,
    required Duration duration,
    required FlushbarPosition position,
    Widget? messageText,
  }) {
    Flushbar(
      backgroundColor: backgroundColor,
      messageText:
          messageText ??
          Text(
            message,
            style: context.textTheme.bodyMedium?.copyWith(color: textColor),
          ),
      icon: icon,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      borderRadius: context.shapes.brMd,
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: position,
      leftBarIndicatorColor: leftIndicatorColor,
      duration: duration,
      isDismissible: true,
      forwardAnimationCurve: Curves.easeInOut,
    ).show(context);
  }

  static Color _tintedSurface(BuildContext context, Color tint) {
    return Color.alphaBlend(
      tint.withAlphaOpacity(0.12),
      context.colors.surface,
    );
  }
}
