import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/training/domain/entities/training_opportunity_entity.dart';
import 'package:silah_app/features/training/domain/repositories/training_repository.dart';

part 'training_opportunities_cubit.freezed.dart';

@freezed
class TrainingOpportunitiesState with _$TrainingOpportunitiesState {
  const factory TrainingOpportunitiesState.loading() = _TrainingOpportunitiesLoading;
  const factory TrainingOpportunitiesState.ready({
    required List<TrainingOpportunityEntity> opportunities,
  }) = _TrainingOpportunitiesReady;
  const factory TrainingOpportunitiesState.empty() = _TrainingOpportunitiesEmpty;
  const factory TrainingOpportunitiesState.failure({required String message}) =
      _TrainingOpportunitiesFailure;
}

class TrainingOpportunitiesCubit extends Cubit<TrainingOpportunitiesState> {
  final TrainingRepository repository;
  final String? lawyerUid;

  TrainingOpportunitiesCubit({required this.repository, this.lawyerUid})
      : super(const TrainingOpportunitiesState.loading());

  Future<void> load() async {
    emit(const TrainingOpportunitiesState.loading());
    final result = await repository.fetchOpportunities(lawyerUid: lawyerUid);
    result.fold(
      (failure) => emit(TrainingOpportunitiesState.failure(message: _mapFailure(failure))),
      (data) {
        if (data.isEmpty) {
          emit(const TrainingOpportunitiesState.empty());
        } else {
          emit(TrainingOpportunitiesState.ready(opportunities: data));
        }
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
