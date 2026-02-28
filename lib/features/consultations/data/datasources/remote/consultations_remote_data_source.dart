import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/decoders/api_json_decoder.dart';
import 'package:silah_app/core/infrastructure/network/firebase_call.dart';
import 'package:silah_app/core/infrastructure/network/firestore_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:silah_app/features/consultations/data/datasources/remote/consultations_service.dart';
import 'package:silah_app/features/consultations/data/models/consultation_models.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_request_entity.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_status.dart';

abstract class ConsultationsRemoteDataSource {
  Future<BaseApiResponse<ConsultationCreateResponseModel>> createConsultation(
    ConsultationCreateRequestModel request,
  );

  Future<BaseApiResponse<ConsultationStatusUpdateResponseModel>> updateStatus(
    String consultationId,
    ConsultationStatusUpdateRequestModel request,
  );

  Future<List<ConsultationRequestEntity>> fetchRequestsByUser(String userId);
  Future<ConsultationRequestEntity?> fetchRequestById(String requestId);
  String? currentUserId();
}

class ConsultationsRemoteDataSourceImpl implements ConsultationsRemoteDataSource {
  final ConsultationsService service;
  final AppLogger logger;
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  ConsultationsRemoteDataSourceImpl({
    required this.service,
    required this.logger,
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : firestore = firestore ?? FirebaseFirestore.instance,
        auth = auth ?? FirebaseAuth.instance;

  @override
  Future<BaseApiResponse<ConsultationCreateResponseModel>> createConsultation(
    ConsultationCreateRequestModel request,
  ) =>
      handleBaseApiResponse<ConsultationCreateResponseModel>(
        method: 'ConsultationsRemoteDataSource.createConsultation',
        logger: logger,
        call: () => service.createConsultation(request),
      );

  @override
  Future<BaseApiResponse<ConsultationStatusUpdateResponseModel>> updateStatus(
    String consultationId,
    ConsultationStatusUpdateRequestModel request,
  ) =>
      handleBaseApiResponse<ConsultationStatusUpdateResponseModel>(
        method: 'ConsultationsRemoteDataSource.updateStatus',
        logger: logger,
        call: () => service.updateStatus(consultationId, request),
      );

  @override
  Future<List<ConsultationRequestEntity>> fetchRequestsByUser(String userId) {
    return firebaseCall<List<ConsultationRequestEntity>>(
      method: 'ConsultationsRemoteDataSource.fetchRequestsByUser',
      logger: logger,
      payload: {'uid': userId},
      call: () async {
        try {
          final results = <String, ConsultationRequestEntity>{};
          final clientSnap = await firestore
              .collection('consultations')
              .where('clientUid', isEqualTo: userId)
              .get();
          for (final doc in clientSnap.docs) {
            results[doc.id] = _mapDoc(doc);
          }

          final lawyerSnap = await firestore
              .collection('consultations')
              .where('lawyerUid', isEqualTo: userId)
              .get();
          for (final doc in lawyerSnap.docs) {
            results[doc.id] = _mapDoc(doc);
          }
          return results.values.toList();
        } on FirebaseException catch (error) {
          if (error.code == 'permission-denied') {
            logger.networkError(
             tag:  'ConsultationsRemoteDataSource.fetchRequestsByUser permission denied',
              error,
            );
            return <ConsultationRequestEntity>[];
          }
          rethrow;
        }
      },
    );
  }

  @override
  Future<ConsultationRequestEntity?> fetchRequestById(String requestId) {
    return firebaseCall<ConsultationRequestEntity?>(
      method: 'ConsultationsRemoteDataSource.fetchRequestById',
      logger: logger,
      payload: {'requestId': requestId},
      call: () async {
        final doc = await firestore.collection('consultations').doc(requestId).get();
        if (!doc.exists) return null;
        return _mapDoc(doc);
      },
    );
  }

  @override
  String? currentUserId() => auth.currentUser?.uid;

  ConsultationRequestEntity _mapDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? const <String, dynamic>{};
    return ConsultationRequestEntity(
      id: doc.id,
      clientId: data['clientUid'] as String?,
      lawyerId: data['lawyerUid'] as String?,
      specializationId:
          (data['specializationId'] as String?) ?? (data['specialization'] as String?),
      description: data['caseText'] as String?,
      status: _parseStatus(data['status'] as String?) ?? ConsultationStatus.pending,
      createdAt: parseFirestoreTimestamp(data['createdAt']),
      updatedAt: parseFirestoreTimestamp(data['updatedAt']),
      closedAt: parseFirestoreTimestamp(data['closedAt']),
    );
  }

  ConsultationStatus? _parseStatus(String? value) {
    switch (value?.toLowerCase()) {
      case 'accepted':
        return ConsultationStatus.accepted;
      case 'rejected':
        return ConsultationStatus.rejected;
      case 'active':
        return ConsultationStatus.active;
      case 'closed':
        return ConsultationStatus.closed;
      case 'cancelled':
        return ConsultationStatus.cancelled;
      case 'pending':
        return ConsultationStatus.pending;
      default:
        return null;
    }
  }
}
