import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class AiBadgeIcon extends StatelessWidget {
  const AiBadgeIcon({super.key, this.size = 56});

  final double size;

  @override
  Widget build(BuildContext context) {
    final color = context.colors.primary;
    final borderColor = context.colors.outlineVariant.withAlphaOpacity(0.4);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(size * 0.35),
        border: Border.all(color: borderColor),
        boxShadow: context.shadowSoft,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.text_fields_rounded,
            color: color,
            size: size * 0.52,
          ),
          PositionedDirectional(
            end: size * 0.18,
            bottom: size * 0.18,
            child: Icon(
              Icons.auto_awesome,
              color: color,
              size: size * 0.28,
            ),
          ),
        ],
      ),
    );
  }
}
