import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/messaging/presentation/cubits/chat_threads/chat_threads_cubit.dart';
import 'package:silah_app/features/messaging/presentation/views/chats/widgets/body.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatThreadsCubit(repository: locator())..load(),
      child: const PlatformScreenWrapper(body: ChatsBody()),
    );
  }
}
