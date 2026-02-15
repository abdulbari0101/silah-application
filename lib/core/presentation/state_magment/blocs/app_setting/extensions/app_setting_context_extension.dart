import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/app_language.dart';
import 'package:silah_app/core/domain/entities/local/setting/app_setting_entity.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/app_setting_bloc.dart';

extension SettingContext on BuildContext {
  /// Reads the AppStateData from AppSettingBloc without rebuilding
  AppSettingState get settingState => read<AppSettingBloc>().state;
  AppSettingEntity get appSetting => settingState.data;

  /// Reads whether the user is logged in
  bool get isSettingLoaded => settingState is AppSettingLoaded;

  /// Reads the selected language
  String get languageCode => settingState.data.language.code;
  AppLanguage get appLnaguage => settingState.data.language;
  String get languageNumber => settingState.data.language.code;

  /// Checks if the current language is RTL
  bool get isRTL => settingState.data.language.isRTL;
}
