import 'package:dart_mappable/dart_mappable.dart';

part 'support_ticket_status.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.lowerCase)
enum SupportTicketStatus {
  open,
  inProgress,
  resolved,
  closed,
}
