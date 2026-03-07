import 'package:dart_mappable/dart_mappable.dart';

part 'consultation_status.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.lowerCase)
enum ConsultationStatus {
  pending,
  accepted,
  rejected,
  active,
  closed,
  cancelled,
}

extension ConsultationStatusX on ConsultationStatus {
  static ConsultationStatus? tryParse(String? value) {
    switch (value?.trim().toLowerCase()) {
      case 'accepted':
        return ConsultationStatus.accepted;
      case 'rejected':
        return ConsultationStatus.rejected;
      case 'active':
        return ConsultationStatus.active;
      case 'closed':
        return ConsultationStatus.closed;
      case 'cancelled':
        return ConsultationStatus.cancelled;
      case 'pending':
        return ConsultationStatus.pending;
      default:
        return null;
    }
  }

  String get apiValue => name;

  bool get allowsMessaging =>
      this == ConsultationStatus.accepted || this == ConsultationStatus.active;

  bool matchesRequestsFilter(ConsultationStatus filter) {
    switch (filter) {
      case ConsultationStatus.pending:
        return this == ConsultationStatus.pending;
      case ConsultationStatus.accepted:
        return this == ConsultationStatus.accepted ||
            this == ConsultationStatus.active;
      case ConsultationStatus.closed:
        return this == ConsultationStatus.closed ||
            this == ConsultationStatus.rejected ||
            this == ConsultationStatus.cancelled;
      case ConsultationStatus.rejected:
        return this == ConsultationStatus.rejected;
      case ConsultationStatus.active:
        return this == ConsultationStatus.active;
      case ConsultationStatus.cancelled:
        return this == ConsultationStatus.cancelled;
    }
  }
}
