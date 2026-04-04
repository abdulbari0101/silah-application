import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/training/domain/entities/training_application_entity.dart';
import 'package:silah_app/features/training/domain/entities/training_application_status.dart';
import 'package:silah_app/features/training/domain/repositories/training_repository.dart';

part 'trainees_cubit.freezed.dart';

@freezed
class TraineesState with _$TraineesState {
  const factory TraineesState.initial() = _TraineesInitial;
  const factory TraineesState.loading() = _TraineesLoading;
  const factory TraineesState.loaded({
    required List<TrainingApplicationEntity> applications,
    String? updatingId,
  }) = _TraineesLoaded;
  const factory TraineesState.empty() = _TraineesEmpty;
  const factory TraineesState.error({required String message}) = _TraineesError;
}

class TraineesCubit extends Cubit<TraineesState> {
  TraineesCubit({required this.repository})
    : super(const TraineesState.initial());

  final TrainingRepository repository;
  List<TrainingApplicationEntity> _applications = [];

  Future<void> load() async {
    emit(const TraineesState.loading());
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      emit(TraineesState.error(message: Strings.unexpected_error.tr()));
      return;
    }

    final result = await repository.fetchApplicationsForLawyer(uid);
    result.fold(
      (failure) => emit(TraineesState.error(message: _mapFailure(failure))),
      (data) {
        _applications = data;
        if (data.isEmpty) {
          emit(const TraineesState.empty());
        } else {
          emit(TraineesState.loaded(applications: data));
        }
      },
    );
  }

  Future<void> updateStatus(
    String applicationId,
    TrainingApplicationStatus status,
  ) async {
    emit(
      TraineesState.loaded(
        applications: _applications,
        updatingId: applicationId,
      ),
    );

    final result = await repository.updateApplicationStatus(
      applicationId,
      status,
    );
    result.fold(
      (failure) => emit(TraineesState.error(message: _mapFailure(failure))),
      (updated) {
        _applications = _applications
            .map(
              (item) => item.id == updated.id
                  ? item.copyWith(status: updated.status)
                  : item,
            )
            .toList();
        emit(TraineesState.loaded(applications: _applications));
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
