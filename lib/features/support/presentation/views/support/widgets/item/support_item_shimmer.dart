import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/features/support/domain/entities/support_item_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'support_item.dart';

class SupportItemShimmer extends StatelessWidget {
  const SupportItemShimmer({super.key});

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
      child: SupportItem(item: SupportItemEntity(name: 'name'), enabled: false),
    );
  }
}
