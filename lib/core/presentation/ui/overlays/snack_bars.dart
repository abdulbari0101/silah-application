import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class SnackBars {
  SnackBars._();

  static void show(
    BuildContext context, {
    required String message,
    Color? background,
    Duration? duration,
  }) {
    final scheme = context.colors;
    final defaultBackground = scheme.brightness == Brightness.light
        ? scheme.surfaceContainerHighest
        : scheme.inverseSurface;
    final resolvedBackground = (background ?? defaultBackground)
        .withAlphaOpacity(0.96);
    final resolvedForeground =
        ThemeData.estimateBrightnessForColor(resolvedBackground) ==
            Brightness.dark
        ? Colors.white
        : scheme.onSurface;
    final bar = SnackBar(
      content: Text(
        message,
        style: context.textTheme.bodyMedium?.copyWith(
          color: resolvedForeground,
        ),
      ),
      backgroundColor: resolvedBackground,
      behavior: SnackBarBehavior.floating,
      shape: context.shapes.roundedMd,
      margin: const EdgeInsets.all(UIConstants.defaultPadding12),
      duration: duration ?? const Duration(seconds: 3),
      elevation: 0,
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(bar);
  }

  static void info(BuildContext ctx, String msg) => show(
    ctx,
    message: msg,
    background: ctx.semantic.info.withAlphaOpacity(0.18),
  );

  static void success(BuildContext ctx, String msg) =>
      show(ctx, message: msg, background: ctx.semantic.success);

  static void error(BuildContext ctx, String msg) =>
      show(ctx, message: msg, background: ctx.colors.error);
}
