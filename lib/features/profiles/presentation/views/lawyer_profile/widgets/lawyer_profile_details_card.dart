import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/action_pill_button.dart';
import 'package:silah_app/core/presentation/ui/widget/chips/pill_chip.dart';
import 'package:silah_app/core/presentation/ui/widget/image/app_remote_avatar.dart';
import 'package:silah_app/core/presentation/ui/widget/resolvers/resolved_display_widgets.dart';
import 'package:silah_app/features/profiles/domain/entities/lawyer_profile_entity.dart';

class LawyerProfileDetailsCard extends StatelessWidget {
  const LawyerProfileDetailsCard({
    super.key,
    required this.lawyer,
    this.specialization,
    this.onRequestConsultation,
    this.onRequestTraining,
  });

  final LawyerProfileEntity lawyer;
  final String? specialization;
  final VoidCallback? onRequestConsultation;
  final VoidCallback? onRequestTraining;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(22),
        boxShadow: context.shadowSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          UIConstants.bigHeight,
          Text(
            Strings.specializations.tr(),
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          UIConstants.smallHeight,
          ResolvedSpecializationNames(
            specializationIds: _specializationIds(),
            builder: (resolved) => Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _specializationChips(context, resolved),
            ),
          ),
          UIConstants.bigHeight,
          Text(
            Strings.years_of_experience.tr(),
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          UIConstants.smallHeight,
          Text(
            lawyer.yearsOfExperience?.toString() ?? Strings.not_available.tr(),
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
          UIConstants.bigHeight,
          Text(
            Strings.law_firm.tr(),
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          UIConstants.smallHeight,
          Text(
            lawyer.workplace?.trim().isNotEmpty == true
                ? lawyer.workplace!.trim()
                : Strings.not_available.tr(),
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
          UIConstants.bigHeight,
          Row(
            children: [
              Expanded(
                child: ActionPillButton(
                  text: Strings.request_consultation.tr(),
                  icon: Icons.chat_bubble_outline,
                  expand: true,
                  onTap: onRequestConsultation,
                ),
              ),
              UIConstants.mediumWidth,
              Expanded(
                child: ActionPillButton(
                  text: Strings.request_training.tr(),
                  icon: Icons.send_rounded,
                  expand: true,
                  onTap: onRequestTraining,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        AppRemoteAvatar(
          radius: 28,
          imageUrl: lawyer.avatarUrl,
          label: lawyer.fullName,
          variant: AppAvatarVariant.lawyer,
          backgroundColor: context.colors.surfaceContainerHighest
              .withAlphaOpacity(0.35),
          foregroundColor: context.colors.onSurfaceVariant,
        ),
        UIConstants.mediumWidth,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lawyer.fullName ?? Strings.not_available.tr(),
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (lawyer.licenseNumber != null &&
                  lawyer.licenseNumber!.trim().isNotEmpty) ...[
                UIConstants.xsmallHeight,
                Text(
                  '${Strings.license_number.tr()} ${lawyer.licenseNumber}',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  List<String> _specializationIds() {
    final ids = lawyer.legalFieldIds ?? const <String>[];
    return ids.where((item) => item.trim().isNotEmpty).toList();
  }

  List<Widget> _specializationChips(
    BuildContext context,
    List<String> resolved,
  ) {
    final names =
        lawyer.legalFields
            ?.map((item) => item.trim())
            .where((item) => item.isNotEmpty)
            .toList() ??
        const <String>[];
    if (names.isNotEmpty) {
      return names.map((item) => PillChip(label: item)).toList();
    }

    if (resolved.isEmpty &&
        specialization != null &&
        specialization!.trim().isNotEmpty) {
      return [PillChip(label: specialization!.trim())];
    }
    if (resolved.isEmpty) {
      return [
        PillChip(
          label: Strings.not_available.tr(),
          color: context.colors.onSurfaceVariant,
          backgroundColor: context.colors.surfaceContainerHighest
              .withAlphaOpacity(0.3),
        ),
      ];
    }
    return resolved.map((item) => PillChip(label: item)).toList();
  }
}
