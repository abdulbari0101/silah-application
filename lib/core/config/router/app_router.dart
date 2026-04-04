import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';

import 'app_routes.dart';
import 'global_navigator.dart';
import 'platform_routes.dart';
import 'route_info.dart';

final logger = AppLogger();

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.splash.path,
  debugLogDiagnostics: true,
  redirect: (context, state) {
    logger.appDebug("routerState=${state.fullPath}", tag: "redirect");

    final blocState = locator.get<AppStateBloc>().state;

    logger.appDebug("blocState=$blocState", tag: "redirect");

    if (blocState is! AppStateLoaded) return null;

    final isLoggedIn = blocState.data.isLoggedIn;
    final currentPath = state.uri.path;
    final authPaths = {for (final r in AppRoutes.firstTimeGuestRoutes) r.path};

    if (!isLoggedIn && !authPaths.contains(currentPath)) {
      return AppRoutes.login.path;
    }

    if (isLoggedIn && currentPath == AppRoutes.login.path) {
      return AppRoutes.home.path;
    }

    return null;
  },
  routes: [
    ...AppRoutes.allRoutes.map(
      (route) => GoRoute(
        path: route.path,
        name: route.name,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: route.build(state),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  switch (route.transitionType) {
                    case RouteTransitionType.fade:
                      return FadeTransition(opacity: animation, child: child);
                    case RouteTransitionType.slideBottom:
                      return SlideTransition(
                        position:
                            Tween<Offset>(
                              begin: const Offset(0, 1),
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOut,
                              ),
                            ),
                        child: child,
                      );
                    case RouteTransitionType.none:
                      return child;
                    case RouteTransitionType.slide:
                      return SlideTransition(
                        position:
                            Tween<Offset>(
                              begin:
                                  Directionality.of(context) ==
                                      TextDirection.rtl
                                  ? const Offset(-1, 0)
                                  : const Offset(1, 0),
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeInOut,
                              ),
                            ),
                        child: child,
                      );
                  }
                },
            transitionDuration: const Duration(milliseconds: 150),
          );
        },
      ),
    ),
    ...getPlatformRoutes(rootNavigatorKey),
  ],
);
