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

  ChatConversationCubit({required this.repository, required this.threadId})
    : super(const ChatConversationState.loading());

  Future<void> load() async {
    emit(const ChatConversationState.loading());
    final result = await repository.fetchMessages(threadId);
    result.fold(
      (failure) =>
          emit(ChatConversationState.failure(message: _mapFailure(failure))),
      (messages) => emit(ChatConversationState.ready(messages: messages)),
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
    emit(
      ChatConversationState.ready(messages: currentMessages, isSending: true),
    );

    final message = MessageEntity(
      threadId: threadId,
      senderId: senderId,
      body: trimmed,
      type: MessageType.text,
    );

    final result = await repository.sendMessage(message);
    await result.fold((failure) async {
      emit(
        ChatConversationState.failure(
          message: _mapFailure(failure),
          messages: currentMessages,
        ),
      );
    }, (_) async => load());
  }

  String _mapFailure(Failure failure) {
    return BlocUtils.mergeCodeWithMessage(
      failure,
      codeToMessageMap,
      includeCodeLine: false,
      fallbackMessage: Strings.unexpected_error,
    );
  }
}
