import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/validators/form_validators.dart';
import 'package:silah_app/core/presentation/state_magment/cubits/form_cubit.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button_with_form_cubit.dart';
import 'package:silah_app/core/presentation/ui/widget/drop_down/f_drop_down.dart';
import 'package:silah_app/core/presentation/ui/widget/text_fields/f_text2_feild.dart';
import 'package:silah_app/features/auth/presentation/views/registration/models/lawyer_registration_data.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';
import 'package:silah_app/features/lookups/domain/entities/lookup_item_entity.dart';

class LawyerProfessionalInfoForm extends StatefulWidget {
  final LawyerPersonalInfo personalInfo;
  final void Function(LawyerProfessionalInfo info) onNext;
  final List<LegalSpecializationEntity> specializations;
  final List<LookupItemEntity> cities;
  final List<LookupItemEntity> workDestinations;

  const LawyerProfessionalInfoForm({
    super.key,
    required this.personalInfo,
    required this.onNext,
    required this.specializations,
    required this.cities,
    required this.workDestinations,
  });

  @override
  State<LawyerProfessionalInfoForm> createState() =>
      _LawyerProfessionalInfoFormState();
}

class _LawyerProfessionalInfoFormState
    extends State<LawyerProfessionalInfoForm> {
  final _formKey = GlobalKey<FormState>();
  final _officeNameCtrl = TextEditingController();
  final _experienceCtrl = TextEditingController();

  LegalSpecializationEntity? _selectedLegalField;
  LookupItemEntity? _selectedCity;
  LookupItemEntity? _selectedWorkplace;

  @override
  void dispose() {
    _officeNameCtrl.dispose();
    _experienceCtrl.dispose();
    super.dispose();
  }

  bool _isFormComplete() {
    return _selectedLegalField != null &&
        _selectedCity != null &&
        _selectedWorkplace != null &&
        _officeNameCtrl.text.trim().isNotEmpty &&
        _experienceCtrl.text.trim().isNotEmpty;
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final selectedLegalField = _selectedLegalField;
    final selectedCity = _selectedCity;
    final selectedWorkplace = _selectedWorkplace;
    if (selectedLegalField == null ||
        selectedCity == null ||
        selectedWorkplace == null) {
      return;
    }
    widget.onNext(
      LawyerProfessionalInfo(
        personal: widget.personalInfo,
        legalField: _displaySpecialization(selectedLegalField),
        legalFieldId: selectedLegalField.id,
        city: _displayLookup(selectedCity),
        cityId: selectedCity.id,
        areaId: selectedCity.areaId,
        workplace: _displayLookup(selectedWorkplace),
        workDestinationId: selectedWorkplace.id,
        officeName: _officeNameCtrl.text.trim(),
        experienceYears: _experienceCtrl.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () =>
          context.read<FormCubit>().updateValidity(_isFormComplete()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FDropDown<LegalSpecializationEntity>(
            items: widget.specializations,
            initialValue: _selectedLegalField,
            labelBuilder: _displaySpecialization,
            label: Strings.specializations.tr(),
            hintText: Strings.choose_specialization.tr(),
            validator: (value) =>
                value == null ? Strings.error_fill_form.tr() : null,
            onChanged: (value) {
              setState(() {
                _selectedLegalField = value;
              });
              context.read<FormCubit>().updateValidity(_isFormComplete());
            },
          ),
          UIConstants.mediumHeight,
          FDropDown<LookupItemEntity>(
            items: widget.cities,
            initialValue: _selectedCity,
            labelBuilder: _displayLookup,
            label: Strings.label_city.tr(),
            hintText: Strings.label_city.tr(),
            validator: (value) =>
                value == null ? Strings.error_fill_form.tr() : null,
            onChanged: (value) {
              setState(() {
                _selectedCity = value;
              });
              context.read<FormCubit>().updateValidity(_isFormComplete());
            },
          ),
          UIConstants.mediumHeight,
          FDropDown<LookupItemEntity>(
            items: widget.workDestinations,
            initialValue: _selectedWorkplace,
            labelBuilder: _displayLookup,
            label: Strings.label_workplace.tr(),
            hintText: Strings.label_workplace.tr(),
            validator: (value) =>
                value == null ? Strings.error_fill_form.tr() : null,
            onChanged: (value) {
              setState(() {
                _selectedWorkplace = value;
              });
              context.read<FormCubit>().updateValidity(_isFormComplete());
            },
          ),
          UIConstants.mediumHeight,
          FTextField(
            controller: _officeNameCtrl,
            labelText: Strings.label_office_name.tr(),
            hintText: Strings.label_office_name.tr(),
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

  String _displaySpecialization(LegalSpecializationEntity specialization) {
    final name = specialization.name?.trim();
    if (name != null && name.isNotEmpty) return name;
    final code = specialization.code?.trim();
    if (code != null && code.isNotEmpty) return code;
    return specialization.id ?? Strings.not_available.tr();
  }

  String _displayLookup(LookupItemEntity item) {
    final locale = context.locale.languageCode;
    final name = locale == 'ar' ? item.nameAr : item.nameEn;
    return name?.trim().isNotEmpty == true
        ? name!.trim()
        : (item.id ?? Strings.not_available.tr());
  }
}
