import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:silah_app/core/domain/enums/app_theme_mode.dart';

class NavigationThemeUtil {
  const NavigationThemeUtil();

  Future<void> changeSystemUiColour({
    required AppThemeMode themeMode,
    Color? statusBarColor,
    Color? navigationBarColor,
  }) async {
    return;
    // final colors = ColorScheme(appThemeMode: themeMode);
    // final nav = navigationBarColor ?? context.colors.surfaceContainerLow;
    // final lightIcons = themeMode == AppThemeMode.dark;

    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarIconBrightness: lightIcons ? Brightness.light : Brightness.dark,
    //     statusBarBrightness: lightIcons ? Brightness.dark : Brightness.light,
    //     systemNavigationBarColor: nav,
    //     systemNavigationBarIconBrightness: lightIcons ? Brightness.light : Brightness.dark,
    //     systemNavigationBarDividerColor: nav,
    //   ),
    // );
  }
}
