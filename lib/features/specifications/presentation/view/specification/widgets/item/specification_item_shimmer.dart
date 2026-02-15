import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/features/specifications/domain/entities/specification_item_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'specification_item.dart';

class SpecificationItemShimmer extends StatelessWidget {
  const SpecificationItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Skeletonizer(
      enabled: true,
      ignorePointers: true,
      effect: ShimmerEffect(
        baseColor: colors.shimmerBase,
        highlightColor: colors.shimmerHighlight,
        duration: const Duration(milliseconds: 1200),
      ),
      child: SpecificationItem(item: SpecificationItemEntity(name: 'name'), enabled: false),
    );
  }
}
