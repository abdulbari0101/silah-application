import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/cards/custom_card.dart';
import 'package:silah_app/core/presentation/ui/widget/chips/status_chip.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_entity.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_status.dart';

class SupportTicketDetailsBody extends StatelessWidget {
  const SupportTicketDetailsBody({super.key, required this.ticket});

  final SupportTicketEntity ticket;

  @override
  Widget build(BuildContext context) {
    final subject = ticket.subject?.trim();
    final description = ticket.description?.trim();

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: UIConstants.screenHorizantalPadding,
          vertical: UIConstants.bigPadding,
        ),
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
                  StatusChip(
                    label: _statusLabel(context, ticket.status),
                    color: _statusColor(context, ticket.status),
                  ),
                ],
              ),
              if (description != null && description.isNotEmpty) ...[
                UIConstants.mediumHeight,
                Text(description, style: context.textTheme.bodySmall),
              ],
              if (ticket.createdAt != null) ...[
                UIConstants.mediumHeight,
                _infoRow(
                  context,
                  label: Strings.created_at.tr(),
                  value: ticket.createdAt!,
                ),
              ],
              if (ticket.updatedAt != null) ...[
                UIConstants.smallHeight,
                _infoRow(
                  context,
                  label: Strings.updated_at.tr(),
                  value: ticket.updatedAt!,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Text(
          '$label:',
          style: context.textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        UIConstants.smallWidth,
        Expanded(
          child: Text(
            value,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
        ),
      ],
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
