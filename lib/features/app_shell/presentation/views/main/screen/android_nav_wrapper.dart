// lib/features/app_shell/presentation/views/wrapper/android_bottom_nav_wrapper.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/double_back_pop_scope.dart';
import 'package:silah_app/features/app_shell/presentation/views/main/widget/navigation/nav_item_data.dart';

import '../widget/navigation/android_bottom_nav_bar.dart';

class AndroidNavWrapper extends StatelessWidget {
  const AndroidNavWrapper({
    super.key,
    required this.child,
    required this.items,
    this.navigationShell,
  });

  final Widget child;
  final StatefulNavigationShell? navigationShell;
  final List<NavItemData> items;

  @override
  Widget build(BuildContext context) {
    return DoubleBackPopScope(
      onDoubleTapped: () {
        locator.get<AppStateBloc>().add(
          UpdateSession(isLoggedIn: false, userAuthStatus: UserAuthStatus.loggedOutReturningUser),
        );

      },

      child: _ScaffoldBody(items: items, navigationShell: navigationShell, child: child),
    );
  }
}

// Extracted to keep the BlocBuilder rebuilds local.
class _ScaffoldBody extends StatelessWidget {
  const _ScaffoldBody({required this.child, required this.items, this.navigationShell});

  final Widget child;
  final StatefulNavigationShell? navigationShell;
  final List<NavItemData> items;

  @override
  Widget build(BuildContext context) {
    final content = navigationShell ?? child;

    return Scaffold(
      body: SafeArea(child: content),
      bottomNavigationBar: AndroidBottomNavBar(items: items, navigationShell: navigationShell),
    );
  }
}
