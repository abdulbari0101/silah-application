import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/action_pill_button.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/card_button.dart';
import 'package:silah_app/features/training/domain/entities/training_opportunity_entity.dart';

class TrainingOpportunityCard extends StatelessWidget {
  const TrainingOpportunityCard({
    super.key,
    required this.opportunity,
    this.onTap,
  });

  final TrainingOpportunityEntity opportunity;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final title = opportunity.title?.trim();
    final description = opportunity.description?.trim();
    final city = opportunity.city?.trim();

    return CardButton(
      onTap: onTap,
      padding: const EdgeInsets.all(UIConstants.mediumPadding),
      color: context.colors.surface,
      borderColor: context.colors.outlineVariant.withAlphaOpacity(0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title?.isNotEmpty == true ? title! : Strings.training_opportunity.tr(),
            style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          if (city != null && city.isNotEmpty) ...[
            UIConstants.xsmallHeight,
            Text(
              city,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
          ],
          if (description != null && description.isNotEmpty) ...[
            UIConstants.smallHeight,
            Text(
              description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
          ],
          UIConstants.mediumHeight,
          ActionPillButton(
            text: Strings.apply.tr(),
            icon: Icons.school_outlined,
            expand: true,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
