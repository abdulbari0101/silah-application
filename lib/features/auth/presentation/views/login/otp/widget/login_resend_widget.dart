import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/presentation/ui/overlays/dialogs/dialog_service.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/customer_progress.dart';
import 'package:silah_app/features/auth/presentation/blocs/login/login_extenstion.dart';
import 'package:silah_app/features/auth/presentation/blocs/login/login_operation_type.dart';
import 'package:silah_app/features/auth/presentation/views/shared/login_logic_handler.dart';

import '../../../../../../../core/config/localization/localizations_string_keys.dart';
import '../../../../../../../core/presentation/ui/widget/otp/resend_widget.dart';
import '../../../../blocs/login/login_bloc.dart';

class LoginResendWidget extends StatelessWidget {
  const LoginResendWidget({super.key, required this.onSuccess, this.onTap});
  final Function()? onTap;
  final Function(LoginOperationType) onSuccess;

  @override
  Widget build(BuildContext context) {
    return LoginLogicHandler(
      onSuccess: (operationType) {
        if (operationType == LoginOperationType.ReSendPhoneOTP) {
          Toasts.success(context, Strings.sms_sent.tr());
        } else if (operationType == LoginOperationType.ConfirmPhoneOTP) {
          context.pop();
          Toasts.success(context, Strings.msg_device_register_sucess.tr());
        }

        onSuccess(operationType);
      },

      onError: (operationType, message) {
        if (operationType == LoginOperationType.ReSendPhoneOTP ||
            operationType == LoginOperationType.RequestPhoneOTP) {
          _showErrorDialog(context, message, ReSendPhoneOTP());
        } else if (operationType == LoginOperationType.ConfirmPhoneOTP) {
          _showErrorDialog(context, message, ConfirmPhoneOTP());
        }
      },

      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state.isShowButtonLoading) {
            return const CustomerProgress();
          }
          return ResendWidget(
            isLouding: state.isResendOTPLoading,
            onTap: () {
              if (onTap != null) {
                onTap!();
              }
            },
          );
        },
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message, LoginEvent event) {
    DialogService.showErrorDialog(
      context,
      title: Strings.err_login.tr(),
      desc: message,
      onOKPressed: () {
        context.read<LoginBloc>().add(event);
      },
      onCancelPressed: () {},
    );
  }
}
