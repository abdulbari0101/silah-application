import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';

class ImageCenter extends StatelessWidget {
  final String assetName;

  const ImageCenter({super.key, required this.assetName});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth * 0.6;
        final double hight = constraints.maxWidth * 0.7;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
          child: ClipRRect(
            borderRadius: context.shapes.brLg,
            child: Container(
              width: width,
              height: hight,
              color: context.colors.surface.withAlphaOpacity(0.1),
              child: AppSvgIcon(
                assetName: assetName,
                fit: BoxFit.contain,
                darkDynamicColor: false,
                matchTextDirection: false,
                errorBuilder: (context, error, stack) => Center(
                  child: Text(
                    "Image not found\n($assetName)",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: context.colors.onSurfaceVariant),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
