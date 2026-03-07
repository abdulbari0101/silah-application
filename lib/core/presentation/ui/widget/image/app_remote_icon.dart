import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/image/resolved_remote_image.dart';

class AppRemoteIcon extends StatelessWidget {
  const AppRemoteIcon({
    super.key,
    required this.size,
    this.imageUrl,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.fallback,
    this.fallbackIcon = Icons.image_outlined,
    this.iconColor,
    this.fit = BoxFit.cover,
  });

  final String? imageUrl;
  final double size;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final Widget? fallback;
  final IconData fallbackIcon;
  final Color? iconColor;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: ResolvedRemoteImage(
        imageUrl: imageUrl,
        builder: (context, resolvedUrl) => ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(size * 0.28),
          child: ExtendedImage.network(
            resolvedUrl,
            width: size,
            height: size,
            fit: fit,
            cache: true,
            printError: false,
            loadStateChanged: (state) {
              switch (state.extendedImageLoadState) {
                case LoadState.loading:
                case LoadState.failed:
                  return _buildFallback(context);
                case LoadState.completed:
                  return null;
              }
            },
          ),
        ),
        placeholderBuilder: _buildFallback,
      ),
    );
  }

  Widget _buildFallback(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(size * 0.28);
    final resolvedIconColor = iconColor ?? context.colors.primary;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? context.colors.surface,
        borderRadius: radius,
        border: borderColor == null ? null : Border.all(color: borderColor!),
      ),
      child: Center(
        child:
            fallback ??
            Icon(fallbackIcon, color: resolvedIconColor, size: size * 0.5),
      ),
    );
  }
}
