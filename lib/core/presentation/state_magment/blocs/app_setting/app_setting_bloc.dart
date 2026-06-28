import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/config/localization/app_language.dart';
import 'package:silah_app/core/config/localization/locale_manager.dart';
import 'package:silah_app/core/domain/entities/local/setting/app_setting_entity.dart';
import 'package:silah_app/core/domain/enums/app_theme_mode.dart';
import 'package:silah_app/core/domain/repositories/app_setting_repo.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';

part 'app_setting_bloc.freezed.dart';
part 'app_setting_event.dart';
part 'app_setting_state.dart';

class AppSettingBloc extends Bloc<AppSettingEvent, AppSettingState> {
  AppSettingBloc({required this.settingRep, required this.localeManager})
    : super(const AppSettingState.initial()) {
    on<InjectAppSettingEvent>(
      _onInjectAppSettingEvent,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
    on<GetAppSettingEvent>(_onGetSetting);
    on<ChangeThemeEvent>(
      _onChangeThemeEvent,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
    on<ChangeLanguageEvent>(
      _onChangeLanguageEvent,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
    on<ChangeLocalEvent>(
      _onChangeLocalEvent,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );

    _initSystemThemeListener();
  }

  final AppSettingsRepo settingRep;
  final LocaleManager localeManager;

  Future<void> _onInjectAppSettingEvent(
    InjectAppSettingEvent event,
    Emitter<AppSettingState> emit,
  ) async {
    emit(AppSettingState.loaded(data: event.setting));
  }

  Future<void> _onGetSetting(
    GetAppSettingEvent event,
    Emitter<AppSettingState> emit,
  ) async {
    emit(AppSettingState.loading(data: state.data));
    final result = await settingRep.setting();

    result.fold((failure) => _emitFailure(emit, failure), (setting) {
      emit(AppSettingState.loaded(data: setting));
    });
  }

  Future<void> _onChangeThemeEvent(
    ChangeThemeEvent event,
    Emitter<AppSettingState> emit,
  ) async {
    final current = state.data;
    final updated = current.copyWith(
      appAppThemeMode: event.appAppThemeMode ?? current.appAppThemeMode,
    );

    final result = await settingRep.updateSetting(updated);

    result.fold((failure) => _emitFailure(emit, failure), (_) {
      emit(AppSettingState.loaded(data: updated));
    });
  }

  Future<void> _onChangeLanguageEvent(
    ChangeLanguageEvent event,
    Emitter<AppSettingState> emit,
  ) async {
    final current = state.data;
    final updated = current.copyWith(language: event.language);

    emit(AppSettingState.loading(data: state.data));

    final result = await settingRep.updateSetting(updated);

    result.fold((failure) => _emitFailure(emit, failure), (_) {
      add(
        ChangeLocalEvent(
          language: event.language,
          isRefresh: event.isRefresh,
          fromWhere: "_onChangeLanguageEvent",
        ),
      );
    });
  }

  Future<void> _onChangeLocalEvent(
    ChangeLocalEvent event,
    Emitter<AppSettingState> emit,
  ) async {
    final current = state.data;
    final updated = current.copyWith(language: event.language);

    final result = await localeManager.applyLanguage(event.language);

    result.fold((failure) => _emitFailure(emit, failure), (_) {
      emit(AppSettingState.loaded(data: updated));
    });
  }

  void _emitFailure(Emitter<AppSettingState> emit, Failure failure) {
    emit(
      BlocUtils.handleFailure(
        failure: failure,
        onError: (msg) => AppSettingState.error(message: msg, data: state.data),
        codeToMessageMap: codeToMessageMap,
      ),
    );
  }

  void _initSystemThemeListener() {
    PlatformDispatcher.instance.onPlatformBrightnessChanged = () {
      final current = state.data;

      // Only react if we are currently in system mode.
      // If the user explicitly chose Light or Dark, we should stay there.
      if (current.appAppThemeMode == AppThemeMode.system) {
        add(
          const ChangeThemeEvent(
            appAppThemeMode: AppThemeMode.system,
            fromWhere: 'systemThemeChanged',
          ),
        );
      }
    };
  }
}
