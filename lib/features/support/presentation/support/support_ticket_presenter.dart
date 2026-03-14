import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_entity.dart';
import 'package:silah_app/features/support/domain/entities/support_ticket_status.dart';

class SupportTicketPresenter {
  static String title(BuildContext context, SupportTicketEntity ticket) {
    final subject = ticket.subject?.trim();
    return subject?.isNotEmpty == true ? subject! : Strings.support.tr();
  }

  static String descriptionPreview(SupportTicketEntity ticket) {
    return ticket.description?.trim() ?? '';
  }

  static String reference(SupportTicketEntity ticket) {
    final id = ticket.id?.trim();
    return id?.isNotEmpty == true ? id! : '-';
  }

  static String statusLabel(BuildContext context, SupportTicketStatus status) {
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

  static Color statusColor(BuildContext context, SupportTicketStatus status) {
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

  static String formattedDate(BuildContext context, String? rawValue) {
    final value = rawValue?.trim();
    if (value == null || value.isEmpty) {
      return '-';
    }
    final parsed = DateTime.tryParse(value);
    if (parsed == null) {
      return value;
    }
    final localeCode = context.locale.languageCode;
    return DateFormat(
      'dd MMM yyyy • hh:mm a',
      localeCode,
    ).format(parsed.toLocal());
  }

  static String reporterRoleLabel(BuildContext context, String? role) {
    switch ((role ?? '').trim().toLowerCase()) {
      case 'lawyer':
        return Strings.account_type_lawyer.tr();
      case 'admin':
        return Strings.account_type_admin.tr();
      case 'user':
      default:
        return Strings.account_type_user.tr();
    }
  }
}
