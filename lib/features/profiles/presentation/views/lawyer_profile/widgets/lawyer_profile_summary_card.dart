import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/presentation/ui/widget/resolvers/resolved_display_widgets.dart';
import 'package:silah_app/core/presentation/ui/widget/cards/lawyer_summary_card.dart';
import 'package:silah_app/features/profiles/domain/entities/lawyer_profile_entity.dart';

class LawyerProfileSummaryCard extends StatelessWidget {
  const LawyerProfileSummaryCard({
    super.key,
    required this.lawyer,
    this.specialization,
  });

  final LawyerProfileEntity lawyer;
  final String? specialization;

  @override
  Widget build(BuildContext context) {
    return ResolvedSpecializationNames(
      specializationIds: lawyer.legalFieldIds,
      builder: (resolved) => LawyerSummaryCard(
        name: lawyer.fullName ?? Strings.not_available.tr(),
        specialization: _specializationSummary(resolved),
        experienceLabel: _experienceLabel(),
        avatarUrl: lawyer.avatarUrl,
      ),
    );
  }

  String? _specializationSummary(List<String> resolved) {
    if (specialization != null && specialization!.trim().isNotEmpty) {
      return specialization;
    }
    final list =
        lawyer.legalFields?.where((item) => item.trim().isNotEmpty).toList() ??
        resolved;
    if (list.isEmpty) return null;
    return list.take(2).join(' • ');
  }

  String? _experienceLabel() {
    final years = lawyer.yearsOfExperience;
    if (years == null) return null;
    return '${Strings.years_of_experience.tr()} • $years';
  }
}
