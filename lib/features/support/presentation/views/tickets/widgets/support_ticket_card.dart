import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/cards/custom_card.dart';
import 'package:silah_app/core/presentation/ui/widget/chips/status_chip.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_entity.dart';
import 'package:silah_app/features/support/presentation/support/support_ticket_presenter.dart';

class SupportTicketCard extends StatelessWidget {
  const SupportTicketCard({
    super.key,
    required this.ticket,
    this.onTap,
    this.showReporterInfo = false,
  });

  final SupportTicketEntity ticket;
  final VoidCallback? onTap;
  final bool showReporterInfo;

  @override
  Widget build(BuildContext context) {
    final title = SupportTicketPresenter.title(context, ticket);
    final description = SupportTicketPresenter.descriptionPreview(ticket);
    final reference = SupportTicketPresenter.reference(ticket);
    final createdAt = SupportTicketPresenter.formattedDate(
      context,
      ticket.createdAt,
    );
    final label = SupportTicketPresenter.statusLabel(context, ticket.status);
    final color = SupportTicketPresenter.statusColor(context, ticket.status);
    final reporterRole = showReporterInfo
        ? SupportTicketPresenter.reporterRoleLabel(context, ticket.reporterRole)
        : null;

    return InkWell(
      onTap: onTap,
      borderRadius: context.shapes.brLg,
      child: CustomCard(
        innerWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                StatusChip(label: label, color: color),
              ],
            ),
            if (description.isNotEmpty) ...[
              UIConstants.smallHeight,
              Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
            ],
            UIConstants.mediumHeight,
            Wrap(
              spacing: UIConstants.mediumPadding,
              runSpacing: UIConstants.smallPadding,
              children: [
                _buildMetaText(
                  context,
                  label: Strings.reference_number.tr(),
                  value: reference,
                ),
                _buildMetaText(
                  context,
                  label: Strings.created_at.tr(),
                  value: createdAt,
                ),
                if (showReporterInfo && reporterRole != null)
                  _buildMetaText(
                    context,
                    label: Strings.support_reporter_role.tr(),
                    value: reporterRole,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetaText(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$label: ',
            style: context.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: value,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
