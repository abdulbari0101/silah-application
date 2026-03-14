import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/domain/entities/local/setting/user_setting_entity.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/features/settings/domain/repositories/user_setting_repo.dart';

part 'user_setting_bloc.freezed.dart';
part 'user_setting_event.dart';
part 'user_setting_state.dart';

class UserSettingBloc extends Bloc<UserSettingEvent, UserSettingState> {
  UserSettingBloc({required this.settingRep, required this.appStateBloc})
    : super(const UserSettingState.initial()) {
    on<InjectUserSettingEvent>(
      _onInjectUserSettingEvent,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
    on<GetUserSettingEvent>(_onGetSetting);
    on<UpdateUserSettingEvent>(
      _onUpdateUserSetting,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
  }

  final UserSettingsRepo settingRep;
  final AppStateBloc appStateBloc;

  Future<void> _onInjectUserSettingEvent(
    InjectUserSettingEvent event,
    Emitter<UserSettingState> emit,
  ) async {
    emit(UserSettingState.loaded(data: event.setting));
  }

  Future<void> _onGetSetting(
    GetUserSettingEvent event,
    Emitter<UserSettingState> emit,
  ) async {
    emit(UserSettingState.loading(data: state.data));
    final result = await settingRep.setting();

    result.fold((failure) => _emitFailure(emit, failure), (setting) {
      emit(UserSettingState.loaded(data: setting));
    });
  }

  Future<void> _onUpdateUserSetting(
    UpdateUserSettingEvent event,
    Emitter<UserSettingState> emit,
  ) async {
    final current = state.data;
    final updated = current.copyWith(
      notification: event.notification ?? current.notification,
    );

    if (event.isRefresh || event.rebuildApp) {
      emit(UserSettingState.loading(data: state.data));
    }

    final result = await settingRep.updateSetting(updated);

    result.fold((failure) => _emitFailure(emit, failure), (_) {
      emit(UserSettingState.loaded(data: updated));
    });
  }

  void _emitFailure(Emitter<UserSettingState> emit, Failure failure) {
    emit(
      BlocUtils.handleFailure(
        failure: failure,
        onError: (msg) =>
            UserSettingState.error(message: msg, data: state.data),
        codeToMessageMap: codeToMessageMap,
      ),
    );
  }
}
