import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/features/messaging/presentation/cubits/chat_threads/chat_threads_cubit.dart';
import 'package:silah_app/features/messaging/presentation/views/chats/widgets/chats_builder.dart';

class ChatsBody extends StatelessWidget {
  const ChatsBody({super.key, this.onRefresh});

  final VoidCallback? onRefresh;

  Future<void> _handleRefresh(BuildContext context) async {
    if (onRefresh != null) {
      onRefresh!.call();
    } else {
      await context.read<ChatThreadsCubit>().load();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        edgeOffset: UIConstants.mediumPadding,
        onRefresh: () => _handleRefresh(context),
        child: Padding(
          padding: const EdgeInsets.all(UIConstants.mediumPadding),
          child: const ChatThreadsBuilder(),
        ),
      ),
    );
  }
}
