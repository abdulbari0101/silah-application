import 'package:flutter/material.dart';

class BrightnessUtils {
  BrightnessUtils._();

  static bool isSystemDark() {
    final b = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    return b == Brightness.dark;
  }
}
