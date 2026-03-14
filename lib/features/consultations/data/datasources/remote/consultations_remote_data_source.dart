import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/decoders/api_json_decoder.dart';
import 'package:silah_app/core/infrastructure/network/firebase_call.dart';
import 'package:silah_app/core/infrastructure/network/firestore_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:silah_app/features/consultations/data/datasources/remote/consultations_service.dart';
import 'package:silah_app/features/consultations/data/models/consultation_models.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_close_reason.dart';
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
  Stream<List<ConsultationRequestEntity>> watchRequestsByUser(String userId);
  Future<ConsultationRequestEntity?> fetchRequestById(String requestId);
  Stream<ConsultationRequestEntity?> watchRequestById(String requestId);
  String? currentUserId();
}

class ConsultationsRemoteDataSourceImpl
    implements ConsultationsRemoteDataSource {
  static const String _consultationsCollection = 'consultations';

  final ConsultationsService service;
  final AppLogger logger;
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  ConsultationsRemoteDataSourceImpl({
    required this.service,
    required this.logger,
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  }) : firestore = firestore ?? FirebaseFirestore.instance,
       auth = auth ?? FirebaseAuth.instance;

  @override
  Future<BaseApiResponse<ConsultationCreateResponseModel>> createConsultation(
    ConsultationCreateRequestModel request,
  ) => handleBaseApiResponse<ConsultationCreateResponseModel>(
    method: 'ConsultationsRemoteDataSource.createConsultation',
    logger: logger,
    call: () => service.createConsultation(request),
  );

  @override
  Future<BaseApiResponse<ConsultationStatusUpdateResponseModel>> updateStatus(
    String consultationId,
    ConsultationStatusUpdateRequestModel request,
  ) => handleBaseApiResponse<ConsultationStatusUpdateResponseModel>(
    method: 'ConsultationsRemoteDataSource.updateStatus',
    logger: logger,
    call: () => service.updateStatus(consultationId, request),
  );

  @override
  Future<List<ConsultationRequestEntity>> fetchRequestsByUser(String userId) {
    final resolvedUserId = userId.trim();
    return firebaseCall<List<ConsultationRequestEntity>>(
      method: 'ConsultationsRemoteDataSource.fetchRequestsByUser',
      logger: logger,
      payload: {'uid': resolvedUserId},
      call: () async {
        try {
          final results = <String, ConsultationRequestEntity>{};
          final snapshots = await Future.wait([
            _fetchRequestsByField('clientUid', resolvedUserId),
            _fetchRequestsByField('lawyerUid', resolvedUserId),
          ]);
          for (final snapshot in snapshots) {
            for (final doc in snapshot.docs) {
              results[doc.id] = _mapDoc(doc);
            }
          }
          return results.values.toList();
        } on FirebaseException catch (error) {
          if (error.code == 'permission-denied') {
            logger.networkError(
              tag:
                  'ConsultationsRemoteDataSource.fetchRequestsByUser permission denied',
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
  Stream<List<ConsultationRequestEntity>> watchRequestsByUser(String userId) {
    final resolvedUserId = userId.trim();
    final clientStream = _watchRequestsByField('clientUid', resolvedUserId);
    final lawyerStream = _watchRequestsByField('lawyerUid', resolvedUserId);

    return Rx.combineLatest2<
      QuerySnapshot<Map<String, dynamic>>,
      QuerySnapshot<Map<String, dynamic>>,
      List<ConsultationRequestEntity>
    >(clientStream, lawyerStream, (clientSnapshot, lawyerSnapshot) {
      final results = <String, ConsultationRequestEntity>{};

      for (final snapshot in [clientSnapshot, lawyerSnapshot]) {
        for (final doc in snapshot.docs) {
          results[doc.id] = _mapDoc(doc);
        }
      }

      final items = results.values.toList();
      items.sort((a, b) {
        final left = a.updatedAt ?? a.createdAt ?? '';
        final right = b.updatedAt ?? b.createdAt ?? '';
        return right.compareTo(left);
      });
      return items;
    });
  }

  @override
  Future<ConsultationRequestEntity?> fetchRequestById(String requestId) {
    final resolvedRequestId = requestId.trim();
    return firebaseCall<ConsultationRequestEntity?>(
      method: 'ConsultationsRemoteDataSource.fetchRequestById',
      logger: logger,
      payload: {'requestId': resolvedRequestId},
      call: () async {
        final doc = await firestore
            .collection(_consultationsCollection)
            .doc(resolvedRequestId)
            .get();
        if (!doc.exists) return null;
        return _mapDoc(doc);
      },
    );
  }

  @override
  Stream<ConsultationRequestEntity?> watchRequestById(String requestId) {
    final resolvedRequestId = requestId.trim();
    return firestore
        .collection(_consultationsCollection)
        .doc(resolvedRequestId)
        .snapshots()
        .map((doc) => doc.exists ? _mapDoc(doc) : null);
  }

  @override
  String? currentUserId() => auth.currentUser?.uid;

  ConsultationRequestEntity _mapDoc(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? const <String, dynamic>{};
    return ConsultationRequestEntity(
      id: doc.id,
      clientId: data['clientUid'] as String?,
      lawyerId: data['lawyerUid'] as String?,
      specializationId:
          (data['specializationId'] as String?) ??
          (data['specialization'] as String?),
      description: data['caseText'] as String?,
      status:
          ConsultationStatusX.tryParse(data['status'] as String?) ??
          ConsultationStatus.pending,
      closeReason: ConsultationCloseReasonX.tryParse(
        data['closeReason'] as String?,
      ),
      createdAt: parseFirestoreTimestamp(data['createdAt']),
      updatedAt: parseFirestoreTimestamp(data['updatedAt']),
      closedAt: parseFirestoreTimestamp(data['closedAt']),
    );
  }

  Future<QuerySnapshot<Map<String, dynamic>>> _fetchRequestsByField(
    String field,
    String value,
  ) {
    return firestore
        .collection(_consultationsCollection)
        .where(field, isEqualTo: value)
        .get();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> _watchRequestsByField(
    String field,
    String value,
  ) {
    return firestore
        .collection(_consultationsCollection)
        .where(field, isEqualTo: value)
        .snapshots();
  }
}
