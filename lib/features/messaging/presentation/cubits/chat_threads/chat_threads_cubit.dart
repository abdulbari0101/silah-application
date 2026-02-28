import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/messaging/domain/entities/chat_thread_entity.dart';
import 'package:silah_app/features/messaging/domain/repositories/messaging_repository.dart';

part 'chat_threads_cubit.freezed.dart';

@freezed
class ChatThreadsState with _$ChatThreadsState {
  const factory ChatThreadsState.initial() = _ChatThreadsInitial;
  const factory ChatThreadsState.loading() = _ChatThreadsLoading;
  const factory ChatThreadsState.loaded({required List<ChatThreadEntity> threads}) =
      _ChatThreadsLoaded;
  const factory ChatThreadsState.empty() = _ChatThreadsEmpty;
  const factory ChatThreadsState.error({required String message}) = _ChatThreadsError;
}

class ChatThreadsCubit extends Cubit<ChatThreadsState> {
  ChatThreadsCubit({required this.repository}) : super(const ChatThreadsState.initial());

  final MessagingRepository repository;

  Future<void> load() async {
    emit(const ChatThreadsState.loading());
    final result = await repository.fetchThreads();
    result.fold(
      (failure) => emit(ChatThreadsState.error(message: _mapFailure(failure))),
      (threads) {
        if (threads.isEmpty) {
          emit(const ChatThreadsState.empty());
        } else {
          emit(ChatThreadsState.loaded(threads: threads));
        }
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
}
