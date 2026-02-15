part of 'app_setting_bloc.dart';

@MappableClass(discriminatorKey: 'event')
sealed class AppSettingEvent with AppSettingEventMappable {
  const AppSettingEvent();
}

@MappableClass(discriminatorValue: 'inject')
class InjectAppSettingEvent extends AppSettingEvent with InjectAppSettingEventMappable {
  final AppSettingEntity setting;

  InjectAppSettingEvent({required this.setting});
}

@MappableClass(discriminatorValue: 'get')
class GetAppSettingEvent extends AppSettingEvent with GetAppSettingEventMappable {
  const GetAppSettingEvent();
}

@MappableClass(discriminatorValue: 'update_theme')
class ChangeThemeEvent extends AppSettingEvent with ChangeThemeEventMappable {
  final AppThemeMode? appAppThemeMode;

  final String fromWhere;
  ChangeThemeEvent({this.appAppThemeMode, required this.fromWhere});
}

@MappableClass(discriminatorValue: 'update_language')
class ChangeLanguageEvent extends AppSettingEvent with ChangeLanguageEventMappable {
  final AppLanguage language;

  final bool isRefresh;
  final String fromWhere;
  ChangeLanguageEvent({required this.language, this.isRefresh = true, required this.fromWhere});
}

@MappableClass(discriminatorValue: 'update_local')
class ChangeLocalEvent extends AppSettingEvent with ChangeLocalEventMappable {
  final AppLanguage language;

  final bool isRefresh;
  final String fromWhere;
  ChangeLocalEvent({required this.language, this.isRefresh = true, required this.fromWhere});
}
