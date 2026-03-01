import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/training/domain/entities/training_application_entity.dart';
import 'package:silah_app/features/training/domain/repositories/training_repository.dart';

part 'training_application_cubit.freezed.dart';

@freezed
class TrainingApplicationState with _$TrainingApplicationState {
  const factory TrainingApplicationState.idle() = _TrainingApplicationIdle;
  const factory TrainingApplicationState.submitting() = _TrainingApplicationSubmitting;
  const factory TrainingApplicationState.success({
    required TrainingApplicationEntity application,
  }) = _TrainingApplicationSuccess;
  const factory TrainingApplicationState.failure({required String message}) =
      _TrainingApplicationFailure;
}

class TrainingApplicationCubit extends Cubit<TrainingApplicationState> {
  final TrainingRepository repository;

  TrainingApplicationCubit({required this.repository})
      : super(const TrainingApplicationState.idle());

  Future<void> submit(TrainingApplicationEntity application) async {
    emit(const TrainingApplicationState.submitting());
    final result = await repository.submitApplication(application);
    result.fold(
      (failure) => emit(TrainingApplicationState.failure(message: _mapFailure(failure))),
      (created) => emit(TrainingApplicationState.success(application: created)),
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
