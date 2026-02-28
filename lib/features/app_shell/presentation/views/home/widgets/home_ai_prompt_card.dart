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
      borderRadius: context.shapes.brMd,
      onTap: () => context.pushNamed(AppRoutes.ai_consultation.name),
      child: Container(
        padding: const EdgeInsets.all(UIConstants.mediumPadding),
        decoration: BoxDecoration(
          color: context.colors.primaryContainer.withAlphaOpacity(0.25),
          borderRadius: context.shapes.brMd,
          border: Border.all(color: context.colors.primary.withAlphaOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    Strings.request_ai_legal_consultation.tr(),
                    style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: context.colors.primary.withAlphaOpacity(0.12),
                    borderRadius: context.shapes.brSm,
                  ),
                  child: Icon(Icons.auto_awesome, color: context.colors.primary, size: 18),
                ),
              ],
            ),
            UIConstants.smallHeight,
            Text(
              Strings.describe_issue_ai_suggests_solutions.tr(),
              style: context.textTheme.bodySmall?.copyWith(color: context.colors.onSurfaceVariant),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            UIConstants.mediumHeight,
            Row(
              children: [
                Text(
                  Strings.start_consultation_now.tr(),
                  style: context.textTheme.labelSmall?.copyWith(color: context.colors.primary),
                ),
                UIConstants.xsmallWidth,
                Icon(arrowIcon, color: context.colors.primary, size: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
