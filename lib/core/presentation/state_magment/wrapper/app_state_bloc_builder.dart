import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/router/route_extensions.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';

import '../blocs/app_state/state_data/app_auth_status.dart';

class AppStateBlocBuilder extends StatelessWidget {
  const AppStateBlocBuilder({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppStateBloc, AppStateState>(
      listener: (context, state) {
        if (state is AppStateLoaded) {
          switch (state.data.userAuthStatus) {
            case UserAuthStatus.loggedInUnverifiedAccount:
            case UserAuthStatus.loggedInUnverifiedDevice:
            case UserAuthStatus.loggedInFullyVerified:
              break;
            case UserAuthStatus.firstTimeGuest:
            case UserAuthStatus.loggedOutReturningUser:
              context.goTo(AppRoutes.login);
              break;
          }
        }
      },

      builder: (context, state) {
        return child;
      },
    );
  }
}
