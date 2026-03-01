import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/validators/form_validators.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button_with_progress.dart';
import 'package:silah_app/core/presentation/ui/widget/text_fields/f_email_field.dart';
import 'package:silah_app/features/auth/presentation/cubits/forgot_password/forgot_password_cubit.dart';

class ForgotPasswordBody extends StatefulWidget {
  const ForgotPasswordBody({super.key});

  @override
  State<ForgotPasswordBody> createState() => _ForgotPasswordBodyState();
}

class _ForgotPasswordBodyState extends State<ForgotPasswordBody> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: UIConstants.screenHorizantalPadding,
          vertical: UIConstants.bigPadding,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                Strings.forgot_password_question.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              UIConstants.smallHeight,
              Text(
                Strings.msg_enter_email_for_reset.tr(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              UIConstants.bigHeight,
              FEmailField(
                controller: _emailController,
                hintText: Strings.email_address.tr(),
                validator: validateRequiredEmail,
                showLabel: true,
              ),
              UIConstants.bigHeight,
              BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                builder: (context, state) {
                  final isLoading = state.maybeWhen(
                    submitting: () => true,
                    orElse: () => false,
                  );
                  return PrimaryButtonWithProgress(
                    text: Strings.reset_password.tr(),
                    isLoading: isLoading,
                    onTap: isLoading
                        ? null
                        : () {
                            if (!(_formKey.currentState?.validate() ?? false))
                              return;
                            context.read<ForgotPasswordCubit>().submit(
                              _emailController.text,
                            );
                          },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
