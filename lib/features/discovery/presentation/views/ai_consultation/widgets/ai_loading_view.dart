import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/features/discovery/presentation/views/ai_consultation/widgets/ai_badge_icon.dart';

class AiLoadingView extends StatelessWidget {
  const AiLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AiBadgeIcon(size: 96),
          UIConstants.mediumHeight,
          SizedBox(
            width: 42,
            height: 42,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: context.colors.primary,
            ),
          ),
          UIConstants.bigHeight,
          Text(
            Strings.silah_helps_you_find_the_right_lawyer.tr(),
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
