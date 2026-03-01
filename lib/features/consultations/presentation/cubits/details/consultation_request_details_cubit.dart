import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_request_entity.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_status.dart';
import 'package:silah_app/features/consultations/domain/repositories/consultations_repository.dart';

part 'consultation_request_details_cubit.freezed.dart';

@freezed
class ConsultationRequestDetailsState with _$ConsultationRequestDetailsState {
  const factory ConsultationRequestDetailsState.loading() =
      _ConsultationRequestDetailsLoading;
  const factory ConsultationRequestDetailsState.ready({
    required ConsultationRequestEntity request,
    @Default(false) bool isUpdating,
  }) = _ConsultationRequestDetailsReady;
  const factory ConsultationRequestDetailsState.failure({
    required String message,
    ConsultationRequestEntity? request,
  }) = _ConsultationRequestDetailsFailure;
}

class ConsultationRequestDetailsCubit
    extends Cubit<ConsultationRequestDetailsState> {
  final ConsultationsRepository repository;
  ConsultationRequestEntity? _request;

  ConsultationRequestDetailsCubit({
    required this.repository,
    ConsultationRequestEntity? initial,
  }) : _request = initial,
       super(
         initial == null
             ? const ConsultationRequestDetailsState.loading()
             : ConsultationRequestDetailsState.ready(request: initial),
       );

  Future<void> load(String requestId) async {
    emit(const ConsultationRequestDetailsState.loading());
    final result = await repository.fetchRequestById(requestId);
    result.fold(
      (failure) => emit(
        ConsultationRequestDetailsState.failure(
          message: _mapFailure(failure),
          request: _request,
        ),
      ),
      (data) {
        _request = data;
        emit(ConsultationRequestDetailsState.ready(request: data));
      },
    );
  }

  Future<void> updateStatus(ConsultationStatus status) async {
    final current = _request;
    if (current == null || current.id == null) return;

    emit(
      ConsultationRequestDetailsState.ready(request: current, isUpdating: true),
    );

    final result = await repository.updateRequestStatus(current.id!, status);
    result.fold(
      (failure) => emit(
        ConsultationRequestDetailsState.failure(
          message: _mapFailure(failure),
          request: current,
        ),
      ),
      (updated) {
        _request = updated;
        emit(ConsultationRequestDetailsState.ready(request: updated));
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
