import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/action_pill_button.dart';
import 'package:silah_app/core/presentation/ui/widget/chips/pill_chip.dart';
import 'package:silah_app/features/profiles/domain/entities/lawyer_profile_entity.dart';

class LawyerProfileDetailsCard extends StatelessWidget {
  const LawyerProfileDetailsCard({
    super.key,
    required this.lawyer,
    this.specialization,
  });

  final LawyerProfileEntity lawyer;
  final String? specialization;

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
            style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          UIConstants.smallHeight,
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _specializationChips(context),
          ),
          UIConstants.bigHeight,
          Text(
            Strings.years_of_experience.tr(),
            style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
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
            style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
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
                  onTap: null,
                ),
              ),
              UIConstants.mediumWidth,
              Expanded(
                child: ActionPillButton(
                  text: Strings.request_training.tr(),
                  icon: Icons.send_rounded,
                  expand: true,
                  onTap: null,
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
        CircleAvatar(
          radius: 28,
          backgroundColor: context.colors.surfaceContainerHighest.withAlphaOpacity(0.35),
          backgroundImage: (lawyer.avatarUrl != null && lawyer.avatarUrl!.isNotEmpty)
              ? NetworkImage(lawyer.avatarUrl!)
              : null,
          child: (lawyer.avatarUrl == null || lawyer.avatarUrl!.isEmpty)
              ? Icon(Icons.person, color: context.colors.onSurfaceVariant, size: 28)
              : null,
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
              if (lawyer.licenseNumber != null && lawyer.licenseNumber!.trim().isNotEmpty) ...[
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

  List<Widget> _specializationChips(BuildContext context) {
    final list = lawyer.legalFieldIds ?? const <String>[];
    if (list.isEmpty && specialization != null && specialization!.trim().isNotEmpty) {
      return [
        PillChip(label: specialization!.trim()),
      ];
    }
    if (list.isEmpty) {
      return [
        PillChip(
          label: Strings.not_available.tr(),
          color: context.colors.onSurfaceVariant,
          backgroundColor: context.colors.surfaceContainerHighest.withAlphaOpacity(0.3),
        ),
      ];
    }
    return list
        .where((item) => item.trim().isNotEmpty)
        .map((item) => PillChip(label: item.trim()))
        .toList();
  }
}
