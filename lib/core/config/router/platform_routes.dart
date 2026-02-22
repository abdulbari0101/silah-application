import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/features/app_shell/presentation/views/main/screen/main_screen.dart';

import 'app_routes.dart';

List<RouteBase> getPlatformRoutes(GlobalKey<NavigatorState> rootKey) {
  return [
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: rootKey,
      builder: (context, state, navigationShell) =>
          MainScreen(navigationShell: navigationShell, child: const SizedBox()),
      branches: [
        for (final r in AppRoutes.tabRoutes)
          StatefulShellBranch(
            routes: [GoRoute(path: r.path, name: r.name, builder: (_, __) => r.builder!())],
          ),
      ],
    ),
  ];
}
