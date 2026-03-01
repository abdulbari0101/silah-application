import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/messaging/presentation/cubits/conversation/chat_conversation_cubit.dart';
import 'package:silah_app/features/messaging/presentation/views/conversation/models/chat_conversation_args.dart';
import 'package:silah_app/features/messaging/presentation/views/conversation/widgets/chat_conversation_body.dart';

class ChatConversationScreen extends StatelessWidget {
  const ChatConversationScreen({super.key, required this.args});

  final ChatConversationArgs args;

  @override
  Widget build(BuildContext context) {
    final threadId = args.thread.id;
    if (threadId == null || threadId.isEmpty) {
      return PlatformScreenWrapper(
        title: Strings.messages.tr(),
        body: Center(child: Text(Strings.unexpected_error.tr())),
      );
    }
    return BlocProvider(
      create: (_) => ChatConversationCubit(
        repository: locator(),
        threadId: threadId,
      )..load(),
      child: PlatformScreenWrapper(
        title: Strings.messages.tr(),
        body: ChatConversationBody(threadId: threadId),
      ),
    );
  }
}
