import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/features/requests/domain/entities/request_item_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'request_item.dart';

class RequestItemShimmer extends StatelessWidget {
  const RequestItemShimmer({super.key});

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
      child: RequestItem(item: RequestItemEntity(name: 'name'), enabled: false),
    );
  }
}
