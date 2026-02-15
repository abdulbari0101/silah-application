import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/router/route_extensions.dart';

import 'success_screen_builder.dart';

extension SuccessNavigation on BuildContext {
  /// Navigates to the success screen using [goNamed]
  void goToSuccess(SuccessScreenArgs args) {
    goTo(AppRoutes.success, extra: SuccessScreenBuilder.build(args));
  }

  /// Pushes to the success screen using [pushNamed]
  void pushToSuccess(SuccessScreenArgs args) {
    pushTo(AppRoutes.success, extra: SuccessScreenBuilder.build(args));
  }
}
