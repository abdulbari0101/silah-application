import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';
import 'package:silah_app/features/discovery/domain/repositories/discovery_repository.dart';
import 'package:silah_app/features/lookups/domain/entities/lookup_item_entity.dart';
import 'package:silah_app/features/lookups/domain/repositories/lookups_repository.dart';

part 'registration_lookups_cubit.freezed.dart';

@freezed
class RegistrationLookupsState with _$RegistrationLookupsState {
  const factory RegistrationLookupsState.loading() =
      _RegistrationLookupsLoading;
  const factory RegistrationLookupsState.ready({
    @Default(<LookupItemEntity>[]) List<LookupItemEntity> genders,
    @Default(<LegalSpecializationEntity>[])
    List<LegalSpecializationEntity> specializations,
    @Default(<LookupItemEntity>[]) List<LookupItemEntity> cities,
    @Default(<LookupItemEntity>[]) List<LookupItemEntity> workDestinations,
  }) = _RegistrationLookupsReady;
  const factory RegistrationLookupsState.failure({required String message}) =
      _RegistrationLookupsFailure;
}

class RegistrationLookupsCubit extends Cubit<RegistrationLookupsState> {
  final LookupsRepository lookupsRepository;
  final DiscoveryRepository discoveryRepository;

  RegistrationLookupsCubit({
    required this.lookupsRepository,
    required this.discoveryRepository,
  }) : super(const RegistrationLookupsState.loading());

  Future<void> loadGenders() async {
    emit(const RegistrationLookupsState.loading());

    final result = await lookupsRepository.fetchGenders();
    result.fold(
      (failure) =>
          emit(RegistrationLookupsState.failure(message: _mapFailure(failure))),
      (genders) {
        if (genders.isEmpty) {
          emit(
            RegistrationLookupsState.failure(
              message: Strings.no_data_to_display.tr(),
            ),
          );
          return;
        }
        emit(RegistrationLookupsState.ready(genders: genders));
      },
    );
  }

  Future<void> loadProfessional() async {
    emit(const RegistrationLookupsState.loading());

    final specializationsResult = await discoveryRepository
        .fetchSpecializations();
    await specializationsResult.fold(
      (failure) async =>
          emit(RegistrationLookupsState.failure(message: _mapFailure(failure))),
      (specializations) async {
        if (specializations.isEmpty) {
          emit(
            RegistrationLookupsState.failure(
              message: Strings.no_data_to_display.tr(),
            ),
          );
          return;
        }
        final citiesResult = await lookupsRepository.fetchCities();
        await citiesResult.fold(
          (failure) async => emit(
            RegistrationLookupsState.failure(message: _mapFailure(failure)),
          ),
          (cities) async {
            if (cities.isEmpty) {
              emit(
                RegistrationLookupsState.failure(
                  message: Strings.no_data_to_display.tr(),
                ),
              );
              return;
            }
            final workResult = await lookupsRepository.fetchWorkDestinations();
            workResult.fold(
              (failure) => emit(
                RegistrationLookupsState.failure(message: _mapFailure(failure)),
              ),
              (workDestinations) {
                if (workDestinations.isEmpty) {
                  emit(
                    RegistrationLookupsState.failure(
                      message: Strings.no_data_to_display.tr(),
                    ),
                  );
                  return;
                }
                emit(
                  RegistrationLookupsState.ready(
                    specializations: specializations,
                    cities: cities,
                    workDestinations: workDestinations,
                  ),
                );
              },
            );
          },
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
