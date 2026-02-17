import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button_with_progress.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/empty_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/features/messaging/presentation/blocs/chats/chats_bloc.dart';
import 'package:silah_app/features/messaging/presentation/views/chats/widgets/state/chats_loaded.dart';
import 'package:silah_app/features/messaging/presentation/views/chats/widgets/state/chats_loading.dart';

class OperatorsBuilder extends StatelessWidget {
  const OperatorsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsBloc, ChatsState>(
      builder: (context, state) {
        if (state is DataChatLoading || state is DataChatInitial) {
          return const OperatorsLoading();
        }

        if (state is DataChatError) {
          return _ScrollableState(
            child: CustomeErrorWidget(
              message: state.message,
              onRetry: () => context.read<ChatsBloc>().add(LoadChats()),
            ),
          );
        }

        if (state is DataChatLoaded) {
          if (state.data.isEmpty) {
            return _ScrollableState(
              child: EmptyWidget(
                retryWidget: PrimaryButtonWithProgress(
                  text: Strings.try_again.tr(),
                  onTap: () => context.read<ChatsBloc>().add(LoadChats()),
                  isLoading: false,
                ),
              ),
            );
          }

          return OperatorsLoaded(data: state.data);
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class _ScrollableState extends StatelessWidget {
  const _ScrollableState({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(child: child),
          ),
        );
      },
    );
  }
}
