import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/network/firebase_call.dart';
import 'package:silah_app/core/infrastructure/network/firestore_helpers.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/features/verification/data/datasources/remote/verification_remote_data_source.dart';
import 'package:silah_app/features/verification/data/models/verification_models.dart';
import 'package:silah_app/features/verification/domain/entities/license_verification_entity.dart';
import 'package:silah_app/features/verification/domain/entities/verification_status.dart';
import 'package:silah_app/features/verification/domain/repositories/verification_repository.dart';

class VerificationRepositoryImpl implements VerificationRepository {
  final VerificationRemoteDataSource remoteDataSource;
  final Executor executor;
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  VerificationRepositoryImpl({
    required this.remoteDataSource,
    required this.executor,
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : firestore = firestore ?? FirebaseFirestore.instance,
        auth = auth ?? FirebaseAuth.instance;

  @override
  Future<Either<Failure, LicenseVerificationEntity>> verifyLicense({
    required String licenseNumber,
    required String nationalId,
  }) {
    return executor.runOnline(() async {
      final uid = auth.currentUser?.uid;
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
      final uid = auth.currentUser?.uid;
      if (uid == null) {
        throw const MissingDataException('Missing user id');
      }

      return firebaseCall<LicenseVerificationEntity>(
        method: 'VerificationRepository.fetchVerificationStatus',
        logger: executor.logger,
        call: () async {
          final doc = await firestore.collection('license_verifications').doc(uid).get();
          if (!doc.exists) {
            return const LicenseVerificationEntity(status: VerificationStatus.pending);
          }

          final data = doc.data() ?? const <String, dynamic>{};
          return LicenseVerificationEntity(
            licenseNumber: data['licenseNumber'] as String?,
            nationalId: data['nationalId'] as String?,
            status: _parseVerificationStatus(data['status'] as String?),
            reviewNotes: data['reviewNotes'] as String?,
            requestedAt: parseFirestoreTimestamp(data['requestedAt']),
            verifiedAt: parseFirestoreTimestamp(data['verifiedAt']),
          );
        },
      );
    }, from: 'VerificationRepository.fetchVerificationStatus');
  }
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
