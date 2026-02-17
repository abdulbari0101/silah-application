import 'package:dart_mappable/dart_mappable.dart';

import 'verification_status.dart';

part 'license_verification_entity.mapper.dart';

@MappableClass()
class LicenseVerificationEntity with LicenseVerificationEntityMappable {
  final String? licenseNumber;
  final String? nationalId;
  final VerificationStatus status;
  final String? reviewNotes;
  final String? requestedAt;
  final String? verifiedAt;

  const LicenseVerificationEntity({
    this.licenseNumber,
    this.nationalId,
    this.status = VerificationStatus.pending,
    this.reviewNotes,
    this.requestedAt,
    this.verifiedAt,
  });
}
