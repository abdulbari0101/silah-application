import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({super.key, required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withAlphaOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withAlphaOpacity(0.4)),
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(color: color),
      ),
    );
  }
}
