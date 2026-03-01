import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_request_entity.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_status.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/extensions/app_setting_context_extension.dart';
import 'package:silah_app/core/foundation/formatting/relative_time.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({super.key, required this.request, this.onTap});

  final ConsultationRequestEntity request;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final title = request.specializationId ?? Strings.request_consultation.tr();
    final description = request.description?.trim();
    final createdAt = formatRelativeTime(context, request.createdAt);
    final arrowIcon = context.isRTL ? Icons.arrow_back : Icons.arrow_forward;
    final statusIcon = switch (request.status) {
      ConsultationStatus.closed ||
      ConsultationStatus.rejected ||
      ConsultationStatus.cancelled =>
        Icons.check_circle,
      ConsultationStatus.accepted || ConsultationStatus.active =>
        Icons.chat_bubble,
      _ => Icons.chat_bubble_outline,
    };

    final card = Container(
      padding: const EdgeInsets.all(UIConstants.mediumPadding),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (createdAt.isNotEmpty) ...[
            Text(
              createdAt,
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
            UIConstants.xsmallHeight,
          ],
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: context.colors.surface,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  statusIcon,
                  color: context.colors.primary,
                  size: 16,
                ),
              ),
              UIConstants.smallWidth,
              Expanded(
                child: Text(
                  title,
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
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
