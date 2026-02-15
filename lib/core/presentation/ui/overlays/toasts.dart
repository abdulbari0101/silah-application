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
    Flushbar(
      messageText: Text(message, style: context.textTheme.bodyMedium),
      icon: Icon(Icons.info_outline, size: 24, color: context.colors.primary),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      borderRadius: context.shapes.brMd,
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: position,
      leftBarIndicatorColor: context.colors.primary,
      duration: duration ?? const Duration(seconds: 2),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeInOut,
    ).show(context);
  }

  static void success(BuildContext c, String m) => info(c, m, position: FlushbarPosition.BOTTOM);

  static void error(
    BuildContext context,
    String message, {
    Duration? duration,
    FlushbarPosition position = FlushbarPosition.TOP,
  }) {
    final text = context.textTheme;

    Flushbar(
      backgroundColor: context.colors.errorContainer,
      messageText: Text(
        message,
        style: text.bodyMedium?.copyWith(
          color: context.colors.onErrorContainer,
          fontWeight: FontWeight.w600,
        ),
      ),
      icon: Icon(Icons.error_outline, size: 24, color: context.colors.onErrorContainer),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      borderRadius: context.shapes.brMd,
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: position,
      // Optional: left indicator can match the same container tone or be removed
      leftBarIndicatorColor: context.colors.onErrorContainer.withAlphaOpacity(0.3),
      duration: duration ?? const Duration(seconds: 4),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeInOut,
    ).show(context);
  }
}
