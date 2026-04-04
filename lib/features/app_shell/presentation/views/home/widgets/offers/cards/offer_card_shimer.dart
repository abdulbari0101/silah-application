import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class OfferCardShimer extends StatelessWidget {
  const OfferCardShimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      // enabled: true,
      period: const Duration(seconds: 1),

      baseColor: context.colors.shimmerBase,
      highlightColor: context.colors.shimmerBase,

      child: Container(
        height: 200,
        margin: const EdgeInsetsDirectional.only(
          end: UIConstants.mediumPadding,
        ),

        width: double.infinity,

        decoration: BoxDecoration(
          color: context.colors.primary,
          borderRadius: context.shapes.brMd,
        ),

        child: const Icon(Icons.image, color: Colors.white),
      ),
    );
  }
}
