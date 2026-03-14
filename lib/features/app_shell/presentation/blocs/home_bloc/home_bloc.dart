import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/features/profiles/domain/repositories/profile_repository.dart';
import 'package:silah_app/features/profiles/presentation/support/profile_app_state_sync.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<RefreshHomeEvent>(
      _onRefreshHomeEvent,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
  }

  Future<void> _onRefreshHomeEvent(
    RefreshHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());
    final profileRepository = locator<ProfileRepository>();
    final appStateBloc = locator<AppStateBloc>();
    final result = await profileRepository.fetchProfile();
    result.fold(
      (failure) => emit(
        HomeState.error(
          message: failure.message.isNotEmpty
              ? failure.message
              : Strings.unexpected_error.tr(),
        ),
      ),
      (profile) {
        syncProfileToAppState(appStateBloc: appStateBloc, profile: profile);
        emit(const HomeState.refreshed());
      },
    );
  }
}
