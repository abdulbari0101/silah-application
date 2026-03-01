import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button_with_progress.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/secondary_button.dart';
import 'package:silah_app/features/training/presentation/cubits/application/training_application_cubit.dart';
import 'package:silah_app/features/training/presentation/views/application_confirmation/models/training_application_confirmation_args.dart';

class TrainingApplicationConfirmationBody extends StatelessWidget {
  const TrainingApplicationConfirmationBody({super.key, required this.args});

  final TrainingApplicationConfirmationArgs args;

  @override
  Widget build(BuildContext context) {
    final application = args.application;
    final opportunity = args.opportunity;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: UIConstants.screenHorizantalPadding,
        vertical: UIConstants.bigPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.confirm_sending_training_request.tr(),
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          UIConstants.bigHeight,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: context.shapes.brLg,
              border: Border.all(
                color: context.colors.outlineVariant.withAlphaOpacity(0.3),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _infoRow(
                  context,
                  label: Strings.label_name.tr(),
                  value: application.fullName ?? Strings.not_available.tr(),
                ),
                _infoRow(
                  context,
                  label: Strings.label_university.tr(),
                  value: application.university ?? Strings.not_available.tr(),
                ),
                _infoRow(
                  context,
                  label: Strings.label_faculty.tr(),
                  value: application.faculty ?? Strings.not_available.tr(),
                ),
                _infoRow(
                  context,
                  label: Strings.label_city.tr(),
                  value: application.city ?? Strings.not_available.tr(),
                ),
                _infoRow(
                  context,
                  label: Strings.label_graduation_year.tr(),
                  value:
                      application.graduationYear?.toString() ??
                      Strings.not_available.tr(),
                ),
                _infoRow(
                  context,
                  label: Strings.label_cv_url.tr(),
                  value: application.cvUrl ?? Strings.not_available.tr(),
                ),
                if ((opportunity.title ?? '').isNotEmpty)
                  _infoRow(
                    context,
                    label: Strings.training_opportunity.tr(),
                    value: opportunity.title!,
                  ),
              ],
            ),
          ),
          UIConstants.bigHeight,
          BlocBuilder<TrainingApplicationCubit, TrainingApplicationState>(
            builder: (context, state) {
              final isLoading = state.maybeWhen(
                submitting: () => true,
                orElse: () => false,
              );
              return Column(
                children: [
                  PrimaryButtonWithProgress(
                    text: Strings.send_training_request.tr(),
                    isLoading: isLoading,
                    onTap: isLoading
                        ? null
                        : () => context.read<TrainingApplicationCubit>().submit(
                            application,
                          ),
                  ),
                  UIConstants.mediumHeight,
                  SecondaryButton(
                    text: Strings.action_cancel.tr(),
                    onTap: isLoading ? null : () => Navigator.of(context).pop(),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _infoRow(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
