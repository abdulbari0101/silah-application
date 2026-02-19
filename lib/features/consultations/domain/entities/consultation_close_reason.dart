import 'package:dart_mappable/dart_mappable.dart';

part 'consultation_close_reason.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.lowerCase)
enum ConsultationCloseReason {
  completed,
  userCancelled,
  lawyerRejected,
  timeout,
  other,
}
