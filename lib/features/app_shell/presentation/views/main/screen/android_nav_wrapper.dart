// lib/features/app_shell/presentation/views/wrapper/android_bottom_nav_wrapper.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/router/route_extensions.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/double_back_pop_scope.dart';
import 'package:silah_app/features/app_shell/presentation/views/main/widget/navigation/nav_item_data.dart';
import 'package:silah_app/gen/assets.gen.dart';

import '../widget/navigation/android_bottom_nav_bar.dart';

class AndroidNavWrapper extends StatelessWidget {
  const AndroidNavWrapper({super.key, required this.child, this.navigationShell});

  final Widget child;
  final StatefulNavigationShell? navigationShell;

  @override
  Widget build(BuildContext context) {
    return DoubleBackPopScope(
      onDoubleTapped: () {
        locator.get<AppStateBloc>().add(
          UpdateSession(isLoggedIn: false, userAuthStatus: UserAuthStatus.loggedOutReturningUser),
        );

        context.goTo(AppRoutes.login);
      },

      child: _ScaffoldBody(child: child, navigationShell: navigationShell),
    );
  }
}

// Extracted to keep the BlocBuilder rebuilds local.
class _ScaffoldBody extends StatelessWidget {
  const _ScaffoldBody({required this.child, this.navigationShell});

  final Widget child;
  final StatefulNavigationShell? navigationShell;

  static final List<NavItemData> _tabs = [
    NavItemData(
      routeName: AppRoutes.home.name,
      selectedIconAsset: Assets.icons.bottomNavigation.home,
      unselectedIconAsset: Assets.icons.bottomNavigation.home,
      labelKey: Strings.home,
    ),

    NavItemData(
      routeName: AppRoutes.requests.name,
      selectedIconAsset: Assets.icons.bottomNavigation.requests,
      unselectedIconAsset: Assets.icons.bottomNavigation.requests,
      labelKey: Strings.my_requests,
    ),

    NavItemData(
      routeName: AppRoutes.messages.name,
      selectedIconAsset: Assets.icons.bottomNavigation.chats,
      unselectedIconAsset: Assets.icons.bottomNavigation.chats,
      labelKey: Strings.messages,
    ),

    NavItemData(
      routeName: AppRoutes.settings.name,
      selectedIconAsset: Assets.icons.bottomNavigation.account,
      unselectedIconAsset: Assets.icons.bottomNavigation.account,
      labelKey: Strings.my_account,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final content = navigationShell ?? child;

    return Scaffold(
      body: SafeArea(child: content),
      bottomNavigationBar: AndroidBottomNavBar(items: _tabs, navigationShell: navigationShell),
    );
  }
}
