import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/foundation/formatting/relative_time.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/extensions/app_setting_context_extension.dart';
import 'package:silah_app/features/training/domain/entities/training_application_entity.dart';

enum TraineeCardVariant { detailed, compact }

class TraineeApplicationCard extends StatelessWidget {
  const TraineeApplicationCard({
    super.key,
    required this.application,
    required this.isUpdating,
    this.variant = TraineeCardVariant.detailed,
    this.onTap,
  });

  final TrainingApplicationEntity application;
  final bool isUpdating;
  final TraineeCardVariant variant;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final name = application.fullName?.trim().isNotEmpty == true
        ? application.fullName!.trim()
        : Strings.user.tr();
    final university = application.university?.trim();
    final city = application.city?.trim();
    final submittedAt = formatRelativeTime(context, application.submittedAt);
    final arrowIcon = context.isRTL ? Icons.arrow_back : Icons.arrow_forward;

    final card = Container(
      padding: const EdgeInsets.all(UIConstants.mediumPadding),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(18),
      ),
      child: variant == TraineeCardVariant.compact
          ? Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: context.colors.surface,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.chat_bubble_outline,
                    color: context.colors.primary,
                    size: 16,
                  ),
                ),
                UIConstants.smallWidth,
                Expanded(
                  child: Text(
                    name,
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (submittedAt.isNotEmpty) ...[
                  Text(
                    submittedAt,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                  UIConstants.xsmallHeight,
                ],
                Text(
                  '${Strings.label_name.tr()} $name',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (university != null && university.isNotEmpty) ...[
                  UIConstants.smallHeight,
                  Text(
                    '${Strings.label_university.tr()} $university',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                ],
                if (city != null && city.isNotEmpty) ...[
                  UIConstants.smallHeight,
                  Text(
                    '${Strings.label_city.tr()} $city',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                ],
                if (application.graduationYear != null) ...[
                  UIConstants.smallHeight,
                  Text(
                    '${Strings.label_graduation_year.tr()} ${application.graduationYear}',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                ],
                UIConstants.smallHeight,
                Row(
                  children: [
                    Text(
                      Strings.view_details.tr(),
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    UIConstants.xsmallWidth,
                    Icon(arrowIcon, color: context.colors.primary, size: 16),
                  ],
                ),
              ],
            ),
    );

    if (onTap == null) return card;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: card,
    );
  }
}
