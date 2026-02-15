import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';
import 'package:silah_app/gen/assets.gen.dart';

class CustomeImage extends StatelessWidget {
  const CustomeImage({
    super.key,
    this.url,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.borderRadius,
    this.placeHolderWidget,
    this.placeHolderURL,
  });

  final String? url;
  final BoxFit fit;
  final double? height;
  final double? width;
  final Widget? placeHolderWidget;
  final String? placeHolderURL;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final imageUrl = url?.isNotEmpty == true ? url! : null;
    if (imageUrl != null) {
      return ExtendedImage.network(
        imageUrl,
        fit: fit,
        cache: true,
        printError: false,
        borderRadius: borderRadius ?? context.shapes.brMd,
        shape: BoxShape.rectangle,
        loadStateChanged: (state) {
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              return _buildImageShimmer(context);
            case LoadState.completed:
              return _buildCompletedImage(imageUrl, context);
            case LoadState.failed:
              return placeHolderWidget ?? _buildPlaceholder(context);
          }
        },
      );
    } else {
      return placeHolderWidget ?? _buildPlaceholder(context);
    }
  }

  Widget _buildCompletedImage(String imageUrl, BuildContext context) {
    return ExtendedImage.network(
      imageUrl,
      fit: fit,
      printError: false,
      color: Colors.transparent,
      colorBlendMode: BlendMode.softLight,
      cache: true,
      borderRadius: borderRadius ?? context.shapes.brMd,
      shape: BoxShape.rectangle,
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    if (placeHolderURL != null && placeHolderURL!.isNotEmpty) {
      return CustomeImage(
        url: placeHolderURL,
        fit: fit,
        height: height,
        width: width,
        borderRadius: borderRadius,
        placeHolderWidget: placeHolderWidget,
      );
    }

    if (placeHolderWidget != null) {
      return placeHolderWidget!;
    }

    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.colors.primary.withAlphaOpacity(0.3),
        borderRadius: borderRadius ?? context.shapes.brMd,
      ),
      child: AppSvgIcon(
        assetName: Assets.icons.logo.logoSvg,
        matchTextDirection: false,
        darkDynamicColor: false,
        height: 30,
        width: 30,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildImageShimmer(BuildContext context) {
    return Shimmer.fromColors(
      enabled: true,
      baseColor: context.colors.shimmerBase,
      highlightColor: context.colors.shimmerHighlight,
      child: Container(
        height: height ?? 100,
        width: width ?? 100,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? context.shapes.brMd,
          color: context.colors.blackOrWhite,
        ),
      ),
    );
  }
}
