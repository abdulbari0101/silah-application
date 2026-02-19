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
