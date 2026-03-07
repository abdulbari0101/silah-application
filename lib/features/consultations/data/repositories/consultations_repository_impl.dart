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
      final clientId = request.clientId?.trim();
      final lawyerId = request.lawyerId?.trim();
      final description = request.description?.trim();
      final specializationId = request.specializationId?.trim();

      if (clientId == null || clientId.isEmpty) {
        throw const MissingDataException('Missing clientId');
      }
      if (lawyerId == null || lawyerId.isEmpty) {
        throw const MissingDataException('Missing lawyerId');
      }
      if (description == null || description.isEmpty) {
        throw const MissingDataException('Missing case description');
      }

      final preparedRequest = request.copyWith(
        clientId: clientId,
        lawyerId: lawyerId,
        description: description,
        specializationId: specializationId?.isNotEmpty == true
            ? specializationId
            : null,
        status: ConsultationStatus.pending,
      );
      final response = await remoteDataSource.createConsultation(
        ConsultationCreateRequestModel.fromEntity(preparedRequest),
      );

      final consultationId = response.consultationId;
      if (consultationId == null || consultationId.isEmpty) {
        return preparedRequest;
      }

      final fetched = await _fetchByIdInternal(consultationId);
      return fetched ?? preparedRequest.copyWith(id: consultationId);
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
      final resolvedRequestId = requestId.trim();
      if (resolvedRequestId.isEmpty) {
        throw const MissingDataException('Missing request id');
      }
      final response = await remoteDataSource.updateStatus(
        resolvedRequestId,
        ConsultationStatusUpdateRequestModel.fromStatus(status),
      );
      final resolved = ConsultationStatusX.tryParse(response.status) ?? status;

      final fetched = await _fetchByIdInternal(resolvedRequestId);
      return fetched ??
          ConsultationRequestEntity(id: resolvedRequestId, status: resolved);
    }, from: 'ConsultationsRepository.updateRequestStatus');
  }

  @override
  Future<Either<Failure, ConsultationRequestEntity>> fetchRequestById(
    String requestId,
  ) {
    return executor.runOnline(() async {
      final resolvedRequestId = requestId.trim();
      if (resolvedRequestId.isEmpty) {
        throw const MissingDataException('Missing request id');
      }
      final result = await remoteDataSource.fetchRequestById(resolvedRequestId);
      return result ??
          ConsultationRequestEntity(
            id: resolvedRequestId,
            status: ConsultationStatus.pending,
          );
    }, from: 'ConsultationsRepository.fetchRequestById');
  }

  Future<ConsultationRequestEntity?> _fetchByIdInternal(
    String requestId,
  ) async {
    try {
      return await remoteDataSource.fetchRequestById(requestId);
    } catch (_) {
      return null;
    }
  }
}
