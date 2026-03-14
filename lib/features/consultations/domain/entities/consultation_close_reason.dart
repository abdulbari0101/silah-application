import 'package:dart_mappable/dart_mappable.dart';

part 'consultation_close_reason.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.snakeCase)
enum ConsultationCloseReason {
  legalProceduresStartedOutsidePlatform,
  clientInactiveForLongTime,
  outsideServiceScope,
  conflictOfInterest,
  consultationCompleted,
}

extension ConsultationCloseReasonX on ConsultationCloseReason {
  static ConsultationCloseReason? tryParse(String? value) {
    switch (value?.trim().toLowerCase()) {
      case 'legal_procedures_started_outside_platform':
        return ConsultationCloseReason.legalProceduresStartedOutsidePlatform;
      case 'client_inactive_for_long_time':
        return ConsultationCloseReason.clientInactiveForLongTime;
      case 'outside_service_scope':
        return ConsultationCloseReason.outsideServiceScope;
      case 'conflict_of_interest':
        return ConsultationCloseReason.conflictOfInterest;
      case 'consultation_completed':
        return ConsultationCloseReason.consultationCompleted;
      default:
        return null;
    }
  }

  String get apiValue {
    switch (this) {
      case ConsultationCloseReason.legalProceduresStartedOutsidePlatform:
        return 'legal_procedures_started_outside_platform';
      case ConsultationCloseReason.clientInactiveForLongTime:
        return 'client_inactive_for_long_time';
      case ConsultationCloseReason.outsideServiceScope:
        return 'outside_service_scope';
      case ConsultationCloseReason.conflictOfInterest:
        return 'conflict_of_interest';
      case ConsultationCloseReason.consultationCompleted:
        return 'consultation_completed';
    }
  }
}
