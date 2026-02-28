import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button.dart';

class HomeTraineePromptCard extends StatelessWidget {
  const HomeTraineePromptCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(UIConstants.mediumPadding),
      decoration: BoxDecoration(
        color: context.colors.primaryContainer.withAlphaOpacity(0.35),
        borderRadius: context.shapes.brMd,
        border: Border.all(color: context.colors.primary.withAlphaOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.trainee_prompt_title.tr(),
            style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          UIConstants.smallHeight,
          Text(
            Strings.trainee_prompt_description.tr(),
            style: context.textTheme.bodySmall?.copyWith(color: context.colors.onSurfaceVariant),
          ),
          UIConstants.mediumHeight,
          PrimaryButton(
            text: Strings.trainee_prompt_action.tr(),
            onTap: () => context.pushNamed(AppRoutes.settings.name),
          ),
        ],
      ),
    );
  }
}
