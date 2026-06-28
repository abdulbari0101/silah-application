import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/router/global_navigator.dart';
import 'package:silah_app/core/config/router/route_extensions.dart';

import 'package:silah_app/core/presentation/state_magment/blocs/app_state/extensions/app_state_context_extension.dart';
import 'package:silah_app/core/presentation/ui/overlays/dialogs/dialog_service.dart';

import '../blocs/sesstion_bloc/sesstion_bloc.dart';

class SessionBlocListener extends StatelessWidget {
  const SessionBlocListener({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Future<void> goToLogin({
      required BuildContext ctx,
      required bool isNewUser,
    }) async {
      ctx.goTo(AppRoutes.login);
    }

    void handleSessionExpired({
      required BuildContext routerCtx,
      required BuildContext ctx,
      required SessionTokenExpired state,
    }) {
      DialogService.showSessionExpiredDialog(
        onOk: () {
          goToLogin(ctx: routerCtx, isNewUser: ctx.customer == null);
        },
      );
    }

    return BlocListener<SessionBloc, SessionState>(
      listener: (ctx, state) async {
        final goRouteContext = rootNavigatorKey.currentState?.context ?? ctx;

        switch (state) {
          case SessionIdleTimedOut():
            // Inactivity timeout navigation is disabled as requested by the user.
            // if (goRouteContext.isTimeoutExempt()) return;
            // goToLogin(ctx: goRouteContext, isNewUser: ctx.customer == null);
            break;

          case SessionTokenExpired():
            if (goRouteContext.isTimeoutExempt()) return;

            handleSessionExpired(
              routerCtx: goRouteContext,
              ctx: ctx,
              state: state,
            );
            break;

          default:
            break;
        }
      },
      child: child,
    );
  }
}
