import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/features/profiles/domain/entities/profile_entity.dart';
import 'package:silah_app/features/profiles/domain/repositories/profile_repository.dart';

part 'profile_cubit.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _ProfileInitial;
  const factory ProfileState.loading() = _ProfileLoading;
  const factory ProfileState.loaded({required ProfileEntity profile, bool? isSaving}) =
      _ProfileLoaded;
  const factory ProfileState.error({required String message, ProfileEntity? profile}) =
      _ProfileError;
}

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;
  final AppStateBloc appStateBloc;

  ProfileCubit({required this.repository, required this.appStateBloc})
      : super(const ProfileState.initial());

  Future<void> load() async {
    emit(const ProfileState.loading());
    final result = await repository.fetchProfile();
    result.fold(
      (failure) => emit(ProfileState.error(message: _mapFailure(failure))),
      (profile) => emit(ProfileState.loaded(profile: profile)),
    );
  }

  Future<void> updateIsTrainee(bool value) async {
    final current = state.maybeWhen(
      loaded: (profile, _) => profile,
      error: (_, profile) => profile,
      orElse: () => null,
    );

    if (current == null) {
      await load();
      return;
    }

    emit(ProfileState.loaded(profile: current, isSaving: true));
    final result = await repository.updateProfile(current.copyWith(isTrainee: value));
    result.fold(
      (failure) => emit(ProfileState.error(message: _mapFailure(failure), profile: current)),
      (profile) {
        _syncAppState(profile);
        emit(ProfileState.loaded(profile: profile));
      },
    );
  }

  void _syncAppState(ProfileEntity profile) {
    final authUser = appStateBloc.state.data.customer;
    if (authUser == null) return;

    final nextProfile = <String, dynamic>{
      ...?authUser.profile,
      if (profile.name != null) 'name': profile.name,
      if (profile.email != null) 'email': profile.email,
      if (profile.phone != null) 'phone': profile.phone,
      if (profile.city != null) 'city': profile.city,
      if (profile.avatarUrl != null) 'avatarUrl': profile.avatarUrl,
      if (profile.accountType != null) 'accountType': profile.accountType,
      'isTrainee': profile.isTrainee,
    };

    final updated = authUser.copyWith(profile: nextProfile);
    appStateBloc.add(UpdateSession(authData: updated));
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
