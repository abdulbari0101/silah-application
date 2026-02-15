import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/chats/presentation/blocs/chats/chats_bloc.dart';
import 'package:silah_app/features/chats/presentation/view/chats/widgets/body.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatsBloc(repository: locator()),

      child: PlatformScreenWrapper(title: "chats", body: const ChatsBody()),
    );
  }
}
