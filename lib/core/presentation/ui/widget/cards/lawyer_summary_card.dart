import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/card_button.dart';
import 'package:silah_app/core/presentation/ui/widget/image/app_remote_avatar.dart';

class LawyerSummaryCard extends StatelessWidget {
  const LawyerSummaryCard({
    super.key,
    required this.name,
    this.specialization,
    this.experienceLabel,
    this.avatarUrl,
    this.actions,
    this.onTap,
    this.officeName,
  });

  final String name;
  final String? specialization;
  final String? experienceLabel;
  final String? avatarUrl;
  final List<Widget>? actions;
  final VoidCallback? onTap;
  final String? officeName;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(18);

    return Container(
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: context.shadowSoft,
      ),
      child: CardButton(
        onTap: onTap,
        color: context.colors.primaryContainer.withAlphaOpacity(0.2),
        borderRadius: radius,
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (specialization != null &&
                          specialization!.trim().isNotEmpty) ...[
                        UIConstants.xsmallHeight,
                        Text(
                          specialization!,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                      if (experienceLabel != null &&
                          experienceLabel!.trim().isNotEmpty) ...[
                        UIConstants.xsmallHeight,
                        Text(
                          experienceLabel!,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                      if (officeName != null &&
                          officeName!.trim().isNotEmpty) ...[
                        UIConstants.xsmallHeight,
                        Text(
                          officeName!,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                AppRemoteAvatar(
                  radius: 20,
                  imageUrl: avatarUrl,
                  label: name,
                  variant: AppAvatarVariant.lawyer,
                  backgroundColor: context.colors.surface,
                  foregroundColor: context.colors.primary,
                ),
              ],
            ),
            if (actions != null && actions!.isNotEmpty) ...[
              UIConstants.mediumHeight,
              Row(
                children: actions!
                    .map(
                      (action) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: action,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
