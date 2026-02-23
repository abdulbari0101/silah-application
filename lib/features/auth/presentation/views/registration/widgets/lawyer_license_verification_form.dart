import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/validators/form_validators.dart';
import 'package:silah_app/core/presentation/state_magment/cubits/form_cubit.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button_with_form_cubit.dart';
import 'package:silah_app/core/presentation/ui/widget/text_fields/f_text2_feild.dart';
import 'package:silah_app/features/auth/domain/entities/registration_payload.dart';
import 'package:silah_app/features/auth/presentation/views/registration/models/lawyer_registration_data.dart';

class LawyerLicenseVerificationForm extends StatefulWidget {
  final LawyerProfessionalInfo professionalInfo;
  final bool isLoading;
  final void Function(RegistrationPayload payload) onSubmit;

  const LawyerLicenseVerificationForm({
    super.key,
    required this.professionalInfo,
    required this.isLoading,
    required this.onSubmit,
  });

  @override
  State<LawyerLicenseVerificationForm> createState() => _LawyerLicenseVerificationFormState();
}

class _LawyerLicenseVerificationFormState extends State<LawyerLicenseVerificationForm> {
  final _formKey = GlobalKey<FormState>();
  final _licenseCtrl = TextEditingController();
  final _nationalIdCtrl = TextEditingController();

  @override
  void dispose() {
    _licenseCtrl.dispose();
    _nationalIdCtrl.dispose();
    super.dispose();
  }

  bool _isFormComplete() {
    return _licenseCtrl.text.trim().isNotEmpty && _nationalIdCtrl.text.trim().isNotEmpty;
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final personal = widget.professionalInfo.personal;
    final fullName = personal.fullName.trim();
    final parts = fullName.split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    final firstName = parts.isNotEmpty ? parts.first : fullName;
    final lastName = parts.length > 1 ? parts.sublist(1).join(' ') : '';

    final payload = RegistrationPayload(
      accountType: RegistrationAccountType.lawyer,
      firstName: firstName,
      lastName: lastName,
      email: personal.email,
      phone: personal.phone,
      password: personal.password,
      gender: personal.gender,
      legalFields: [widget.professionalInfo.legalField],
      city: widget.professionalInfo.city,
      workplace: widget.professionalInfo.workplace,
      officeName: widget.professionalInfo.officeName,
      experienceYears: widget.professionalInfo.experienceYears,
      licenseNumber: _licenseCtrl.text.trim(),
      nationalId: _nationalIdCtrl.text.trim(),
    );

    widget.onSubmit(payload);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () => context.read<FormCubit>().updateValidity(_isFormComplete()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FTextField(
            controller: _licenseCtrl,
            labelText: Strings.license_number.tr(),
            hintText: Strings.license_number.tr(),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            validator: validateJustRequired,
          ),
          UIConstants.mediumHeight,
          FTextField(
            controller: _nationalIdCtrl,
            labelText: Strings.identity_number.tr(),
            hintText: Strings.identity_number.tr(),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            validator: validateJustRequired,
            onSubmitted: (_) => _submit(),
          ),
          UIConstants.xbigHeight,
          PrimaryButtonWithFormCubit(
            text: Strings.finish_registration.tr(),
            isLoading: widget.isLoading,
            onValidSubmit: _submit,
          ),
        ],
      ),
    );
  }
}
