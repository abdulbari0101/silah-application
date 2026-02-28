import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/features/consultations/data/datasources/remote/consultations_remote_data_source.dart';
import 'package:silah_app/features/consultations/data/models/consultation_models.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_request_entity.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_status.dart';
import 'package:silah_app/features/consultations/domain/repositories/consultations_repository.dart';

class ConsultationsRepositoryImpl implements ConsultationsRepository {
  final ConsultationsRemoteDataSource remoteDataSource;
  final Executor executor;

  ConsultationsRepositoryImpl({
    required this.remoteDataSource,
    required this.executor,
  });

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
      final uid = remoteDataSource.currentUserId();
      if (uid == null) {
        throw const MissingDataException('Missing user id');
      }

      return remoteDataSource.fetchRequestsByUser(uid);
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
      final result = await remoteDataSource.fetchRequestById(requestId);
      return result ??
          ConsultationRequestEntity(
            id: requestId,
            status: ConsultationStatus.pending,
          );
    }, from: 'ConsultationsRepository.fetchRequestById');
  }

  Future<ConsultationRequestEntity?> _fetchByIdInternal(String requestId) async {
    try {
      return await remoteDataSource.fetchRequestById(requestId);
    } catch (_) {
      return null;
    }
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
