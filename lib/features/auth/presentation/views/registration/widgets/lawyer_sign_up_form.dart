import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/validators/form_validators.dart';
import 'package:silah_app/core/presentation/state_magment/cubits/form_cubit.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button_with_form_cubit.dart';
import 'package:silah_app/core/presentation/ui/widget/text_fields/f_drop_down_field.dart';
import 'package:silah_app/core/presentation/ui/widget/text_fields/f_email_field.dart';
import 'package:silah_app/core/presentation/ui/widget/text_fields/f_password_field.dart';
import 'package:silah_app/core/presentation/ui/widget/text_fields/f_text2_feild.dart';
import 'package:silah_app/features/auth/presentation/views/registration/models/lawyer_registration_data.dart';

class LawyerSignUpForm extends StatefulWidget {
  final void Function(LawyerPersonalInfo info) onNext;

  const LawyerSignUpForm({super.key, required this.onNext});

  @override
  State<LawyerSignUpForm> createState() => _LawyerSignUpFormState();
}

class _LawyerSignUpFormState extends State<LawyerSignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  String? _gender;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  bool _isFormComplete() {
    return _nameCtrl.text.trim().isNotEmpty &&
        _emailCtrl.text.trim().isNotEmpty &&
        _phoneCtrl.text.trim().isNotEmpty &&
        _passCtrl.text.isNotEmpty &&
        _confirmCtrl.text.isNotEmpty &&
        _gender != null &&
        _confirmCtrl.text == _passCtrl.text;
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    widget.onNext(
      LawyerPersonalInfo(
        fullName: _nameCtrl.text.trim(),
        email: _emailCtrl.text.trim(),
        phone: _phoneCtrl.text.trim(),
        gender: _gender ?? '',
        password: _passCtrl.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final genderOptions = [Strings.rbtn_male.tr(), Strings.rbtn_fmale.tr()];

    return Form(
      key: _formKey,
      onChanged: () => context.read<FormCubit>().updateValidity(_isFormComplete()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FTextField(
            controller: _nameCtrl,
            labelText: Strings.label_name.tr(),
            hintText: Strings.name_example_1.tr(),
            textInputAction: TextInputAction.next,
            validator: validateName,
          ),
          UIConstants.mediumHeight,
          FEmailField(
            controller: _emailCtrl,
            hintText: Strings.email_address.tr(),
            textInputAction: TextInputAction.next,
            validator: validateRequiredEmail,
          ),
          UIConstants.mediumHeight,
          FTextField(
            controller: _phoneCtrl,
            labelText: Strings.mobile_number.tr(),
            hintText: Strings.mobile_number.tr(),
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            validator: validateMobileDefault,
          ),
          UIConstants.mediumHeight,
          FDropdownField(
            label: Strings.tv_gender.tr(),
            options: genderOptions,
            selectedValue: _gender,
            onChanged: (value) => setState(() => _gender = value),
            validator: validateJustRequired,
          ),
          UIConstants.mediumHeight,
          FPasswordField(
            controller: _passCtrl,
            label: Strings.password.tr(),
            hintText: Strings.password.tr(),
            textInputAction: TextInputAction.next,
            validator: (value) => validateNewPassword(newValue: value, label: Strings.password.tr()),
          ),
          UIConstants.mediumHeight,
          FPasswordField(
            controller: _confirmCtrl,
            label: Strings.confirm_password.tr(),
            hintText: Strings.confirm_password.tr(),
            textInputAction: TextInputAction.done,
            validator: (_) => validateConfirmNewPassword(
              newValue: _passCtrl.text,
              confirmValue: _confirmCtrl.text,
              label: Strings.confirm_password.tr(),
            ),
            onSubmitted: (_) => _submit(),
          ),
          UIConstants.xbigHeight,
          PrimaryButtonWithFormCubit(
            text: Strings.btn_next.tr(),
            isLoading: false,
            onValidSubmit: _submit,
          ),
        ],
      ),
    );
  }
}
