import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/router/route_info.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart';
import 'package:silah_app/features/auth/presentation/blocs/login/login_bloc.dart';
import 'package:wizard_stepper/wizard_stepper.dart';

class AuthMethods {
  static WizardStepperController controllerInit() {
    return WizardStepperController(
      showStepNumber: false,
      showStepDividers: false,

      completedStepColor: Colors.transparent,
      currentStepColor: Colors.transparent,
      stepColor: Colors.transparent,
      dividerColor: Colors.transparent,

      stepSize: 0,
      stepBackgroundSize: 0,
      stepIconSize: 0,
      borderSize: 0,

      dividerThickness: 0,
      dividerMargin: 0,
    );
  }

  /// Determine the initial route based on authentication state and verification needs
  static RouteInfo determineInitialRoute(BuildContext context) {
    final appState = context.read<AppStateBloc>().state;
    final loginState = context.read<LoginBloc>().state;

    // If we don’t have app state or login hasn't begun, send to login
    if (appState is! AppStateLoaded || loginState is LoginInitial) {
      return AppRoutes.login;
    }

    // Special case: device change requires phone verification
    if (loginState is PhoneNumberVerficationRequired) {
      return AppRoutes.otp;
    }

    final authStatus = appState.data.userAuthStatus;

    switch (authStatus) {
      case UserAuthStatus.loggedInUnverifiedAccount:
      case UserAuthStatus.loggedInFullyVerified:
        return AppRoutes.home;
      case UserAuthStatus.firstTimeGuest:
      case UserAuthStatus.loggedOutReturningUser:
      case UserAuthStatus.loggedInUnverifiedDevice:
        return AppRoutes.login;
    }
  }
}
