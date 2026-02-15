import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/validators/form_validators.dart';
import 'package:silah_app/core/presentation/state_magment/cubits/form_cubit.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button_with_form_cubit.dart';
import 'package:silah_app/core/presentation/ui/widget/text_fields/f_text2_feild.dart';
import 'package:silah_app/features/auth/presentation/views/registration/models/lawyer_registration_data.dart';

class LawyerProfessionalInfoForm extends StatefulWidget {
  final LawyerPersonalInfo personalInfo;
  final void Function(LawyerProfessionalInfo info) onNext;

  const LawyerProfessionalInfoForm({
    super.key,
    required this.personalInfo,
    required this.onNext,
  });

  @override
  State<LawyerProfessionalInfoForm> createState() => _LawyerProfessionalInfoFormState();
}

class _LawyerProfessionalInfoFormState extends State<LawyerProfessionalInfoForm> {
  final _formKey = GlobalKey<FormState>();
  final _legalFieldCtrl = TextEditingController();
  final _cityCtrl = TextEditingController();
  final _workplaceCtrl = TextEditingController();
  final _officeNameCtrl = TextEditingController();
  final _experienceCtrl = TextEditingController();

  @override
  void dispose() {
    _legalFieldCtrl.dispose();
    _cityCtrl.dispose();
    _workplaceCtrl.dispose();
    _officeNameCtrl.dispose();
    _experienceCtrl.dispose();
    super.dispose();
  }

  bool _isFormComplete() {
    return _legalFieldCtrl.text.trim().isNotEmpty &&
        _cityCtrl.text.trim().isNotEmpty &&
        _workplaceCtrl.text.trim().isNotEmpty &&
        _officeNameCtrl.text.trim().isNotEmpty &&
        _experienceCtrl.text.trim().isNotEmpty;
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    widget.onNext(
      LawyerProfessionalInfo(
        personal: widget.personalInfo,
        legalField: _legalFieldCtrl.text.trim(),
        city: _cityCtrl.text.trim(),
        workplace: _workplaceCtrl.text.trim(),
        officeName: _officeNameCtrl.text.trim(),
        experienceYears: _experienceCtrl.text.trim(),
      ),
    );
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
            controller: _legalFieldCtrl,
            labelText: Strings.specializations.tr(),
            hintText: Strings.search_for_lawyer_or_specialization.tr(),
            textInputAction: TextInputAction.next,
            validator: validateJustRequired,
          ),
          UIConstants.mediumHeight,
          FTextField(
            controller: _cityCtrl,
            labelText: Strings.label_city.tr(),
            hintText: Strings.label_city.tr(),
            textInputAction: TextInputAction.next,
            validator: validateJustRequired,
          ),
          UIConstants.mediumHeight,
          FTextField(
            controller: _workplaceCtrl,
            labelText: Strings.law_firm.tr(),
            hintText: Strings.law_firm.tr(),
            textInputAction: TextInputAction.next,
            validator: validateJustRequired,
          ),
          UIConstants.mediumHeight,
          FTextField(
            controller: _officeNameCtrl,
            labelText: Strings.label_name.tr(),
            hintText: Strings.law_firm.tr(),
            textInputAction: TextInputAction.next,
            validator: validateJustRequired,
          ),
          UIConstants.mediumHeight,
          FTextField(
            controller: _experienceCtrl,
            labelText: Strings.years_of_experience.tr(),
            hintText: Strings.years_of_experience.tr(),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            validator: validateJustRequired,
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
