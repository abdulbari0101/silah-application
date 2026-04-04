import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';

const bool _reverseIOSAndroidForUITest = bool.fromEnvironment(
  'FLUTTER_PLATFORM_SWAP',
  defaultValue: false,
);

//const bool _reverseIOSAndroidForUITest = true;

class AppPlatform extends StatelessWidget {
  const AppPlatform({
    super.key,
    required this.android,
    required this.ios,
    this.web,
    this.windows,
    this.linux,
    this.macos,
  });

  final Widget android;
  final Widget ios;
  final Widget? web;
  final Widget? windows;
  final Widget? linux;
  final Widget? macos;

  // platform flags
  static bool get isWeb => kIsWeb;
  static bool get _nativeIsIOS => defaultTargetPlatform == TargetPlatform.iOS;
  static bool get _nativeIsAndroid =>
      defaultTargetPlatform == TargetPlatform.android;

  static bool get isIOS =>
      _reverseIOSAndroidForUITest ? !_nativeIsIOS : _nativeIsIOS;
  static bool get isAndroid =>
      _reverseIOSAndroidForUITest ? !_nativeIsAndroid : _nativeIsAndroid;

  static String deviceType() {
    if (_nativeIsAndroid) return '1';
    if (_nativeIsIOS) return '2';
    if (isWeb) return '3';
    return '-1';
  }

  static String platformName() {
    if (isWeb) return 'Web';
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return 'Android';
      case TargetPlatform.iOS:
        return 'iPhone';
      case TargetPlatform.windows:
        return 'Windows';
      case TargetPlatform.macOS:
        return 'Mac';
      case TargetPlatform.linux:
        return 'Linux';
      case TargetPlatform.fuchsia:
        return 'Fuchsia';
    }
  }

  static Map<String, dynamic> snapshot() => {
    'isWeb': isWeb,
    'isAndroid': isAndroid,
    'nativeIsAndroid': _nativeIsAndroid,
    'isIOS': isIOS,
    'nativeIsIOS': _nativeIsIOS,
    'deviceType': deviceType(),
    'platformName': platformName(),
  };

  /// Asserts internal consistency. Call from a test or early app startup.
  static void validate() {
    assert(!(isAndroid && isIOS), 'Both Android and iOS cannot be true.');
    assert(deviceType() != '-1', 'deviceType returned -1 (unknown platform).');
  }

  /// Convenience helper to print the current snapshot via [debugPrint].
  static void debugPrintSnapshot() {
    AppLogger().uiInfo(
      tag: "AppPlatform",
      "debugPrintSnapshot =>${snapshot()}",
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isWeb) return web ?? android;
    if (isAndroid) return android;
    if (isIOS) return ios;

    // desktop fallbacks
    switch (defaultTargetPlatform) {
      case TargetPlatform.windows:
        return windows ?? android;
      case TargetPlatform.linux:
        return linux ?? android;
      case TargetPlatform.macOS:
        return macos ?? android;
      default:
        return android;
    }
  }
}
