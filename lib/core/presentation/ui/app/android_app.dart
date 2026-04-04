import 'package:dynamic_color/dynamic_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/router/app_router.dart';
import 'package:silah_app/core/config/router/global_navigator.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/config/theme/theme.dart';
import 'package:silah_app/core/domain/enums/app_theme_mode.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/app_setting_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/extensions/app_setting_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/unified_refresh_wrapper.dart';
import 'package:silah_app/features/app_shell/presentation/views/splash/screens/splash_screen.dart';

import '../../../config/localization/localizations_string_keys.dart';
import '../../../config/theme/tokens/brands.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingBloc, AppSettingState>(
      builder: (context, state) {
        if (state is AppSettingError) {
          return AndroidAppErrorStateWidget(message: state.message);
        }
        if (state is AppSettingLoaded) {
          return AndroidAppLoadedStateWidget();
        } else {
          return AndroidAppLoadingStateWidget();
        }
      },
    );
  }
}

class AndroidAppLoadedStateWidget extends StatelessWidget {
  const AndroidAppLoadedStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        // final light = lightDynamic?.harmonized();
        // final dark = darkDynamic?.harmonized();

        //   final light = lightDynamic;
        //  final dark = darkDynamic;
        return MaterialApp.router(
          title: Strings.app_name.tr(),

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
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routerConfig: appRouter,

          builder: (ctx, child) => UnifiedRefreshWrapper(child: child!),
        );
      },
    );
  }
}

class AndroidAppLoadingStateWidget extends StatelessWidget {
  const AndroidAppLoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        // final light = lightDynamic?.harmonized();
        // final dark = darkDynamic?.harmonized();

        //  final light = lightDynamic;
        //  final dark = darkDynamic;

        return MaterialApp(
          title: Strings.app_name.tr(),

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
          navigatorKey: rootNavigatorKey,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: SplashScreen(),
        );
      },
    );
  }
}

class AndroidAppErrorStateWidget extends StatelessWidget {
  const AndroidAppErrorStateWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        // final light = lightDynamic?.harmonized();
        // final dark = darkDynamic?.harmonized();

        //   final light = lightDynamic;
        //   final dark = darkDynamic;

        return MaterialApp(
          title: Strings.app_name.tr(),

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
          debugShowCheckedModeBanner: false,

          home: Scaffold(
            body: Center(
              child: Center(child: Text('An error has been occured $message')),
            ),
          ),
        );
      },
    );
  }
}
