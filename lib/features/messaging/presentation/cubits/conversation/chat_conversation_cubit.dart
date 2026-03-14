import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/messaging/domain/entities/message_entity.dart';
import 'package:silah_app/features/messaging/domain/entities/message_type.dart';
import 'package:silah_app/features/messaging/domain/repositories/messaging_repository.dart';

part 'chat_conversation_cubit.freezed.dart';

@freezed
class ChatConversationState with _$ChatConversationState {
  const factory ChatConversationState.loading() = _ChatConversationLoading;
  const factory ChatConversationState.ready({
    required List<MessageEntity> messages,
    @Default(false) bool isSending,
  }) = _ChatConversationReady;
  const factory ChatConversationState.failure({
    required String message,
    List<MessageEntity>? messages,
  }) = _ChatConversationFailure;
}

class ChatConversationCubit extends Cubit<ChatConversationState> {
  final MessagingRepository repository;
  final String threadId;
  StreamSubscription<List<MessageEntity>>? _messagesSubscription;

  ChatConversationCubit({required this.repository, required this.threadId})
    : super(const ChatConversationState.loading());

  Future<void> load() async {
    await _messagesSubscription?.cancel();
    emit(const ChatConversationState.loading());
    final result = await repository.fetchMessages(threadId);
    result.fold(
      (failure) {
        emit(ChatConversationState.failure(message: _mapFailure(failure)));
      },
      (messages) {
        emit(ChatConversationState.ready(messages: messages));
        _messagesSubscription = repository
            .watchMessages(threadId)
            .listen(
              (items) {
                final isSending = state.maybeWhen(
                  ready: (_, sending) => sending,
                  orElse: () => false,
                );
                emit(
                  ChatConversationState.ready(
                    messages: items,
                    isSending: isSending,
                  ),
                );
              },
              onError: (_, __) {
                final currentMessages = state.maybeWhen(
                  ready: (items, _) => items,
                  failure: (_, items) => items ?? const <MessageEntity>[],
                  orElse: () => const <MessageEntity>[],
                );
                emit(
                  ChatConversationState.failure(
                    message: Strings.unexpected_error.tr(),
                    messages: currentMessages,
                  ),
                );
              },
            );
      },
    );
  }

  Future<void> sendMessage({
    required String senderId,
    required String text,
  }) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;

    final currentMessages = state.maybeWhen(
      ready: (messages, _) => messages,
      failure: (_, messages) => messages ?? const <MessageEntity>[],
      orElse: () => const <MessageEntity>[],
    );
    final optimisticMessage = MessageEntity(
      id: 'local_${DateTime.now().microsecondsSinceEpoch}',
      threadId: threadId,
      senderId: senderId,
      body: trimmed,
      type: MessageType.text,
      sentAt: DateTime.now().toIso8601String(),
    );
    final optimisticMessages = [...currentMessages, optimisticMessage];
    emit(
      ChatConversationState.ready(
        messages: optimisticMessages,
        isSending: true,
      ),
    );

    final message = MessageEntity(
      threadId: threadId,
      senderId: senderId,
      body: trimmed,
      type: MessageType.text,
    );

    final result = await repository.sendMessage(message);
    await result.fold(
      (failure) async {
        emit(
          ChatConversationState.failure(
            message: _mapFailure(failure),
            messages: currentMessages,
          ),
        );
      },
      (_) async {
        emit(
          ChatConversationState.ready(
            messages: optimisticMessages,
            isSending: false,
          ),
        );
      },
    );
  }

  String _mapFailure(Failure failure) {
    return BlocUtils.mergeCodeWithMessage(
      failure,
      codeToMessageMap,
      includeCodeLine: false,
      fallbackMessage: Strings.unexpected_error,
    );
  }

  @override
  Future<void> close() async {
    await _messagesSubscription?.cancel();
    return super.close();
  }
}
