import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/router/route_info.dart';

extension NavigationHelpers on BuildContext {
  /// Replace the current location with [route].
  void goTo(
    RouteInfo route, {
    Map<String, String> params = const {},
    Map<String, String> query = const {},
    Map<String, dynamic> extra = const {},
  }) {
    goNamed(route.name, pathParameters: params, queryParameters: query, extra: extra);
  }

  /// Push a new page on top of the current stack.
  void pushTo(
    RouteInfo route, {
    Map<String, String> params = const {},
    Map<String, String> query = const {},
    Map<String, dynamic> extra = const {},
  }) {
    pushNamed(route.name, pathParameters: params, queryParameters: query, extra: extra);
  }

  bool isRouteActive(RouteInfo route) {
    final router = GoRouter.of(this);

    final state = router.state;
    final String currentPath = Uri.parse(state.matchedLocation).path;

    return state.name == route.name ||
        currentPath == route.path ||
        currentPath.endsWith(route.path);
  }

  /// Rebuild the page that is on the top of the stack, keeping the rest
  /// of the navigation history intact.
  ///
  /// * If the current route was registered with a `name`, we use
  ///   `pushReplacementNamed` so GoRouter recreates the page with the
  ///   same path/query/extra data (unless the caller overrides them).
  /// * If the route is anonymous (`state.name == null`), we fall back
  ///   to a raw location replace.
  void restartCurrentRoute({
    Map<String, String>? params,
    Map<String, String>? query,
    Map<String, dynamic>? extra,
  }) {
    final router = GoRouter.of(this);
    final state = router.state;

    if (state.name != null) {
      router.pushReplacementNamed(
        state.name!, // same named route
        pathParameters: params ?? state.pathParameters,

        extra: extra ?? state.extra,
      );
    } else {
      // Anonymous route → just replace by URI.
      router.replace(state.matchedLocation);
    }
  }

  void popOrPush(
    RouteInfo route, {
    Map<String, String> params = const {},
    Map<String, String> query = const {},
    Map<String, dynamic> extra = const {},
  }) {
    final router = GoRouter.of(this);

    bool found = false;
    // Pop step‑by‑step while we can still go back.
    while (router.canPop()) {
      router.pop();

      final state = router.state;
      final String loc = state.matchedLocation;
      final bool isTarget =
          state.name == route.name || loc == route.path || loc.endsWith(route.path);

      if (isTarget) {
        found = true;
        break;
      }
    }

    if (!found) {
      // Route wasn’t present – push it once.
      pushTo(route, params: params, query: query, extra: extra);
    }
  }

  bool isTimeoutExempt() {
    final router = GoRouter.of(this);
    final location = router.state.matchedLocation;

    return AppRoutes.timeoutExempt.any((r) => r.path == location || r.name == router.state.name);
  }
}
