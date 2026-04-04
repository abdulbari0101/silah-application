import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/config/localization/app_language.dart';
import 'package:silah_app/core/domain/enums/app_theme_mode.dart';
import 'package:silah_app/core/presentation/ui/theme/brightness_utils.dart';

part 'app_setting_entity.mapper.dart';

@MappableClass()
class AppSettingEntity with AppSettingEntityMappable {
  final AppThemeMode appAppThemeMode;
  final AppLanguage language;

  const AppSettingEntity({
    this.appAppThemeMode = AppThemeMode.system,
    this.language = AppLanguage.fallbackLanguage,
  });

  bool get isDarkTheme =>
      (appAppThemeMode == AppThemeMode.system &&
          BrightnessUtils.isSystemDark()) ||
      appAppThemeMode == AppThemeMode.dark;

  bool get isLightTheme => !isDarkTheme;
  bool get isSystemThemeTheme => appAppThemeMode == AppThemeMode.system;

  @override
  String toString() =>
      'AppSettingEntity(appAppThemeMode: $appAppThemeMode, language: $language)';
}
