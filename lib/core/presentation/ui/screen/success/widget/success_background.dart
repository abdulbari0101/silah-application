import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/responsive/dimensions.dart';

class SuccessBackground extends StatelessWidget {
  const SuccessBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimension(context);
    final colors = context.colors;
    final isDark = colors.isDark;

    final baseGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: isDark
          ? [
              colors.surface,
              colors.surfaceContainerHighest.mix(colors.surface, 0.25) ??
                  colors.surfaceContainerHighest,
              colors.surface,
            ]
          : [
              colors.primary.mix(colors.surface, 0.85) ?? colors.surface,
              colors.surface,
            ],
    );

    final primaryGlow = colors.primary.withValues(alpha: isDark ? 0.18 : 0.12);
    final secondaryGlow =
        (isDark ? colors.surfaceContainerHighest : colors.primaryContainer)
            .withValues(alpha: 0.22);

    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(gradient: baseGradient),
        child: Stack(
          children: [
            _GlowCircle(
              alignment: const Alignment(-0.85, -0.9),
              diameter: dimensions.height * 0.9,
              color: secondaryGlow,
            ),
            _GlowCircle(
              alignment: const Alignment(0.85, -0.05),
              diameter: dimensions.height * 0.7,
              color: primaryGlow,
            ),
            _GlowCircle(
              alignment: const Alignment(0.05, 0.9),
              diameter: dimensions.height * 0.65,
              color: secondaryGlow.withAlphaOpacity(isDark ? 0.5 : 0.35),
            ),
          ],
        ),
      ),
    );
  }
}

class _GlowCircle extends StatelessWidget {
  final Alignment alignment;
  final double diameter;
  final Color color;

  const _GlowCircle({
    required this.alignment,
    required this.diameter,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [color, color.withAlphaOpacity(0)],
            stops: const [0.0, 1.0],
          ),
        ),
      ),
    );
  }
}
