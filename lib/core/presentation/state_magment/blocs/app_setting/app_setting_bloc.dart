import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/config/localization/app_language.dart';
import 'package:silah_app/core/config/localization/locale_manager.dart';
import 'package:silah_app/core/domain/entities/local/setting/app_setting_entity.dart';
import 'package:silah_app/core/domain/enums/app_theme_mode.dart';
import 'package:silah_app/core/domain/repositories/app_setting_repo.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/core/presentation/ui/theme/brightness_utils.dart';

part 'app_setting_bloc.mapper.dart';
part 'app_setting_event.dart';
part 'app_setting_state.dart';

class AppSettingBloc extends Bloc<AppSettingEvent, AppSettingState> {
  final AppSettingsRepo settingRep;

  LocaleManager localeManager;

  AppSettingBloc({required this.settingRep, required this.localeManager})
    : super(AppSettingInitial()) {
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

  Future<void> _onInjectAppSettingEvent(
    InjectAppSettingEvent event,
    Emitter<AppSettingState> emit,
  ) async {
    emit(AppSettingLoaded(event.setting));
  }

  Future<void> _onGetSetting(GetAppSettingEvent event, Emitter<AppSettingState> emit) async {
    emit(AppSettingLoading(state.data));
    final result = await settingRep.setting();

    result.fold((failure) => _emitFailure(emit, failure), (setting) {
      emit(AppSettingLoaded(setting));
    });
  }

  Future<void> _onChangeThemeEvent(ChangeThemeEvent event, Emitter<AppSettingState> emit) async {
    final current = state.data;

    final updated = current.copyWith(
      appAppThemeMode: event.appAppThemeMode ?? current.appAppThemeMode,
    );

    emit(AppSettingLoading(state.data));

    await Future.delayed(Duration(milliseconds: 400));

    final result = await settingRep.updateSetting(updated);

    result.fold((failure) => _emitFailure(emit, failure), (_) {
      emit(AppSettingLoaded(updated));
    });
  }

  Future<void> _onChangeLanguageEvent(
    ChangeLanguageEvent event,
    Emitter<AppSettingState> emit,
  ) async {
    final current = state.data;

    final updated = current.copyWith(language: event.language);

    emit(AppSettingLoading(state.data));

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

  Future<void> _onChangeLocalEvent(ChangeLocalEvent event, Emitter<AppSettingState> emit) async {
    final current = state.data;

    final updated = current.copyWith(language: event.language);

    final result = await localeManager.applyLanguage(event.language);

    result.fold((failure) => _emitFailure(emit, failure), (_) {
      emit(AppSettingLoaded(updated));
    });
  }

  void _emitFailure(Emitter<AppSettingState> emit, Failure failure) {
    emit(
      BlocUtils.handleFailure(
        failure: failure,
        onError: (msg) => AppSettingError(message: msg, previous: state.data),
        codeToMessageMap: codeToMessageMap,
      ),
    );
  }

  void _initSystemThemeListener() {
    // Reactively listen for platform brightness changes
    PlatformDispatcher.instance.onPlatformBrightnessChanged = () {
      final isDark = BrightnessUtils.isSystemDark();
      final appAppThemeMode = AppThemeMode.system;

      final current = state.data;

      // Only update if the theme mode is not already system or brightness changed
      if (current.appAppThemeMode != AppThemeMode.system || (current.isDarkTheme != isDark)) {
        if ((state is AppSettingLoaded))
          add(ChangeThemeEvent(appAppThemeMode: appAppThemeMode, fromWhere: 'systemThemeChanged'));
      }
    };
  }
}
