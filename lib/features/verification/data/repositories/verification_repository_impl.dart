import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/features/verification/data/datasources/remote/verification_remote_data_source.dart';
import 'package:silah_app/features/verification/data/models/verification_models.dart';
import 'package:silah_app/features/verification/domain/entities/license_verification_entity.dart';
import 'package:silah_app/features/verification/domain/entities/verification_status.dart';
import 'package:silah_app/features/verification/domain/repositories/verification_repository.dart';

class VerificationRepositoryImpl implements VerificationRepository {
  final VerificationRemoteDataSource remoteDataSource;
  final Executor executor;

  VerificationRepositoryImpl({
    required this.remoteDataSource,
    required this.executor,
  });

  @override
  Future<Either<Failure, LicenseVerificationEntity>> verifyLicense({
    required String licenseNumber,
    required String nationalId,
  }) {
    return executor.runOnline(() async {
      final uid = remoteDataSource.currentUserId();
      if (uid == null) {
        throw const MissingDataException('Missing user id');
      }

      final response = await remoteDataSource.requestVerification(
        VerificationRequestModel(
          licenseNumber: licenseNumber,
          nationalId: nationalId,
          lawyerUid: uid,
        ),
      );

      return LicenseVerificationEntity(
        licenseNumber: licenseNumber,
        nationalId: nationalId,
        status: _parseVerificationStatus(response.status),
      );
    }, from: 'VerificationRepository.verifyLicense');
  }

  @override
  Future<Either<Failure, LicenseVerificationEntity>> fetchVerificationStatus() {
    return executor.runOnline(() async {
      final uid = remoteDataSource.currentUserId();
      if (uid == null) {
        throw const MissingDataException('Missing user id');
      }

      final result = await remoteDataSource.fetchVerificationStatus(uid);
      return result ??
          const LicenseVerificationEntity(status: VerificationStatus.pending);
    }, from: 'VerificationRepository.fetchVerificationStatus');
  }

  VerificationStatus _parseVerificationStatus(String? value) {
    switch (value?.toLowerCase()) {
      case 'verified':
        return VerificationStatus.verified;
      case 'rejected':
        return VerificationStatus.rejected;
      case 'needsreview':
      case 'needs_review':
        return VerificationStatus.needsReview;
      case 'pending':
      default:
        return VerificationStatus.pending;
    }
  }
}
