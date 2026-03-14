import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_close_reason.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_request_entity.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_status.dart';

abstract class ConsultationsRepository {
  Future<Either<Failure, ConsultationRequestEntity>> createRequest(
    ConsultationRequestEntity request,
  );

  Future<Either<Failure, List<ConsultationRequestEntity>>> fetchMyRequests();

  Stream<List<ConsultationRequestEntity>> watchMyRequests();

  Future<Either<Failure, ConsultationRequestEntity>> updateRequestStatus(
    String requestId,
    ConsultationStatus status, {
    ConsultationCloseReason? closeReason,
  });

  Future<Either<Failure, ConsultationRequestEntity>> fetchRequestById(
    String requestId,
  );
}
