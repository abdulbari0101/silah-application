import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/image/resolved_remote_image.dart';

enum AppAvatarVariant { user, lawyer }

class AppRemoteAvatar extends StatelessWidget {
  const AppRemoteAvatar({
    super.key,
    required this.radius,
    this.imageUrl,
    this.label,
    this.variant = AppAvatarVariant.user,
    this.backgroundColor,
    this.foregroundColor,
  });

  final String? imageUrl;
  final String? label;
  final double radius;
  final AppAvatarVariant variant;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final size = radius * 2;

    return SizedBox.square(
      dimension: size,
      child: ResolvedRemoteImage(
        imageUrl: imageUrl,
        builder: (context, resolvedUrl) => ClipOval(
          child: ExtendedImage.network(
            resolvedUrl,
            width: size,
            height: size,
            fit: BoxFit.cover,
            cache: true,
            printError: false,
            loadStateChanged: (state) {
              switch (state.extendedImageLoadState) {
                case LoadState.loading:
                case LoadState.failed:
                  return _buildFallback(context, size: size);
                case LoadState.completed:
                  return null;
              }
            },
          ),
        ),
        placeholderBuilder: (context) => _buildFallback(context, size: size),
      ),
    );
  }

  Widget _buildFallback(BuildContext context, {required double size}) {
    final bgColor = backgroundColor ?? context.colors.primaryContainer;
    final fgColor = foregroundColor ?? context.colors.primary;
    final initials = _initials();

    return DecoratedBox(
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      child: Center(
        child: initials != null
            ? Text(
                initials,
                style: context.textTheme.titleMedium?.copyWith(
                  color: fgColor,
                  fontWeight: FontWeight.w700,
                ),
              )
            : Icon(_fallbackIcon(), color: fgColor, size: size * 0.42),
      ),
    );
  }

  String? _initials() {
    final normalized = label?.trim();
    if (normalized == null || normalized.isEmpty) {
      return null;
    }
    final parts = normalized
        .split(RegExp(r'\s+'))
        .where((item) => item.isNotEmpty)
        .toList();
    if (parts.isEmpty) {
      return null;
    }
    final first = parts.first.characters.first.toUpperCase();
    if (parts.length == 1) {
      return first;
    }
    return '$first${parts.last.characters.first.toUpperCase()}';
  }

  IconData _fallbackIcon() {
    switch (variant) {
      case AppAvatarVariant.lawyer:
        return Icons.balance_outlined;
      case AppAvatarVariant.user:
        return Icons.person_outline_rounded;
    }
  }
}
