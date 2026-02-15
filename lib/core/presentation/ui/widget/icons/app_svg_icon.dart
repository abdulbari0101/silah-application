import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class AppSvgIcon extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? lightColor;
  final Color? darkColor;
  final bool? matchTextDirection;

  /// Forces dynamic theme-based coloring in dark mode
  /// (ignored if `darkColor` is set)
  final bool darkDynamicColor;

  /// Forces dynamic theme-based coloring in light mode
  /// (ignored if `lightColor` is set)
  final bool lightDynamicColor;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;

  const AppSvgIcon({
    super.key,
    required this.assetName,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.lightColor,
    this.darkColor,
    this.matchTextDirection,
    this.darkDynamicColor = true,
    this.lightDynamicColor = false,
    this.errorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    ColorFilter? filter;

    if (context.isDarkTheme) {
      if (darkColor != null) {
        filter = ColorFilter.mode(darkColor!, BlendMode.srcIn);
      } else if (darkDynamicColor) {
        filter = ColorFilter.mode(
          context.iconsTheme.color ?? context.colors.primary,
          BlendMode.srcIn,
        );
      }
    } else {
      if (lightColor != null) {
        filter = ColorFilter.mode(lightColor!, BlendMode.srcIn);
      } else if (lightDynamicColor) {
        filter = ColorFilter.mode(
          context.iconsTheme.color ?? context.colors.primary,
          BlendMode.srcIn,
        );
      }
    }

    return SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      fit: fit,
      matchTextDirection: matchTextDirection ?? true,
      colorFilter: filter,
      errorBuilder:
          errorBuilder ??
          (context, error, stack) {
            return Tooltip(
              message: 'SVG load error: $error',
              child: Icon(Icons.error, size: width ?? height ?? 24),
            );
          },
    );
  }
}
