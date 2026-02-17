import 'package:dart_mappable/dart_mappable.dart';

part 'verification_status.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.lowerCase)
enum VerificationStatus {
  pending,
  verified,
  rejected,
  needsReview,
}
