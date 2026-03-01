import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class CurvedHeaderContainer extends StatelessWidget {
  const CurvedHeaderContainer({
    super.key,
    required this.child,
    this.padding,
    this.backgroundColor,
    this.radius = 32,
    this.addShadow = false,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double radius;
  final bool addShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? context.colors.surfaceContainerHighest,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(radius)),
        boxShadow: addShadow
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}
