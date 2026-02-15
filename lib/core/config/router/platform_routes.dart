import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/features/main/presentation/views/main/screen/main_screen.dart';

import 'app_routes.dart';

List<RouteBase> getPlatformRoutes(GlobalKey<NavigatorState> rootKey) {
  return [
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: rootKey,
      builder: (context, state, navigationShell) => MainScreen(navigationShell: navigationShell),
      branches: [
        for (final route in AppRoutes.tabRoutes)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: route.path,
                name: route.name,
                builder: (context, state) => route.build(state),
              ),
            ],
          ),
      ],
    ),
  ];
}
