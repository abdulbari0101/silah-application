import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/components/inputs.dart';
import 'package:silah_app/core/config/theme/extentions/text_styling_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/config/validators/form_validators.dart';
import 'package:silah_app/core/foundation/localization/localized_value_resolver.dart';
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

  List<LegalSpecializationEntity> _selectedLegalFields = const [];
  LookupItemEntity? _selectedCity;
  LookupItemEntity? _selectedWorkplace;

  @override
  void dispose() {
    _officeNameCtrl.dispose();
    _experienceCtrl.dispose();
    super.dispose();
  }

  bool _isFormComplete() {
    return _selectedLegalFields.isNotEmpty &&
        _selectedCity != null &&
        _selectedWorkplace != null &&
        _officeNameCtrl.text.trim().isNotEmpty &&
        _experienceCtrl.text.trim().isNotEmpty;
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final selectedLegalFields = _selectedLegalFields;
    final selectedCity = _selectedCity;
    final selectedWorkplace = _selectedWorkplace;
    if (selectedLegalFields.isEmpty ||
        selectedCity == null ||
        selectedWorkplace == null) {
      return;
    }
    widget.onNext(
      LawyerProfessionalInfo(
        personal: widget.personalInfo,
        legalFields: List<LegalSpecializationEntity>.unmodifiable(
          selectedLegalFields,
        ),
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
          FormField<List<LegalSpecializationEntity>>(
            initialValue: _selectedLegalFields,
            validator: (value) => value == null || value.isEmpty
                ? Strings.error_fill_form.tr()
                : null,
            builder: (field) {
              final selectedText = _selectedLegalFields
                  .map(_displaySpecialization)
                  .join(', ');
              final hasSelection = _selectedLegalFields.isNotEmpty;
              final colors = context.colors;
              final textTheme = context.textTheme;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildInputLabel(context, Strings.specializations.tr()),
                  InkWell(
                    borderRadius: context.shapes.brMd,
                    onTap: () async {
                      final formCubit = context.read<FormCubit>();
                      final selected = await _showSpecializationsPicker();
                      if (!mounted || selected == null) return;
                      setState(() {
                        _selectedLegalFields = selected;
                      });
                      field.didChange(selected);
                      formCubit.updateValidity(_isFormComplete());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: context.shapes.brMd,
                        border: Border.all(
                          color: field.hasError ? colors.error : colors.outline,
                        ),
                        color: colors.surfaceContainerLowest,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              hasSelection
                                  ? selectedText
                                  : Strings.choose_specialization.tr(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: hasSelection
                                  ? textTheme.bodySmall?.regular
                                  : (textTheme.bodySmall?.regular ??
                                            const TextStyle())
                                        .copyWith(
                                          color: colors.onSurfaceVariant,
                                        ),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 20,
                            color: colors.onSurfaceVariant,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (hasSelection) ...[
                    UIConstants.smallHeight,
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _selectedLegalFields.map((specialization) {
                        final label = _displaySpecialization(specialization);
                        return Chip(
                          label: Text(label),
                          onDeleted: () {
                            final filtered = _selectedLegalFields
                                .where(
                                  (item) =>
                                      _specializationKey(item) !=
                                      _specializationKey(specialization),
                                )
                                .toList();
                            setState(() {
                              _selectedLegalFields = filtered;
                            });
                            field.didChange(filtered);
                            context.read<FormCubit>().updateValidity(
                              _isFormComplete(),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ],
                  if (field.hasError) ...[
                    const SizedBox(height: 6),
                    Text(
                      field.errorText ?? '',
                      style: context.inputTheme.errorStyle,
                    ),
                  ],
                ],
              );
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
    return Strings.not_available.tr();
  }

  String _displayLookup(LookupItemEntity item) {
    final name = LocalizedValueResolver.resolve(
      localeCode: context.locale.languageCode,
      arabic: item.nameAr,
      english: item.nameEn,
    );
    return name != null && name.isNotEmpty ? name : Strings.not_available.tr();
  }

  Future<List<LegalSpecializationEntity>?> _showSpecializationsPicker() async {
    return showModalBottomSheet<List<LegalSpecializationEntity>>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
        var selected = List<LegalSpecializationEntity>.from(
          _selectedLegalFields,
        );

        return StatefulBuilder(
          builder: (context, setSheetState) {
            return SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.72,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(Strings.cancel.tr()),
                          ),
                          const Spacer(),
                          Text(
                            Strings.specializations.tr(),
                            style: context.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(
                              List<LegalSpecializationEntity>.unmodifiable(
                                selected,
                              ),
                            ),
                            child: Text(Strings.apply.tr()),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget.specializations.length,
                        itemBuilder: (context, index) {
                          final item = widget.specializations[index];
                          final isSelected = _containsSpecialization(
                            selected,
                            item,
                          );
                          return CheckboxListTile(
                            dense: true,
                            value: isSelected,
                            title: Text(_displaySpecialization(item)),
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (_) {
                              setSheetState(() {
                                selected = _toggleSpecialization(
                                  selected,
                                  item,
                                );
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  List<LegalSpecializationEntity> _toggleSpecialization(
    List<LegalSpecializationEntity> selected,
    LegalSpecializationEntity specialization,
  ) {
    if (_containsSpecialization(selected, specialization)) {
      return selected
          .where(
            (item) =>
                _specializationKey(item) != _specializationKey(specialization),
          )
          .toList();
    }
    return [...selected, specialization];
  }

  bool _containsSpecialization(
    List<LegalSpecializationEntity> selected,
    LegalSpecializationEntity specialization,
  ) {
    final targetKey = _specializationKey(specialization);
    return selected.any((item) => _specializationKey(item) == targetKey);
  }

  String _specializationKey(LegalSpecializationEntity specialization) {
    final id = specialization.id?.trim();
    if (id != null && id.isNotEmpty) {
      return 'id:$id';
    }
    final code = specialization.code?.trim();
    if (code != null && code.isNotEmpty) {
      return 'code:$code';
    }
    final name = specialization.name?.trim();
    if (name != null && name.isNotEmpty) {
      return 'name:$name';
    }
    return 'fallback:${specialization.hashCode}';
  }
}
