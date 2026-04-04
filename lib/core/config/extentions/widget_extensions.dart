import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

extension WidgetExtensions on Widget {
  Widget addRipple(BuildContext context, {VoidCallback? onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap, // Now accepts nullable onTap
        borderRadius: context.shapes.brLg,
        splashColor: onTap != null
            ? context.colors.primary
            : Colors.transparent,
        highlightColor: onTap != null
            ? context.colors.primary.withAlphaOpacity(0.1)
            : Colors.transparent,
        child: this,
      ),
    );
  }
}
