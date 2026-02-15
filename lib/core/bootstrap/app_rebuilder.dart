import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/bootstrap/bootstrap_service.dart';
import 'package:silah_app/core/config/localization/app_language.dart';
import 'package:silah_app/main.dart' show MyApp; // reuse your existing MyApp

/// A tiny wrapper that lets us rebuild the whole app tree by reloading BootData
/// without re-running heavy bootstrap (DI, Firebase, etc.).
class AppRebuilder extends StatefulWidget {
  const AppRebuilder({super.key, this.initialBootData});
  final BootData? initialBootData;

  static final GlobalKey<_AppRebuilderState> _key = GlobalKey<_AppRebuilderState>();

  /// Public entry used by the fatal screen's "Try again" to refresh BootData
  /// and rebuild the app tree.
  static Future<void> retryBootDataAndRebuild() async {
    final boot = await loadAndApplyInitialSettings();
    _key.currentState?.rebuildWith(boot);
  }

  @override
  State<AppRebuilder> createState() => _AppRebuilderState();
}

class _AppRebuilderState extends State<AppRebuilder> {
  BootData? _boot;

  @override
  void initState() {
    super.initState();
    _boot = widget.initialBootData;
  }

  void rebuildWith(BootData? boot) {
    setState(() => _boot = boot);
  }

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      startLocale: _boot?.appSetting?.language.toLocale(),
      supportedLocales: AppLanguage.supportedLocales,
      path: AppLanguage.translationAssetsPath,
      useOnlyLangCode: true,
      fallbackLocale: AppLanguage.fallbackLocale,
      child: KeyedSubtree(
        key: ValueKey(_boot?.appSetting?.language.toString() ?? 'no-boot'),
        child: MyApp(bootData: _boot),
      ),
    );
  }
}
