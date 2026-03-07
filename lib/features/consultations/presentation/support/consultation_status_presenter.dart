import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_status.dart';

class ConsultationStatusPresenter {
  const ConsultationStatusPresenter._();

  static String label(BuildContext context, ConsultationStatus status) {
    switch (status) {
      case ConsultationStatus.pending:
        return Strings.status_pending.tr();
      case ConsultationStatus.accepted:
        return Strings.status_accepted.tr();
      case ConsultationStatus.rejected:
        return Strings.status_rejected.tr();
      case ConsultationStatus.active:
        return Strings.status_active.tr();
      case ConsultationStatus.closed:
        return Strings.status_closed.tr();
      case ConsultationStatus.cancelled:
        return Strings.status_cancelled.tr();
    }
  }

  static Color color(BuildContext context, ConsultationStatus status) {
    switch (status) {
      case ConsultationStatus.pending:
        return context.semantic.warning;
      case ConsultationStatus.accepted:
        return context.semantic.success;
      case ConsultationStatus.rejected:
        return context.colors.error;
      case ConsultationStatus.active:
        return context.semantic.info;
      case ConsultationStatus.closed:
      case ConsultationStatus.cancelled:
        return context.colors.outlineVariant;
    }
  }

  static IconData listIcon(ConsultationStatus status) {
    switch (status) {
      case ConsultationStatus.closed:
      case ConsultationStatus.rejected:
      case ConsultationStatus.cancelled:
        return Icons.check_circle;
      case ConsultationStatus.accepted:
      case ConsultationStatus.active:
        return Icons.chat_bubble;
      case ConsultationStatus.pending:
        return Icons.chat_bubble_outline;
    }
  }
}
