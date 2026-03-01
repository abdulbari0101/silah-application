import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/decoders/api_json_decoder.dart';
import 'package:silah_app/core/infrastructure/network/firebase_call.dart';
import 'package:silah_app/core/infrastructure/network/firestore_helpers.dart';
import 'package:silah_app/features/verification/data/datasources/remote/verification_service.dart';
import 'package:silah_app/features/verification/data/models/verification_models.dart';
import 'package:silah_app/features/verification/domain/entities/license_verification_entity.dart';
import 'package:silah_app/features/verification/domain/entities/verification_status.dart';

abstract class VerificationRemoteDataSource {
  Future<BaseApiResponse<VerificationResponseModel>> requestVerification(
    VerificationRequestModel request,
  );

  Future<LicenseVerificationEntity?> fetchVerificationStatus(String lawyerUid);
  String? currentUserId();
}

class VerificationRemoteDataSourceImpl implements VerificationRemoteDataSource {
  final VerificationService service;
  final AppLogger logger;
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  VerificationRemoteDataSourceImpl({
    required this.service,
    required this.logger,
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  }) : firestore = firestore ?? FirebaseFirestore.instance,
       auth = auth ?? FirebaseAuth.instance;

  @override
  Future<BaseApiResponse<VerificationResponseModel>> requestVerification(
    VerificationRequestModel request,
  ) => handleBaseApiResponse<VerificationResponseModel>(
    method: 'VerificationRemoteDataSource.requestVerification',
    logger: logger,
    call: () => service.requestVerification(request),
  );

  @override
  Future<LicenseVerificationEntity?> fetchVerificationStatus(String lawyerUid) {
    return firebaseCall<LicenseVerificationEntity?>(
      method: 'VerificationRemoteDataSource.fetchVerificationStatus',
      logger: logger,
      payload: {'uid': lawyerUid},
      call: () async {
        final doc = await firestore
            .collection('license_verifications')
            .doc(lawyerUid)
            .get();
        if (!doc.exists) return null;

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
  }

  @override
  String? currentUserId() => auth.currentUser?.uid;
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
