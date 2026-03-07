import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/presentation/ui/overlays/dialogs/dialog_service.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button_with_form_cubit.dart';
import 'package:silah_app/features/auth/presentation/blocs/login/login_extenstion.dart';
import 'package:silah_app/features/auth/presentation/blocs/login/login_operation_type.dart';

import '../../../../blocs/login/login_bloc.dart';
import '../../../shared/login_logic_handler.dart';

class LoginButton extends StatelessWidget {
  final Function() onTap;

  const LoginButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return LoginLogicHandler(
      onError: (operationType, message) {
        if (operationType == LoginOperationType.signIn) {
          DialogService.showErrorDialog(
            context,
            title: Strings.err_login.tr(),
            desc: message,
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return PrimaryButtonWithFormCubit(
            text: Strings.login.tr(),
            isLoading: state.isShowButtonLoading,
            onValidSubmit: onTap,
          );
        },
      ),
    );
  }
}
