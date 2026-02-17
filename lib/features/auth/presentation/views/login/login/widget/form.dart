import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/validators/form_validators.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/extensions/app_state_context_extension.dart';
import 'package:silah_app/core/presentation/state_magment/cubits/form_cubit.dart';
import 'package:silah_app/core/presentation/ui/responsive/dimensions.dart';
import 'package:silah_app/core/presentation/ui/widget/text_fields/f_email_field.dart';
import 'package:silah_app/core/presentation/ui/widget/text_fields/f_password_field.dart';

import '../../../../blocs/login/login_bloc.dart';
import 'forget_pass.dart';
import 'login_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();

  bool _isFormComplete() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    return email.isNotEmpty && password.isNotEmpty;
  }

  @override
  void initState() {
    emailController = TextEditingController(text: context.customer?.email);
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        // if (state is UserRegistered) {
        //   // mobileNoController.text = state.customer.mobileNo ?? "";
        //   // passwordController.text = state.customer.customerPassword ?? "";
        // }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              onChanged: () {
                context.read<FormCubit>().updateValidity(_isFormComplete());
              },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                  FEmailField(
                    controller: emailController,
                    hintText: Strings.email_address.tr(),
                    validator: validateRequiredEmail,
                    textInputAction: TextInputAction.next,
                    showLabel: true,
                  ),
                  const SizedBox(height: 8),
                  FPasswordField(
                    controller: passwordController,
                    label: Strings.password.tr(),
                    hintText: Strings.msg_enter_password.tr(),
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    validator: (p0) =>
                        validateCurrentPassword(currentPassword: passwordController.text),
                   

                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: AppDimension(context).height * 0.03),
                  LoginButton(
                    onTap: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<LoginBloc>(context).add(
                          LoginRequested(
                            email: emailController.text.trim(),
                            password: passwordController.text,
                          ),
                        );
                      }
                    },
                  ),

                  SizedBox(height: AppDimension(context).height * 0.02),
                  ForgetPasswordField(),
                  SizedBox(height: AppDimension(context).height * 0.02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
