import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum RouteTransitionType { slide, fade, slideBottom, none }

class RouteInfo {
  final String name;
  final String path;
  final Widget Function()? builder;
  final Widget Function(GoRouterState state)? stateBuilder;
  final RouteTransitionType transitionType;

  const RouteInfo({
    required this.name,
    required this.path,
    this.builder,
    this.stateBuilder,
    this.transitionType = RouteTransitionType.slide,
  }) : assert(builder != null || stateBuilder != null);

  Widget build(GoRouterState state) {
    final builder = stateBuilder;
    if (builder != null) {
      return builder(state);
    }
    return this.builder!();
  }
}
