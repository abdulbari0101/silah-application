import 'package:dart_mappable/dart_mappable.dart';

part 'availability_status.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.lowerCase)
enum AvailabilityStatus {
  available,
  busy,
  unavailable,
}
