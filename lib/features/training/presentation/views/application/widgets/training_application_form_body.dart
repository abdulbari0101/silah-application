import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/foundation/localization/localized_value_resolver.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button_with_progress.dart';
import 'package:silah_app/core/presentation/ui/widget/drop_down/f_drop_down.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/text_fields/f_text2_feild.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/features/lookups/domain/entities/lookup_item_entity.dart';
import 'package:silah_app/features/training/domain/entities/training_application_entity.dart';
import 'package:silah_app/features/training/domain/entities/training_opportunity_entity.dart';
import 'package:silah_app/features/training/presentation/cubits/lookups/training_lookups_cubit.dart';
import 'package:silah_app/features/training/presentation/views/application_confirmation/models/training_application_confirmation_args.dart';

class TrainingApplicationFormBody extends StatefulWidget {
  const TrainingApplicationFormBody({super.key, required this.opportunity});

  final TrainingOpportunityEntity opportunity;

  @override
  State<TrainingApplicationFormBody> createState() =>
      _TrainingApplicationFormBodyState();
}

class _TrainingApplicationFormBodyState
    extends State<TrainingApplicationFormBody> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _universityController = TextEditingController();
  final _facultyController = TextEditingController();
  final _graduationYearController = TextEditingController();
  final _cvUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final user = context.read<AppStateBloc>().state.data.customer;
    _nameController.text = user?.fullName ?? '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _universityController.dispose();
    _facultyController.dispose();
    _graduationYearController.dispose();
    _cvUrlController.dispose();
    super.dispose();
  }

  void _continue(BuildContext context, TrainingLookupsState lookupsState) {
    if (widget.opportunity.id == null ||
        widget.opportunity.id!.trim().isEmpty) {
      Toasts.error(context, Strings.unexpected_error.tr());
      return;
    }
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final ready = lookupsState.maybeWhen(
      ready: (areas, cities, selectedArea, selectedCity) =>
          (selectedArea, selectedCity),
      orElse: () => null,
    );
    if (ready == null) return;

    final selectedArea = ready.$1;
    final selectedCity = ready.$2;

    final graduationYear = int.tryParse(_graduationYearController.text.trim());

    final application = TrainingApplicationEntity(
      opportunityId: widget.opportunity.id,
      fullName: _nameController.text.trim(),
      university: _universityController.text.trim(),
      faculty: _facultyController.text.trim(),
      areaId: selectedArea?.id,
      cityId: selectedCity?.id,
      city: _displayName(selectedCity),
      graduationYear: graduationYear,
      cvUrl: _cvUrlController.text.trim(),
    );

    context.pushNamed(
      AppRoutes.trainingApplicationConfirm.name,
      extra: TrainingApplicationConfirmationArgs(
        opportunity: widget.opportunity,
        application: application,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingLookupsCubit, TrainingLookupsState>(
      builder: (context, lookupsState) {
        return lookupsState.when(
          loading: () => const Center(child: ProgressStateWidget()),
          failure: (message) => Center(
            child: CustomeErrorWidget(
              message: message,
              onRetry: () => context.read<TrainingLookupsCubit>().load(),
            ),
          ),
          ready: (areas, cities, selectedArea, selectedCity) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: UIConstants.screenHorizantalPadding,
                vertical: UIConstants.bigPadding,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FTextField(
                      enabled: false,
                      controller: _nameController,
                      labelText: Strings.label_name.tr(),

                      validator: (value) => _requiredValidator(value),
                    ),
                    UIConstants.mediumHeight,
                    FTextField(
                      controller: _universityController,
                      labelText: Strings.label_university.tr(),
                      hintText: 'مثال جامعة الملك عبدالعزيز',
                      validator: (value) => _requiredValidator(value),
                    ),
                    UIConstants.mediumHeight,
                    FTextField(
                      controller: _facultyController,
                      labelText: Strings.label_faculty.tr(),
                      hintText: 'مثال كلية الحقوق',
                      validator: (value) => _requiredValidator(value),
                    ),
                    UIConstants.mediumHeight,
                    FDropDown<LookupItemEntity>(
                      items: areas,
                      initialValue: selectedArea,
                      labelBuilder: _displayName,
                      label: Strings.label_area.tr(),
                      onChanged: (value) => context
                          .read<TrainingLookupsCubit>()
                          .selectArea(value),
                      validator: (value) =>
                          value == null ? Strings.error_fill_form.tr() : null,
                    ),
                    UIConstants.mediumHeight,
                    FDropDown<LookupItemEntity>(
                      items: cities,
                      initialValue: selectedCity,
                      labelBuilder: _displayName,
                      label: Strings.label_city.tr(),
                      onChanged: (value) => context
                          .read<TrainingLookupsCubit>()
                          .selectCity(value),
                      validator: (value) =>
                          value == null ? Strings.error_fill_form.tr() : null,
                    ),
                    UIConstants.mediumHeight,
                    FTextField(
                      controller: _graduationYearController,
                      labelText: Strings.label_graduation_year.tr(),
                      hintText: 'مثال 2025',
                      keyboardType: TextInputType.number,
                      validator: (value) => _requiredValidator(value),
                    ),
                    UIConstants.mediumHeight,
                    FTextField(
                      controller: _cvUrlController,
                      labelText: Strings.label_cv_url.tr(),
                      hintText: 'https://example.com',
                      validator: (value) => _requiredValidator(value),
                    ),
                    UIConstants.bigHeight,
                    PrimaryButtonWithProgress(
                      text: Strings.btn_continue.tr(),
                      isLoading: false,
                      onTap: () => _continue(context, lookupsState),
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

  String? _requiredValidator(String? value) {
    final text = value?.trim() ?? '';
    return text.isEmpty ? Strings.error_fill_form.tr() : null;
  }

  String _displayName(LookupItemEntity? item) {
    if (item == null) return Strings.not_available.tr();
    final name = LocalizedValueResolver.resolve(
      localeCode: context.locale.languageCode,
      arabic: item.nameAr,
      english: item.nameEn,
    );
    return name != null && name.isNotEmpty ? name : Strings.not_available.tr();
  }
}
