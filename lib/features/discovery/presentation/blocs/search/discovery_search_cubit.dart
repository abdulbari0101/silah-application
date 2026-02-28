import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';
import 'package:silah_app/features/discovery/domain/repositories/discovery_repository.dart';

part 'discovery_search_cubit.freezed.dart';

@freezed
class DiscoverySearchState with _$DiscoverySearchState {
  const factory DiscoverySearchState.loading() = _DiscoverySearchLoading;
  const factory DiscoverySearchState.ready({
    required List<LegalSpecializationEntity> specializations,
    LegalSpecializationEntity? selected,
    String? query,
  }) = _DiscoverySearchReady;
  const factory DiscoverySearchState.failure({required String message}) = _DiscoverySearchFailure;
}

class DiscoverySearchCubit extends Cubit<DiscoverySearchState> {
  final DiscoveryRepository repository;

  DiscoverySearchCubit({required this.repository}) : super(const DiscoverySearchState.loading());

  Future<void> load() async {
    emit(const DiscoverySearchState.loading());
    final result = await repository.fetchSpecializations();
    result.fold(
      (failure) => emit(DiscoverySearchState.failure(message: _mapFailure(failure))),
      (data) => emit(DiscoverySearchState.ready(specializations: data)),
    );
  }

  void select(LegalSpecializationEntity specialization) {
    state.maybeWhen(
      ready: (specializations, _, query) => emit(
        DiscoverySearchState.ready(
          specializations: specializations,
          selected: specialization,
          query: query,
        ),
      ),
      orElse: () => null,
    );
  }

  void updateQuery(String value) {
    final trimmed = value.trim();
    state.maybeWhen(
      ready: (specializations, selected, _) => emit(
        DiscoverySearchState.ready(
          specializations: specializations,
          selected: selected,
          query: trimmed,
        ),
      ),
      orElse: () => null,
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
