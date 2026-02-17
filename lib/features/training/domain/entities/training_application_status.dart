import 'package:dart_mappable/dart_mappable.dart';

part 'training_application_status.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.lowerCase)
enum TrainingApplicationStatus {
  pending,
  accepted,
  rejected,
  cancelled,
}
