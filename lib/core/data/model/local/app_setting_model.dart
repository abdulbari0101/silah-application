import 'dart:ui';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/config/localization/app_language.dart';
import 'package:silah_app/core/domain/entities/local/setting/app_setting_entity.dart';
import 'package:silah_app/core/domain/enums/app_theme_mode.dart';

part 'app_setting_model.mapper.dart';

@MappableClass(ignoreNull: true)
class AppSettingModel with AppSettingModelMappable {
  final AppThemeMode? appAppThemeMode;

  final int? languageNumber;

  const AppSettingModel({this.appAppThemeMode, this.languageNumber});

  /// Convert to domain entity
  AppSettingEntity toEntity() {
    return AppSettingEntity(
      appAppThemeMode: appAppThemeMode!, // can't be null will be loaded by default setting if null
      language: AppLanguage.fromNumber(
        languageNumber!,
      ), // can't be null will be loaded by default setting if null
    );
  }

  /// Convert from domain entity
  factory AppSettingModel.fromEntity(AppSettingEntity entity) {
    return AppSettingModel(
      appAppThemeMode: entity.appAppThemeMode,

      languageNumber: entity.language.number,
    );
  }

  /// Convert from domain entity
  factory AppSettingModel.defaultSetting() {
    final deviceLocale = PlatformDispatcher.instance.locale.languageCode;

    final resolvedLanguage = AppLanguage.fromCode(deviceLocale);

    return AppSettingModel(
      appAppThemeMode: AppThemeMode.system,
      languageNumber: resolvedLanguage.number,
    );
  }
}
