import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class CardButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final Color? color;
  final Color? borderColor;
  final Color? splashColor;
  final EdgeInsetsGeometry padding;
  final BorderRadius? borderRadius;

  const CardButton({
    super.key,
    required this.child,
    this.onTap,
    this.color,
    this.borderColor,
    this.splashColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final radius = borderRadius ?? context.shapes.brMd;

    return Card(
      color: color,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: radius,
        side: borderColor != null
            ? BorderSide(color: borderColor!)
            : BorderSide.none,
      ),
      clipBehavior: Clip.antiAlias, // ensures ripple is clipped
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        overlayColor: WidgetStatePropertyAll(
          splashColor ?? cs.primary.withAlphaOpacity(.06),
        ),
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}
