import 'package:easy_localization/easy_localization.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_close_reason.dart';

class ConsultationCloseReasonLocalizer {
  ConsultationCloseReasonLocalizer._();

  static String label(ConsultationCloseReason reason) {
    switch (reason) {
      case ConsultationCloseReason.legalProceduresStartedOutsidePlatform:
        return Strings.end_chat_reason_legal_procedures_started_outside_platform
            .tr();
      case ConsultationCloseReason.clientInactiveForLongTime:
        return Strings.end_chat_reason_client_inactive_for_long_time.tr();
      case ConsultationCloseReason.outsideServiceScope:
        return Strings.end_chat_reason_outside_service_scope.tr();
      case ConsultationCloseReason.conflictOfInterest:
        return Strings.end_chat_reason_conflict_of_interest.tr();
      case ConsultationCloseReason.consultationCompleted:
        return Strings.end_chat_reason_consultation_completed.tr();
    }
  }
}
