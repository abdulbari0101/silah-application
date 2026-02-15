import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/presentation/ui/widget/appbar/custome_screen_header.dart';
import 'package:silah_app/features/auth/presentation/blocs/login/login_bloc.dart';

import '../../../../../../../core/config/constants/ui_constants.dart';
import '../../../../../../../core/presentation/state_magment/cubits/form_cubit.dart';
import '../../../../../../../core/presentation/ui/responsive/dimensions.dart';
import '../../../../../../../core/presentation/ui/widget/form/shared_form_widget.dart';
import '../../../../../../../core/presentation/ui/widget/icons/app_svg_icon.dart';
import '../../../../../../../core/presentation/ui/widget/otp/otp_field.dart';
import '../../../../../../../gen/assets.gen.dart';
import 'login_resend_widget.dart';
import 'otp_text.dart';

class LoginOtpBody extends StatefulWidget {
  const LoginOtpBody({super.key});

  @override
  State<LoginOtpBody> createState() => _LoginOtpBodyState();
}

class _LoginOtpBodyState extends State<LoginOtpBody> {
  // Objects -------------------------------------------------------------
  late GlobalKey<FormState> _formKey;
  String? _otp;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FormCubit(),

      child: SharedFormWidget(
        formKey: _formKey,
        fields: [
          CustomeScreenHeader(
            showCallUsButton: false,
            svgIcon: Assets.icons.navigation.icBack,
            onTap: () {
              context.pop();
            },
          ),

          UIConstants.xbigHeight,

          AppSvgIcon(assetName: Assets.images.verifiedLite, darkDynamicColor: false),

          SizedBox(height: AppDimension(context).height * 0.04),

          const OTPText(),

          SizedBox(height: AppDimension(context).height * 0.04),

          OTPField(
            onSubmit: (val) {
              _otp = val;
              _submitOTP(_otp);
            },
          ),
          SizedBox(height: AppDimension(context).height * 0.06),
        ],
        button: LoginResendWidget(
          onTap: () {
            context.read<LoginBloc>().add(ReSendPhoneOTP());
          },
          onSuccess: (operationType) {},
        ),
      ),
    );
  }

  void _submitOTP([String? otp]) {
    if (otp?.length == 6) {
      context.read<LoginBloc>().add(ConfirmPhoneOTP(otp: otp));
    } else {
      // Optionally show error
    }
  }
}
