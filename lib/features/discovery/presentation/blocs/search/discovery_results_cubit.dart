import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/discovery/domain/entities/discovery_request_entity.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';
import 'package:silah_app/features/discovery/domain/repositories/discovery_repository.dart';
import 'package:silah_app/features/profiles/domain/entities/lawyer_profile_entity.dart';

part 'discovery_results_cubit.freezed.dart';

@freezed
class DiscoveryResultsState with _$DiscoveryResultsState {
  const factory DiscoveryResultsState.loading() = _DiscoveryResultsLoading;
  const factory DiscoveryResultsState.ready({
    required LegalSpecializationEntity specialization,
    required List<LawyerProfileEntity> lawyers,
  }) = _DiscoveryResultsReady;
  const factory DiscoveryResultsState.failure({required String message}) =
      _DiscoveryResultsFailure;
}

class DiscoveryResultsCubit extends Cubit<DiscoveryResultsState> {
  final DiscoveryRepository repository;
  final LegalSpecializationEntity specialization;

  DiscoveryResultsCubit({
    required this.repository,
    required this.specialization,
  }) : super(const DiscoveryResultsState.loading());

  Future<void> load() async {
    emit(const DiscoveryResultsState.loading());
    final request = DiscoveryRequestEntity(
      specializationId: specialization.id,
      specializationName: specialization.name ?? specialization.code,
    );
    final result = await repository.fetchLawyersBySpecialization(request);
    result.fold(
      (failure) =>
          emit(DiscoveryResultsState.failure(message: _mapFailure(failure))),
      (data) {
        final lawyers = data
            .map((item) => item.lawyer)
            .whereType<LawyerProfileEntity>()
            .toList();
        emit(
          DiscoveryResultsState.ready(
            specialization: specialization,
            lawyers: lawyers,
          ),
        );
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
