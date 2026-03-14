import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_close_reason.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_request_entity.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_status.dart';
import 'package:silah_app/features/consultations/domain/repositories/consultations_repository.dart';

part 'consultation_requests_cubit.freezed.dart';

@freezed
sealed class ConsultationRequestsState with _$ConsultationRequestsState {
  const factory ConsultationRequestsState.initial({
    required ConsultationStatus filter,
  }) = _ConsultationRequestsInitial;
  const factory ConsultationRequestsState.loading({
    required ConsultationStatus filter,
  }) = _ConsultationRequestsLoading;
  const factory ConsultationRequestsState.loaded({
    required ConsultationStatus filter,
    required List<ConsultationRequestEntity> requests,
    String? updatingId,
  }) = _ConsultationRequestsLoaded;
  const factory ConsultationRequestsState.empty({
    required ConsultationStatus filter,
  }) = _ConsultationRequestsEmpty;
  const factory ConsultationRequestsState.error({
    required ConsultationStatus filter,
    required String message,
  }) = _ConsultationRequestsError;
}

class ConsultationRequestsCubit extends Cubit<ConsultationRequestsState> {
  ConsultationRequestsCubit({
    required this.repository,
    ConsultationStatus initialFilter = ConsultationStatus.pending,
  }) : _filter = initialFilter,
       super(ConsultationRequestsState.initial(filter: initialFilter));

  final ConsultationsRepository repository;
  ConsultationStatus _filter;
  List<ConsultationRequestEntity> _requests = [];
  StreamSubscription<List<ConsultationRequestEntity>>? _requestsSubscription;

  Future<void> load() async {
    await _requestsSubscription?.cancel();
    emit(ConsultationRequestsState.loading(filter: _filter));
    final result = await repository.fetchMyRequests();
    result.fold(
      (failure) => emit(
        ConsultationRequestsState.error(
          filter: _filter,
          message: _mapFailure(failure),
        ),
      ),
      (data) {
        _requests = data;
        _emitFiltered();
        _requestsSubscription = repository.watchMyRequests().listen(
          (items) {
            _requests = items;
            _emitFiltered();
          },
          onError: (Object error, StackTrace stackTrace) {
            emit(
              ConsultationRequestsState.error(
                filter: _filter,
                message: _mapStreamError(error),
              ),
            );
          },
        );
      },
    );
  }

  void setFilter(ConsultationStatus filter) {
    _filter = filter;
    _emitFiltered();
  }

  Future<void> updateStatus(
    String requestId,
    ConsultationStatus status, {
    ConsultationCloseReason? closeReason,
  }) async {
    emit(
      ConsultationRequestsState.loaded(
        filter: _filter,
        requests: _filteredRequests(),
        updatingId: requestId,
      ),
    );

    final result = await repository.updateRequestStatus(
      requestId,
      status,
      closeReason: closeReason,
    );
    result.fold(
      (failure) => emit(
        ConsultationRequestsState.error(
          filter: _filter,
          message: _mapFailure(failure),
        ),
      ),
      (updated) {
        _requests = _requests
            .map((item) => item.id == updated.id ? updated : item)
            .toList();
        _emitFiltered();
      },
    );
  }

  List<ConsultationRequestEntity> _filteredRequests() {
    return _requests.where(_matchesFilter).toList();
  }

  bool _matchesFilter(ConsultationRequestEntity request) {
    return request.status.matchesRequestsFilter(_filter);
  }

  void _emitFiltered() {
    final filtered = _filteredRequests();
    if (filtered.isEmpty) {
      emit(ConsultationRequestsState.empty(filter: _filter));
    } else {
      emit(
        ConsultationRequestsState.loaded(filter: _filter, requests: filtered),
      );
    }
  }

  String _mapFailure(Failure failure) {
    return BlocUtils.mergeCodeWithMessage(
      failure,
      codeToMessageMap,
      includeCodeLine: false,
      fallbackMessage: Strings.unexpected_error,
    );
  }

  String _mapStreamError(Object error) {
    if (error is Failure) {
      return _mapFailure(error);
    }
    return Strings.unexpected_error;
  }

  @override
  Future<void> close() async {
    await _requestsSubscription?.cancel();
    return super.close();
  }
}
