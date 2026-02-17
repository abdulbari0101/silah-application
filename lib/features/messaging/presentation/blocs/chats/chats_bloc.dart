import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/domain/entities/api/request/post_request_entity.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/messaging/domain/entities/chat_item_entity.dart';
import 'package:silah_app/features/messaging/domain/repositories/chat_repository.dart';

part 'chats_event.dart';
part 'chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final ChatsRepository repository;
  PostRequestEntity postRequest = PostRequestEntity();

  ChatsBloc({required this.repository}) : super(DataChatInitial()) {
    on<LoadChats>(
      _onChatsEvent,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
  }

  Future<void> _onChatsEvent(LoadChats event, Emitter<ChatsState> emit) async {
    emit(DataChatLoading());

    final result = await repository.Chat(PostRequestEntity());

    result.fold((failure) => _emitFailure(failure, emit), (data) {
      emit(DataChatLoaded(data: []));
    });
  }

  void _emitFailure(Failure failure, Emitter<ChatsState> emit) {
    emit(
      BlocUtils.handleFailure(
        failure: failure,
        onError: (msg) => DataChatError(message: msg),
        codeToMessageMap: codeToMessageMap,
      ),
    );
  }
}
