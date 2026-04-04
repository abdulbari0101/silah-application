import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_request_entity.dart';
import 'package:silah_app/features/consultations/domain/repositories/consultations_repository.dart';

part 'consultation_request_cubit.freezed.dart';

@freezed
class ConsultationRequestState with _$ConsultationRequestState {
  const factory ConsultationRequestState.idle() = _ConsultationRequestIdle;
  const factory ConsultationRequestState.submitting() =
      _ConsultationRequestSubmitting;
  const factory ConsultationRequestState.success({
    required ConsultationRequestEntity request,
  }) = _ConsultationRequestSuccess;
  const factory ConsultationRequestState.failure({required String message}) =
      _ConsultationRequestFailure;
}

class ConsultationRequestCubit extends Cubit<ConsultationRequestState> {
  final ConsultationsRepository repository;

  ConsultationRequestCubit({required this.repository})
    : super(const ConsultationRequestState.idle());

  Future<void> submit(ConsultationRequestEntity request) async {
    emit(const ConsultationRequestState.submitting());
    final result = await repository.createRequest(request);
    result.fold(
      (failure) =>
          emit(ConsultationRequestState.failure(message: _mapFailure(failure))),
      (created) => emit(ConsultationRequestState.success(request: created)),
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
