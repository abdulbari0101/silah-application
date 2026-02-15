import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/domain/entities/api/request/post_request_entity.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/requests/domain/entities/request_item_entity.dart';
import 'package:silah_app/features/requests/domain/repositories/request_repository.dart';

part 'requests_event.dart';
part 'requests_state.dart';

class RequestsBloc extends Bloc<RequestsEvent, RequestsState> {
  final RequestsRepository repository;
  PostRequestEntity postRequest = PostRequestEntity();

  RequestsBloc({required this.repository}) : super(DataRequestInitial()) {
    on<LoadRequests>(
      _onRequestsEvent,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
  }

  Future<void> _onRequestsEvent(LoadRequests event, Emitter<RequestsState> emit) async {
    emit(DataRequestLoading());

    final result = await repository.Request(PostRequestEntity());

    result.fold((failure) => _emitFailure(failure, emit), (data) {
      emit(DataRequestLoaded(data: []));
    });
  }

  void _emitFailure(Failure failure, Emitter<RequestsState> emit) {
    emit(
      BlocUtils.handleFailure(
        failure: failure,
        onError: (msg) => DataRequestError(message: msg),
        codeToMessageMap: codeToMessageMap,
      ),
    );
  }
}
