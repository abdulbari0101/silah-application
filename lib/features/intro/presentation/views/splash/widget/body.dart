import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/config/theme/navigation_theme_util.dart';
import 'package:silah_app/core/domain/enums/app_theme_mode.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/extensions/app_setting_context_extension.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/extensions/app_state_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';
import 'package:silah_app/gen/assets.gen.dart';

import 'init_loading.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void changeStatusBarColor(AppThemeMode themeMode) {
    Future.delayed(Duration(milliseconds: 500)).then((v) {
      locator<NavigationThemeUtil>().changeSystemUiColour(themeMode: themeMode);
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //  AppLogger().i(tag: "BodySplash", "isSettingLoaded = ${context.isSettingLoaded}");
      //  AppLogger().i(tag: "BodySplash","isAppStateLoaded = ${context.isAppStateLoaded}");

      //  AppLogger().i(tag: "BodySplash", "settingState = ${context.settingState}");
      //   AppLogger().i(tag: "BodySplash","appStateState = ${context.appStateState}");

      if (context.isSettingLoaded) {
        if (context.customer != null) {
          context.goNamed(AppRoutes.login.name);
        } else {
          context.goNamed(AppRoutes.onboarding.name);
        }

        // context.goNamed(AppRoutes.changePIN.name);

        changeStatusBarColor(context.settingState.data.appAppThemeMode);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [SplashCoverWidget(), InitLoadingWidget()]);
  }
}

class SplashCoverWidget extends StatelessWidget {
  const SplashCoverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppSvgIcon(
            assetName: Assets.icons.logo.logoSvg,
            matchTextDirection: false,
            darkDynamicColor: false,
          ),
          const SizedBox(height: 20),
          Text(
            Strings.initial_loading.tr(),
            style: context.textTheme.bodySmall!
                .copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: context.colors.onSurfaceVariant,
                )
                .copyWith(fontSize: 14, color: Colors.white.withValues(alpha: 0.9)),
          ),
        ],
      ),
    );
  }
}
