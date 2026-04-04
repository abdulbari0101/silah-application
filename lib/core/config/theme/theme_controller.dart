import 'dart:async';

import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/navigation_theme_util.dart';
import 'package:silah_app/core/domain/entities/local/setting/app_setting_entity.dart';
import 'package:silah_app/core/domain/enums/app_theme_mode.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/app_setting_bloc.dart';

class ThemeController extends ChangeNotifier {
  AppThemeMode? _themeMode;
  final AppSettingBloc settingBloc;

  StreamSubscription? _settingSub;

  ThemeController({required this.settingBloc});

  void init() {
    _initFromSetting(settingBloc.state.data);

    _subscribeToBloc();
  }

  void _initFromSetting(AppSettingEntity entity) {
    final useDark = entity.isDarkTheme;
    final cachedAppTheme = useDark ? AppThemeMode.dark : AppThemeMode.light;
    setTheme(cachedAppTheme, notify: true);
    //  _changeStatusBarColorSafely(cachedAppTheme);
  }

  void _subscribeToBloc() {
    _settingSub = settingBloc.stream.listen((state) {
      if (state is AppSettingLoaded) {
        final newTheme = state.data.isDarkTheme
            ? AppThemeMode.dark
            : AppThemeMode.light;

        if (!state.data.isSystemThemeTheme && newTheme != _themeMode) {
          setTheme(newTheme);

          _changeStatusBarColorSafely(newTheme);
        }

        if (state.data.isSystemThemeTheme && !isSystem) {
          _themeMode = AppThemeMode.system;

          notifyListeners();
          _changeStatusBarColorSafely(AppThemeMode.system);
        }
      }
    });
  }

  bool isFirstStatusBar = true;

  void _changeStatusBarColorSafely(AppThemeMode themeMode) {
    if (!isFirstStatusBar) {
      locator<NavigationThemeUtil>().changeSystemUiColour(themeMode: themeMode);
    } else {
      isFirstStatusBar = false;
    }
  }

  AppThemeMode get appAppThemeMode => _themeMode ?? AppThemeMode.system;

  bool get isDark => appAppThemeMode == AppThemeMode.dark;
  bool get isLight => appAppThemeMode == AppThemeMode.light;
  bool get isSystem => appAppThemeMode == AppThemeMode.system;
  bool get isInitialized => _themeMode != null;

  void setTheme(AppThemeMode themeMode, {bool notify = true}) {
    _themeMode = themeMode;
    if (notify) notifyListeners();
  }

  @override
  void dispose() {
    _settingSub?.cancel();
    super.dispose();
  }
}
