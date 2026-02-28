import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/action_pill_button.dart';
import 'package:silah_app/core/presentation/ui/widget/cards/lawyer_summary_card.dart';
import 'package:silah_app/features/profiles/domain/entities/lawyer_profile_entity.dart';

class LawyerResultCard extends StatelessWidget {
  const LawyerResultCard({
    super.key,
    required this.lawyer,
    required this.specializationLabel,
  });

  final LawyerProfileEntity lawyer;
  final String? specializationLabel;

  @override
  Widget build(BuildContext context) {
    final years = lawyer.yearsOfExperience;
    final experienceLabel = (years == null)
        ? null
        : '${Strings.years_of_experience.tr()} • $years';

    return LawyerSummaryCard(
      name: lawyer.fullName ?? Strings.not_available.tr(),
      specialization: specializationLabel,
      experienceLabel: experienceLabel,
      avatarUrl: lawyer.avatarUrl,
      actions: [
        ActionPillButton(
          text: Strings.request_consultation.tr(),
          icon: Icons.chat_bubble_outline,
          expand: true,
          onTap: null,
        ),
        ActionPillButton(
          text: Strings.view_profile.tr(),
          icon: Icons.person_outline,
          expand: true,
          onTap: () {
            context.pushNamed(
              AppRoutes.lawyerProfile.name,
              extra: {
                'lawyer': lawyer,
                'specialization': specializationLabel,
              },
            );
          },
        ),
      ],
    );
  }
}
