import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/cards/custom_card.dart';
import 'package:silah_app/core/presentation/ui/widget/chips/status_chip.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_entity.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_status.dart';

class SupportTicketCard extends StatelessWidget {
  const SupportTicketCard({super.key, required this.ticket, this.onTap});

  final SupportTicketEntity ticket;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final subject = ticket.subject?.trim();
    final description = ticket.description?.trim();
    final label = _statusLabel(context, ticket.status);
    final color = _statusColor(context, ticket.status);

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
                    subject?.isNotEmpty == true
                        ? subject!
                        : Strings.support.tr(),
                    style: context.textTheme.titleSmall,
                  ),
                ),
                StatusChip(label: label, color: color),
              ],
            ),
            if (description != null && description.isNotEmpty) ...[
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
            if (ticket.createdAt != null) ...[
              UIConstants.smallHeight,
              Text(
                ticket.createdAt!,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _statusLabel(BuildContext context, SupportTicketStatus status) {
    switch (status) {
      case SupportTicketStatus.open:
        return Strings.status_open.tr();
      case SupportTicketStatus.inProgress:
        return Strings.status_in_progress.tr();
      case SupportTicketStatus.resolved:
        return Strings.status_resolved.tr();
      case SupportTicketStatus.closed:
        return Strings.status_closed.tr();
    }
  }

  Color _statusColor(BuildContext context, SupportTicketStatus status) {
    switch (status) {
      case SupportTicketStatus.open:
        return context.semantic.info;
      case SupportTicketStatus.inProgress:
        return context.semantic.warning;
      case SupportTicketStatus.resolved:
        return context.semantic.success;
      case SupportTicketStatus.closed:
        return context.colors.outlineVariant;
    }
  }
}
