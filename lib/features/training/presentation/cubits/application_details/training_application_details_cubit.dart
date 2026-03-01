import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/training/domain/entities/training_application_entity.dart';
import 'package:silah_app/features/training/domain/entities/training_application_status.dart';
import 'package:silah_app/features/training/domain/repositories/training_repository.dart';

part 'training_application_details_cubit.freezed.dart';

@freezed
abstract class TrainingApplicationDetailsState
    with _$TrainingApplicationDetailsState {
  const factory TrainingApplicationDetailsState.ready({
    required TrainingApplicationEntity application,
    @Default(false) bool isUpdating,
  }) = _TrainingApplicationDetailsReady;
  const factory TrainingApplicationDetailsState.failure({
    required String message,
    TrainingApplicationEntity? application,
  }) = _TrainingApplicationDetailsFailure;
}

class TrainingApplicationDetailsCubit
    extends Cubit<TrainingApplicationDetailsState> {
  final TrainingRepository repository;
  TrainingApplicationEntity _application;

  TrainingApplicationDetailsCubit({
    required this.repository,
    required TrainingApplicationEntity initial,
  }) : _application = initial,
       super(TrainingApplicationDetailsState.ready(application: initial));

  Future<void> updateStatus(TrainingApplicationStatus status) async {
    if (_application.id == null || _application.id!.isEmpty) return;

    emit(
      TrainingApplicationDetailsState.ready(
        application: _application,
        isUpdating: true,
      ),
    );

    final result = await repository.updateApplicationStatus(
      _application.id!,
      status,
    );
    result.fold(
      (failure) => emit(
        TrainingApplicationDetailsState.failure(
          message: _mapFailure(failure),
          application: _application,
        ),
      ),
      (updated) {
        _application = _application.copyWith(status: updated.status);
        emit(TrainingApplicationDetailsState.ready(application: _application));
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
