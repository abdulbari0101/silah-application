import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/lookups/domain/entities/lookup_item_entity.dart';
import 'package:silah_app/features/lookups/domain/repositories/lookups_repository.dart';

part 'training_lookups_cubit.freezed.dart';

@freezed
class TrainingLookupsState with _$TrainingLookupsState {
  const factory TrainingLookupsState.loading() = _TrainingLookupsLoading;
  const factory TrainingLookupsState.ready({
    required List<LookupItemEntity> areas,
    required List<LookupItemEntity> cities,
    LookupItemEntity? selectedArea,
    LookupItemEntity? selectedCity,
  }) = _TrainingLookupsReady;
  const factory TrainingLookupsState.failure({required String message}) = _TrainingLookupsFailure;
}

class TrainingLookupsCubit extends Cubit<TrainingLookupsState> {
  final LookupsRepository repository;

  TrainingLookupsCubit({required this.repository})
      : super(const TrainingLookupsState.loading());

  Future<void> load() async {
    emit(const TrainingLookupsState.loading());

    final areasResult = await repository.fetchAreas();
    await areasResult.fold(
      (failure) async => emit(TrainingLookupsState.failure(message: _mapFailure(failure))),
      (areas) async {
        final firstArea = areas.isNotEmpty ? areas.first : null;
        final citiesResult = await repository.fetchCities(areaId: firstArea?.id);
        citiesResult.fold(
          (failure) => emit(TrainingLookupsState.failure(message: _mapFailure(failure))),
          (cities) => emit(
            TrainingLookupsState.ready(
              areas: areas,
              cities: cities,
              selectedArea: firstArea,
              selectedCity: cities.isNotEmpty ? cities.first : null,
            ),
          ),
        );
      },
    );
  }

  Future<void> selectArea(LookupItemEntity? area) async {
    final current = state.maybeWhen(
      ready: (areas, cities, selectedArea, selectedCity) => _ReadyData(
        areas: areas,
        cities: cities,
        selectedArea: selectedArea,
        selectedCity: selectedCity,
      ),
      orElse: () => null,
    );
    if (current == null) return;

    final resolvedArea = area;
    emit(
      TrainingLookupsState.ready(
        areas: current.areas,
        cities: const [],
        selectedArea: resolvedArea,
        selectedCity: null,
      ),
    );

    final citiesResult = await repository.fetchCities(areaId: resolvedArea?.id);
    citiesResult.fold(
      (failure) => emit(TrainingLookupsState.failure(message: _mapFailure(failure))),
      (cities) => emit(
        TrainingLookupsState.ready(
          areas: current.areas,
          cities: cities,
          selectedArea: resolvedArea,
          selectedCity: cities.isNotEmpty ? cities.first : null,
        ),
      ),
    );
  }

  void selectCity(LookupItemEntity? city) {
    state.maybeWhen(
      ready: (areas, cities, selectedArea, _) => emit(
        TrainingLookupsState.ready(
          areas: areas,
          cities: cities,
          selectedArea: selectedArea,
          selectedCity: city,
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

class _ReadyData {
  final List<LookupItemEntity> areas;
  final List<LookupItemEntity> cities;
  final LookupItemEntity? selectedArea;
  final LookupItemEntity? selectedCity;

  _ReadyData({
    required this.areas,
    required this.cities,
    required this.selectedArea,
    required this.selectedCity,
  });
}
