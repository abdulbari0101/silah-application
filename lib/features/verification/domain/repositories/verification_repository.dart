import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/features/verification/domain/entities/license_verification_entity.dart';

abstract class VerificationRepository {
  Future<Either<Failure, LicenseVerificationEntity>> verifyLicense({
    required String licenseNumber,
    required String nationalId,
  });

  Future<Either<Failure, LicenseVerificationEntity>> fetchVerificationStatus();
}
