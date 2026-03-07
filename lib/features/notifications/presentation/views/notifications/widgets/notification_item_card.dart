import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/cards/custom_card.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_entity.dart';
import 'package:silah_app/features/notifications/presentation/support/notification_timestamp_presenter.dart';

class NotificationItemCard extends StatelessWidget {
  const NotificationItemCard({super.key, required this.notification});

  final NotificationEntity notification;

  @override
  Widget build(BuildContext context) {
    final title = notification.title?.trim();
    final message = notification.message?.trim();
    final timestamp = NotificationTimestampPresenter.format(
      context,
      notification,
    );

    return CustomCard(
      innerWidget: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: notification.isSeen
                  ? context.colors.outlineVariant
                  : context.colors.primary,
              shape: BoxShape.circle,
            ),
          ),
          UIConstants.smallWidth,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title?.isNotEmpty == true
                      ? title!
                      : Strings.notification.tr(),
                  style: context.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (message != null && message.isNotEmpty) ...[
                  UIConstants.xsmallHeight,
                  Text(
                    message,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                ],
                if (timestamp != null) ...[
                  UIConstants.xsmallHeight,
                  Text(
                    timestamp,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colors.outline,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
