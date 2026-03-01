import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/extensions/app_setting_context_extension.dart';

class HomeStatusCard extends StatelessWidget {
  const HomeStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    final arrowIcon = context.isRTL ? Icons.arrow_back : Icons.arrow_forward;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.active_cases.tr(),
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        UIConstants.smallHeight,
        InkWell(
          borderRadius: context.shapes.brLg,
          onTap: () => context.pushNamed(AppRoutes.requests.name),
          child: Container(
            padding: const EdgeInsets.all(UIConstants.mediumPadding),
            decoration: BoxDecoration(
              color: context.colors.surfaceContainerLow,
              borderRadius: context.shapes.brLg,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        arrowIcon,
                        color: context.colors.onPrimary,
                        size: 16,
                      ),
                      UIConstants.xsmallWidth,
                      Text(
                        Strings.consultation_personal_status.tr(),
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colors.onPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                UIConstants.mediumHeight,
                Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
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
                        Strings.view_details.tr(),
                        style: context.textTheme.labelMedium?.copyWith(
                          color: context.colors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: context.colors.surface,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person_outline,
                        color: context.colors.onSurfaceVariant,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
