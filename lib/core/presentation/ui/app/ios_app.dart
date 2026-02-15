import 'package:dynamic_color/dynamic_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/router/app_router.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/config/theme/theme.dart';
import 'package:silah_app/core/domain/enums/app_theme_mode.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/app_setting_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/extensions/app_setting_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/unified_refresh_wrapper.dart';
import 'package:silah_app/features/intro/presentation/views/splash/screens/splash_screen.dart';

import '../../../config/localization/localizations_string_keys.dart';
import '../../../config/theme/tokens/brands.dart';

/// iOS App entry with unified theming, localization, and routing.
class IOSApp extends StatelessWidget {
  const IOSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingBloc, AppSettingState>(
      builder: (context, state) {
        //  return _IOSAppShell(home: _ErrorOverlay(message: "Mesage"));
        // return const _IOSAppShell(home: SplashScreen());
        return switch (state) {
          AppSettingError(:final message) => _IOSAppShell(home: _ErrorOverlay(message: message)),
          AppSettingLoaded() => _IOSAppShell(routerConfig: appRouter),

          _ => const _IOSAppShell(home: SplashScreen()),
        };
      },
    );
  }
}

/// Single shell used by all states (Loaded / Loading / Error) to avoid duplication.
class _IOSAppShell extends StatelessWidget {
  const _IOSAppShell({this.routerConfig, this.home});

  /// Router to use when the app is fully loaded. If null, `appRouter` is used.
  final RouterConfig<Object>? routerConfig;

  /// Optional full-screen overlay (e.g., Splash, Error) drawn above router content.
  final Widget? home;

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        // Base Material theme with our ThemeExtensions.
        final materialTheme = _buildMaterialTheme(context);

        // Cupertino theme that defers to the Material theme.
        final cupertinoTheme = MaterialBasedCupertinoThemeData(materialTheme: materialTheme);

        // Material theme for Material widgets embedded in Cupertino trees.
        final materialForCupertino = CupertinoBasedMaterialThemeData(
          themeData: cupertinoTheme,
        ).materialTheme;

        // Preserve ThemeExtensions dropped during Cupertino <-> Material conversion.
        final mergedMaterial = _mergeMaterialExtensions(
          target: materialForCupertino,
          sourceExtensionsFrom: materialTheme,
        );

        final loc = _CommonLocalization.from(context);

        return _MaterialWrapper(
          child: CupertinoApp.router(
            title: Strings.app_name.tr(),
            theme: cupertinoTheme,

            debugShowCheckedModeBanner: false,
            localizationsDelegates: loc.delegates,
            supportedLocales: loc.supportedLocales,
            locale: loc.locale,
            routerConfig: routerConfig ?? appRouter,
            builder: (ctx, child) => UnifiedRefreshWrapper(
              child: Stack(
                children: [
                  if (child != null) child,
                  if (home != null) Positioned.fill(child: home!),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Wraps Cupertino content with Material + Theme so Material widgets
/// receive the merged ThemeData (including ThemeExtensions).
class _MaterialWrapper extends StatelessWidget {
  const _MaterialWrapper({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildTheme(
        silahBrandTokens,
        brightness: Brightness.light,
        language: context.appLnaguage,
        //schemeOverride: light, // <- dynamic if available
      ),
      darkTheme: buildTheme(
        silahBrandTokens,
        brightness: Brightness.dark,
        language: context.appLnaguage,
        //schemeOverride: dark, // <- dynamic if available
      ),
      themeMode: context.appAppThemeMode.toFlutter(),
      debugShowCheckedModeBanner: false,

      home: Material(
        // <-- enables ink on iOS
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias, // clip splash to circle

        child: child,
      ),
    );
  }
}

/// Minimal error overlay used while keeping the router alive.
class _ErrorOverlay extends StatelessWidget {
  const _ErrorOverlay({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Center(child: _ErrorMessage(message: message)),
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    // You can localize this string if desired.
    return Text('An error has occurred Error $message');
  }
}

// ---------- Helpers ----------

ThemeData _buildMaterialTheme(BuildContext context) {
  return buildTheme(
    silahBrandTokens,
    brightness:
        context.appAppThemeMode.toBrightnessOrNull() ??
        context.appAppThemeMode.resolveFrom(context),
    language: context.appLnaguage,
    // If you decide to use dynamic color, pass schemeOverride with lightDynamic/darkDynamic.
  );
}

ThemeData _mergeMaterialExtensions({
  required ThemeData target,
  required ThemeData sourceExtensionsFrom,
}) {
  return target.copyWith(extensions: sourceExtensionsFrom.extensions.values.toList());
}

/// Collects localization props so we don't repeat them.
class _CommonLocalization {
  const _CommonLocalization({
    required this.delegates,
    required this.supportedLocales,
    required this.locale,
  });

  final Iterable<LocalizationsDelegate<dynamic>> delegates;
  final Iterable<Locale> supportedLocales;
  final Locale locale;

  static _CommonLocalization from(BuildContext context) => _CommonLocalization(
    delegates: context.localizationDelegates,
    supportedLocales: context.supportedLocales,
    locale: context.locale,
  );
}
