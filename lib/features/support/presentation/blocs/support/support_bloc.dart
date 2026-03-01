import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/domain/entities/api/request/post_request_entity.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_entity.dart';
import 'package:silah_app/features/support/domain/repositories/support_tickets_repository.dart';

part 'support_event.dart';
part 'support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  final SupportTicketsRepository repository;
  PostRequestEntity postRequest = PostRequestEntity();

  SupportBloc({required this.repository}) : super(DataPaymentInitial()) {
    on<LoadSupports>(
      _onSupportsEvent,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
  }

  Future<void> _onSupportsEvent(
    LoadSupports event,
    Emitter<SupportState> emit,
  ) async {
    emit(DataPaymentLoading());

    final result = await repository.submitTicket(SupportTicketEntity());

    result.fold((failure) => _emitFailure(failure, emit), (data) {
      emit(DataPaymentLoaded(data: []));
    });
  }

  void _emitFailure(Failure failure, Emitter<SupportState> emit) {
    emit(
      BlocUtils.handleFailure(
        failure: failure,
        onError: (msg) => DataPaymentError(message: msg),
        codeToMessageMap: codeToMessageMap,
      ),
    );
  }
}
