import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/extensions/app_setting_context_extension.dart';

class HomeAiPromptCard extends StatelessWidget {
  const HomeAiPromptCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isRtl = context.isRTL;
    final arrowIcon = isRtl ? Icons.arrow_back : Icons.arrow_forward;

    return InkWell(
      borderRadius: context.shapes.brLg,
      onTap: () => context.pushNamed(AppRoutes.ai_consultation.name),
      child: Container(
        padding: const EdgeInsets.all(UIConstants.mediumPadding),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerLow,
          borderRadius: context.shapes.brLg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    Strings.request_ai_legal_consultation.tr(),
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: context.colors.surface,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: context.colors.outlineVariant),
                  ),
                  child: Icon(
                    Icons.auto_awesome,
                    color: context.colors.primary,
                    size: 18,
                  ),
                ),
              ],
            ),
            UIConstants.smallHeight,
            Text(
              Strings.describe_issue_ai_suggests_solutions.tr(),
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            UIConstants.mediumHeight,
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    arrowIcon,
                    color: context.colors.onPrimary,
                    size: 14,
                  ),
                ),
                UIConstants.smallWidth,
                Text(
                  Strings.start_consultation_now.tr(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
