import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/validators/form_validators.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button_with_progress.dart';
import 'package:silah_app/core/presentation/ui/widget/text_fields/f_password_field.dart';
import 'package:silah_app/features/auth/presentation/cubits/change_password/change_password_cubit.dart';

class ChangePasswordBody extends StatefulWidget {
  const ChangePasswordBody({super.key});

  @override
  State<ChangePasswordBody> createState() => _ChangePasswordBodyState();
}

class _ChangePasswordBodyState extends State<ChangePasswordBody> {
  final _currentController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _currentController.dispose();
    _newController.dispose();
    _confirmController.dispose();
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
              FPasswordField(
                controller: _currentController,
                label: Strings.password.tr(),
                hintText: Strings.msg_enter_password.tr(),
                validator: (value) =>
                    validateCurrentPassword(currentPassword: value ?? ''),
              ),
              UIConstants.mediumHeight,
              FPasswordField(
                controller: _newController,
                label: Strings.change_password.tr(),
                hintText: Strings.change_password.tr(),
                validator: (value) => validateNewPassword(
                  newValue: value ?? '',
                  label: Strings.password.tr(),
                ),
              ),
              UIConstants.mediumHeight,
              FPasswordField(
                controller: _confirmController,
                label: Strings.confirm_password.tr(),
                hintText: Strings.confirm_password.tr(),
                validator: (value) {
                  final confirm = value ?? '';
                  if (confirm.trim().isEmpty)
                    return Strings.error_fill_form.tr();
                  if (confirm.trim() != _newController.text.trim()) {
                    return Strings.error_enter_password_mismatch.tr();
                  }
                  return null;
                },
              ),
              UIConstants.bigHeight,
              BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                builder: (context, state) {
                  final isLoading = state.maybeWhen(
                    submitting: () => true,
                    orElse: () => false,
                  );
                  return PrimaryButtonWithProgress(
                    text: Strings.update_password.tr(),
                    isLoading: isLoading,
                    onTap: isLoading
                        ? null
                        : () {
                            if (!(_formKey.currentState?.validate() ?? false))
                              return;
                            context.read<ChangePasswordCubit>().submit(
                              currentPassword: _currentController.text,
                              newPassword: _newController.text,
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
