import 'package:flutter/material.dart';
import 'package:silah_app/features/support/presentation/views/support/widgets/item/support_item_shimmer.dart';

class OperatorsLoading extends StatelessWidget {
  const OperatorsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: 13,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.98,
          ),
          itemBuilder: (context, index) => const SupportItemShimmer(),
        );
      },
    );
  }
}
