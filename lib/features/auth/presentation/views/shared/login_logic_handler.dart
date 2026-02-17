import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart';
import 'package:silah_app/core/presentation/ui/overlays/dialogs/dialog_service.dart';
import 'package:silah_app/features/auth/presentation/blocs/login/login_bloc.dart';
import '../../blocs/login/login_operation_type.dart';

class LoginLogicHandler extends StatelessWidget {
  final Widget child;
  final Function(LoginOperationType)? onSuccess;
  final Function(LoginOperationType, String)? onError;

  const LoginLogicHandler({super.key, required this.child, this.onSuccess, this.onError});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppStateBloc, AppStateState>(
      listener: (context, state) {
        if (state is AppStateLoaded) {
          switch (state.data.userAuthStatus) {
          
            case UserAuthStatus.loggedInUnverifiedAccount:
            case UserAuthStatus.loggedInFullyVerified:
              context.goNamed(AppRoutes.home.name);
              break;
            case UserAuthStatus.firstTimeGuest:
            case UserAuthStatus.loggedOutReturningUser:
            case UserAuthStatus.loggedInUnverifiedDevice:
              break;
          }
        }
      },
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginError) {
            if (onError != null) {
              onError!(state.operationType, state.message);
            } else {
              DialogService.showErrorDialog(
                context,
                title: Strings.err_login.tr(),
                desc: state.message,
              );
            }
          }

          if (state is LoginOperationSuccess) {
            if (onSuccess != null) {
              onSuccess!(state.operationType);
            }
          }
        },
        child: child,
      ),
    );
  }
}
