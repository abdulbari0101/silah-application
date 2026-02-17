import 'package:flutter/material.dart';
import 'package:silah_app/features/messaging/presentation/views/chats/widgets/item/chat_item_shimmer.dart';

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
          itemBuilder: (context, index) => const ChatItemShimmer(),
        );
      },
    );
  }
}
