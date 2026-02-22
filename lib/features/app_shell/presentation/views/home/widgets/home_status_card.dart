import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class HomeStatusCard extends StatelessWidget {
  const HomeStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(UIConstants.mediumPadding),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        borderRadius: context.shapes.brMd,
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: context.colors.primary,
              borderRadius: context.shapes.brSm,
            ),
            child: Icon(
              Icons.check_rounded,
              color: context.colors.onPrimary,
              size: 22,
            ),
          ),
          UIConstants.mediumWidth,
          Expanded(
            child: Text(
              Strings.silah_helps_you_find_the_right_lawyer.tr(),
              style: context.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
