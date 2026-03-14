part of 'app_setting_bloc.dart';

@freezed
sealed class AppSettingEvent with _$AppSettingEvent {
  const factory AppSettingEvent.inject({required AppSettingEntity setting}) =
      InjectAppSettingEvent;
  const factory AppSettingEvent.get() = GetAppSettingEvent;
  const factory AppSettingEvent.changeTheme({
    AppThemeMode? appAppThemeMode,
    required String fromWhere,
  }) = ChangeThemeEvent;
  const factory AppSettingEvent.changeLanguage({
    required AppLanguage language,
    @Default(true) bool isRefresh,
    required String fromWhere,
  }) = ChangeLanguageEvent;
  const factory AppSettingEvent.changeLocal({
    required AppLanguage language,
    @Default(true) bool isRefresh,
    required String fromWhere,
  }) = ChangeLocalEvent;
}
