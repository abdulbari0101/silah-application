import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/features/messaging/domain/entities/message_entity.dart';
import 'package:silah_app/features/messaging/presentation/cubits/conversation/chat_conversation_cubit.dart';

class ChatConversationBody extends StatefulWidget {
  const ChatConversationBody({
    super.key,
    required this.threadId,
    this.isMessagingEnabled = true,
    this.messagingDisabledNotice,
  });

  final String threadId;
  final bool isMessagingEnabled;
  final String? messagingDisabledNotice;

  @override
  State<ChatConversationBody> createState() => _ChatConversationBodyState();
}

class _ChatConversationBodyState extends State<ChatConversationBody> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String? _lastRenderedMessageKey;

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ChatConversationBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isMessagingEnabled && !widget.isMessagingEnabled) {
      _controller.clear();
      FocusScope.of(context).unfocus();
    }
  }

  void _send(BuildContext context) {
    if (!widget.isMessagingEnabled) {
      Toasts.error(
        context,
        widget.messagingDisabledNotice ??
            Strings.consultation_messaging_unavailable_message.tr(),
      );
      return;
    }
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      Toasts.error(context, Strings.unexpected_error.tr());
      return;
    }
    final text = _controller.text;
    if (text.trim().isEmpty) return;
    _controller.clear();
    context.read<ChatConversationCubit>().sendMessage(
      senderId: uid,
      text: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatConversationCubit, ChatConversationState>(
      builder: (context, state) {
        final renderedMessages = state.maybeWhen(
          ready: (messages, _) => messages,
          failure: (_, messages) => messages ?? const <MessageEntity>[],
          orElse: () => const <MessageEntity>[],
        );
        _syncScroll(renderedMessages);

        return state.when(
          loading: () => const Center(child: ProgressStateWidget()),
          failure: (message, messages) => Column(
            children: [
              Expanded(
                child: messages == null || messages.isEmpty
                    ? Center(
                        child: CustomeErrorWidget(
                          message: message,
                          onRetry: () =>
                              context.read<ChatConversationCubit>().load(),
                        ),
                      )
                    : _buildMessagesList(messages),
              ),
              _buildComposer(isSending: false),
            ],
          ),
          ready: (messages, isSending) => Column(
            children: [
              Expanded(child: _buildMessagesList(messages)),
              _buildComposer(isSending: isSending),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMessagesList(List<MessageEntity> messages) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      itemCount: messages.length,
      separatorBuilder: (_, __) => UIConstants.smallHeight,
      itemBuilder: (context, index) {
        final message = messages[index];
        final isMe = uid != null && message.senderId == uid;
        return _buildMessageBubble(message, isMe);
      },
    );
  }

  void _syncScroll(List<MessageEntity> messages) {
    final lastMessage = messages.isNotEmpty ? messages.last : null;
    final messageKey =
        '${lastMessage?.id ?? ''}:${lastMessage?.sentAt ?? ''}:${messages.length}';
    if (_lastRenderedMessageKey == messageKey) {
      return;
    }
    _lastRenderedMessageKey = messageKey;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scrollController.hasClients) {
        return;
      }
      final target = _scrollController.position.maxScrollExtent;
      if (target <= 0) {
        return;
      }
      _scrollController.animateTo(
        target,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
      );
    });
  }

  Widget _buildMessageBubble(MessageEntity message, bool isMe) {
    final background = isMe
        ? context.colors.primary
        : context.colors.surfaceContainerHighest.withAlphaOpacity(0.6);
    final foreground = isMe
        ? context.colors.onPrimary
        : context.colors.onSurface;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadiusDirectional.only(
            topStart: const Radius.circular(18),
            topEnd: const Radius.circular(18),
            bottomStart: Radius.circular(isMe ? 18 : 6),
            bottomEnd: Radius.circular(isMe ? 6 : 18),
          ),
        ),
        child: Text(
          message.body ?? Strings.not_available.tr(),
          style: context.textTheme.bodySmall?.copyWith(color: foreground),
        ),
      ),
    );
  }

  Widget _buildComposer({required bool isSending}) {
    final isComposerEnabled = widget.isMessagingEnabled && !isSending;
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.messagingDisabledNotice?.trim().isNotEmpty == true)
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 8,
                  end: 8,
                  bottom: 8,
                ),
                child: Text(
                  widget.messagingDisabledNotice!,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: context.colors.surface,
                borderRadius: BorderRadius.circular(28),
                boxShadow: context.shadowSoft,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: _controller,
                        enabled: isComposerEnabled,
                        minLines: 1,
                        maxLines: 3,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          isCollapsed: true,
                          hintText: Strings.messages.tr(),
                          hintStyle: context.textTheme.bodyMedium?.copyWith(
                            color: context.colors.onSurfaceVariant,
                          ),
                          filled: false,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  UIConstants.smallWidth,
                  InkWell(
                    onTap: isComposerEnabled ? () => _send(context) : null,
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: isComposerEnabled
                            ? context.colors.primary
                            : context.colors.disabled,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.send_rounded,
                        color: context.colors.onPrimary,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
