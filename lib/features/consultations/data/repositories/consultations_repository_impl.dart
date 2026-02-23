import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/network/firebase_call.dart';
import 'package:silah_app/core/infrastructure/network/firestore_helpers.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/features/consultations/data/datasources/remote/consultations_remote_data_source.dart';
import 'package:silah_app/features/consultations/data/models/consultation_models.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_request_entity.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_status.dart';
import 'package:silah_app/features/consultations/domain/repositories/consultations_repository.dart';

class ConsultationsRepositoryImpl implements ConsultationsRepository {
  final ConsultationsRemoteDataSource remoteDataSource;
  final Executor executor;
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  ConsultationsRepositoryImpl({
    required this.remoteDataSource,
    required this.executor,
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : firestore = firestore ?? FirebaseFirestore.instance,
        auth = auth ?? FirebaseAuth.instance;

  @override
  Future<Either<Failure, ConsultationRequestEntity>> createRequest(
    ConsultationRequestEntity request,
  ) {
    return executor.runOnline(() async {
      if (request.clientId == null || request.clientId!.isEmpty) {
        throw const MissingDataException('Missing clientId');
      }
      if (request.lawyerId == null || request.lawyerId!.isEmpty) {
        throw const MissingDataException('Missing lawyerId');
      }
      if (request.description == null || request.description!.isEmpty) {
        throw const MissingDataException('Missing case description');
      }

      final response = await remoteDataSource.createConsultation(
        ConsultationCreateRequestModel(
          clientUid: request.clientId!,
          lawyerUid: request.lawyerId!,
          caseText: request.description!,
          specializationId: request.specializationId,
          specialization: request.specializationId,
        ),
      );

      final consultationId = response.consultationId;
      if (consultationId == null || consultationId.isEmpty) {
        return request;
      }

      final fetched = await _fetchByIdInternal(consultationId);
      return fetched ??
          request.copyWith(id: consultationId, status: ConsultationStatus.pending);
    }, from: 'ConsultationsRepository.createRequest');
  }

  @override
  Future<Either<Failure, List<ConsultationRequestEntity>>> fetchMyRequests() {
    return executor.runOnline(() async {
      final uid = auth.currentUser?.uid;
      if (uid == null) {
        throw const MissingDataException('Missing user id');
      }

      return firebaseCall<List<ConsultationRequestEntity>>(
        method: 'ConsultationsRepository.fetchMyRequests',
        logger: executor.logger,
        payload: {'uid': uid},
        call: () async {
          final results = <String, ConsultationRequestEntity>{};
          final clientSnap =
              await firestore.collection('consultations').where('clientUid', isEqualTo: uid).get();
          for (final doc in clientSnap.docs) {
            results[doc.id] = _mapDoc(doc);
          }

          final lawyerSnap =
              await firestore.collection('consultations').where('lawyerUid', isEqualTo: uid).get();
          for (final doc in lawyerSnap.docs) {
            results[doc.id] = _mapDoc(doc);
          }
          return results.values.toList();
        },
      );
    }, from: 'ConsultationsRepository.fetchMyRequests');
  }

  @override
  Future<Either<Failure, ConsultationRequestEntity>> updateRequestStatus(
    String requestId,
    ConsultationStatus status,
  ) {
    return executor.runOnline(() async {
      final response = await remoteDataSource.updateStatus(
        requestId,
        ConsultationStatusUpdateRequestModel.fromStatus(status),
      );
      final resolved = _parseStatus(response.status) ?? status;

      final fetched = await _fetchByIdInternal(requestId);
      return fetched ?? ConsultationRequestEntity(id: requestId, status: resolved);
    }, from: 'ConsultationsRepository.updateRequestStatus');
  }

  @override
  Future<Either<Failure, ConsultationRequestEntity>> fetchRequestById(String requestId) {
    return executor.runOnline(() async {
      final result = await firebaseCall<ConsultationRequestEntity?>(
        method: 'ConsultationsRepository.fetchRequestById',
        logger: executor.logger,
        payload: {'requestId': requestId},
        call: () async {
          final doc = await firestore.collection('consultations').doc(requestId).get();
          if (!doc.exists) return null;
          return _mapDoc(doc);
        },
      );
      return result ??
          ConsultationRequestEntity(
            id: requestId,
            status: ConsultationStatus.pending,
          );
    }, from: 'ConsultationsRepository.fetchRequestById');
  }

  Future<ConsultationRequestEntity?> _fetchByIdInternal(String requestId) async {
    try {
      return await firebaseCall<ConsultationRequestEntity?>(
        method: 'ConsultationsRepository._fetchByIdInternal',
        logger: executor.logger,
        payload: {'requestId': requestId},
        call: () async {
          final doc = await firestore.collection('consultations').doc(requestId).get();
          if (!doc.exists) return null;
          return _mapDoc(doc);
        },
      );
    } catch (_) {
      return null;
    }
  }

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
      case 'closed':
        return ConsultationStatus.closed;
      case 'pending':
        return ConsultationStatus.pending;
      default:
        return null;
    }
  }
}
