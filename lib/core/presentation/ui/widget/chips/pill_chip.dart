import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class PillChip extends StatelessWidget {
  const PillChip({
    super.key,
    required this.label,
    this.color,
    this.backgroundColor,
  });

  final String label;
  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final resolvedColor = color ?? context.colors.primary;
    final resolvedBackground =
        backgroundColor ?? context.colors.primaryContainer.withAlphaOpacity(0.2);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: resolvedBackground,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: resolvedColor.withAlphaOpacity(0.25)),
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(color: resolvedColor),
      ),
    );
  }
}
