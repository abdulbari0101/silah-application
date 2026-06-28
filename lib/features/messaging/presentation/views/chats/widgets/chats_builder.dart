import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/theme/extentions/text_styling_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button_with_progress.dart';
import 'package:silah_app/core/presentation/ui/widget/image/app_remote_avatar.dart';
import 'package:silah_app/core/presentation/ui/widget/resolvers/resolved_display_widgets.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/empty_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';
import 'package:silah_app/features/messaging/domain/entities/chat_thread_entity.dart';
import 'package:silah_app/features/messaging/presentation/cubits/chat_threads/chat_threads_cubit.dart';
import 'package:silah_app/features/messaging/presentation/views/conversation/models/chat_conversation_args.dart';

enum ChatCategory { consultation, training }

class ChatThreadsBuilder extends StatelessWidget {
  const ChatThreadsBuilder({super.key, required this.category});

  final ChatCategory category;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatThreadsCubit, ChatThreadsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: ProgressStateWidget()),
          loading: () => const Center(child: ProgressStateWidget()),
          empty: () => _ScrollableState(
            child: EmptyWidget(
              retryWidget: PrimaryButtonWithProgress(
                text: Strings.try_again.tr(),
                onTap: () => context.read<ChatThreadsCubit>().load(),
                isLoading: false,
              ),
            ),
          ),
          error: (message) => _ScrollableState(
            child: CustomeErrorWidget(
              message: message,
              onRetry: () => context.read<ChatThreadsCubit>().load(),
            ),
          ),
          loaded: (threads) {
            final filteredThreads = threads.where((thread) {
              if (category == ChatCategory.consultation) {
                return thread.consultationId != null;
              } else {
                return thread.trainingApplicationId != null;
              }
            }).toList();

            if (filteredThreads.isEmpty) {
              return _ScrollableState(
                child: EmptyWidget(
                  retryWidget: PrimaryButtonWithProgress(
                    text: Strings.try_again.tr(),
                    onTap: () => context.read<ChatThreadsCubit>().load(),
                    isLoading: false,
                  ),
                ),
              );
            }

            return ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: filteredThreads.length,
              separatorBuilder: (_, __) => UIConstants.smallHeight,
              itemBuilder: (context, index) {
                final thread = filteredThreads[index];
                return _ChatThreadTile(thread: thread);
              },
            );
          },
        );
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

class _ChatThreadTile extends StatelessWidget {
  const _ChatThreadTile({required this.thread});

  final ChatThreadEntity thread;

  @override
  Widget build(BuildContext context) {
    final lastMessage = thread.lastMessage?.body ?? '';
    final updatedAt = thread.updatedAt ?? '';
    final participants = thread.participantIds ?? const <String>[];
    final currentUid = FirebaseAuth.instance.currentUser?.uid;
    final otherParticipantId = participants.firstWhere(
      (item) => item != currentUid,
      orElse: () => participants.isNotEmpty ? participants.first : '',
    );
    final authUser = context.select<AppStateBloc, AuthUserEntity?>(
      (bloc) => bloc.state.data.customer,
    );
    final avatarVariant = authUser?.accountType == AuthAccountType.lawyer
        ? AppAvatarVariant.user
        : AppAvatarVariant.lawyer;
    final subtitle = lastMessage.isNotEmpty
        ? lastMessage
        : Strings.messages.tr();

    return InkWell(
      borderRadius: context.shapes.brMd,
      onTap: () => context.pushNamed(
        AppRoutes.chatThread.name,
        extra: ChatConversationArgs(thread: thread).toJson(),
      ),
      child: Card(
        elevation: 0,
        color: context.colors.surface,
        shape: context.shapes.roundedMd,
        child: Padding(
          padding: const EdgeInsets.all(UIConstants.mediumPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResolvedUserAvatar(
                userId: otherParticipantId,
                radius: 20,
                variant: avatarVariant,
              ),
              UIConstants.mediumWidth,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResolvedUserName(
                      userId: otherParticipantId,
                      fallback: Strings.user.tr(),
                      builder: (name) =>
                          Text(name, style: context.textTheme.titleSmall),
                    ),
                    UIConstants.xsmallHeight,
                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (updatedAt.isNotEmpty)
                    Text(
                      updatedAt,
                      style: context.textTheme.labelSmall?.onSurfaceVariant(
                        context,
                      ),
                    ),
                  if (thread.unreadCount > 0) ...[
                    UIConstants.smallHeight,
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: context.colors.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        thread.unreadCount.toString(),
                        style: context.textTheme.labelSmall?.copyWith(
                          color: context.colors.onPrimary,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
