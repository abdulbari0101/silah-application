import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/training/domain/entities/training_application_entity.dart';
import 'package:silah_app/features/training/domain/repositories/training_repository.dart';

abstract class TraineeApplicationsState {
  const TraineeApplicationsState();
}

class TraineeApplicationsInitial extends TraineeApplicationsState {
  const TraineeApplicationsInitial();
}

class TraineeApplicationsLoading extends TraineeApplicationsState {
  const TraineeApplicationsLoading();
}

class TraineeApplicationsLoaded extends TraineeApplicationsState {
  final List<TrainingApplicationEntity> applications;
  const TraineeApplicationsLoaded({required this.applications});
}

class TraineeApplicationsEmpty extends TraineeApplicationsState {
  const TraineeApplicationsEmpty();
}

class TraineeApplicationsError extends TraineeApplicationsState {
  final String message;
  const TraineeApplicationsError({required this.message});
}

class TraineeApplicationsCubit extends Cubit<TraineeApplicationsState> {
  final TrainingRepository repository;

  TraineeApplicationsCubit({required this.repository})
    : super(const TraineeApplicationsInitial());

  Future<void> load() async {
    emit(const TraineeApplicationsLoading());
    final result = await repository.fetchMyApplications();
    result.fold(
      (failure) =>
          emit(TraineeApplicationsError(message: _mapFailure(failure))),
      (data) {
        if (data.isEmpty) {
          emit(const TraineeApplicationsEmpty());
        } else {
          emit(TraineeApplicationsLoaded(applications: data));
        }
      },
    );
  }

  String _mapFailure(Failure failure) {
    return BlocUtils.mergeCodeWithMessage(
      failure,
      codeToMessageMap,
      includeCodeLine: false,
      fallbackMessage: 'Unexpected error',
    );
  }
}
