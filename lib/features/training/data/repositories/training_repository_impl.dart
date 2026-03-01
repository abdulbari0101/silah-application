import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/features/training/data/datasources/remote/training_remote_data_source.dart';
import 'package:silah_app/features/training/data/models/training_models.dart';
import 'package:silah_app/features/training/domain/entities/training_application_entity.dart';
import 'package:silah_app/features/training/domain/entities/training_application_status.dart';
import 'package:silah_app/features/training/domain/entities/training_opportunity_entity.dart';
import 'package:silah_app/features/training/domain/repositories/training_repository.dart';

class TrainingRepositoryImpl implements TrainingRepository {
  final TrainingRemoteDataSource remoteDataSource;
  final Executor executor;

  TrainingRepositoryImpl({
    required this.remoteDataSource,
    required this.executor,
  });

  @override
  Future<Either<Failure, List<TrainingOpportunityEntity>>> fetchOpportunities({
    String? lawyerUid,
  }) {
    return executor.runOnline(() async {
      return remoteDataSource.fetchOpportunities(lawyerUid: lawyerUid);
    }, from: 'TrainingRepository.fetchOpportunities');
  }

  @override
  Future<Either<Failure, TrainingApplicationEntity>> submitApplication(
    TrainingApplicationEntity application,
  ) {
    return executor.runOnline(() async {
      final uid = application.traineeId ?? remoteDataSource.currentUserId();
      if (uid == null) {
        throw const MissingDataException('Missing trainee id');
      }
      if (application.opportunityId == null || application.opportunityId!.isEmpty) {
        throw const MissingDataException('Missing opportunityId');
      }
      if (application.cvUrl == null || application.cvUrl!.isEmpty) {
        throw const MissingDataException('Missing CV URL');
      }

      final response = await remoteDataSource.createApplication(
        TrainingApplicationCreateRequestModel(
          opportunityId: application.opportunityId!,
          traineeUid: uid,
          cvUrl: application.cvUrl!,
          fullName: application.fullName,
          university: application.university,
          faculty: application.faculty,
          cityId: application.cityId ?? application.city,
          areaId: application.areaId,
          graduationYear: application.graduationYear,
        ),
      );

      final applicationId = response.applicationId;
      return TrainingApplicationEntity(
        id: applicationId,
        opportunityId: application.opportunityId,
        traineeId: uid,
        fullName: application.fullName,
        university: application.university,
        faculty: application.faculty,
        cityId: application.cityId,
        areaId: application.areaId,
        graduationYear: application.graduationYear,
        cvUrl: application.cvUrl,
        status: TrainingApplicationStatus.pending,
      );
    }, from: 'TrainingRepository.submitApplication');
  }

  @override
  Future<Either<Failure, List<TrainingApplicationEntity>>> fetchMyApplications() {
    return executor.runOnline(() async {
      final uid = remoteDataSource.currentUserId();
      if (uid == null) {
        throw const MissingDataException('Missing user id');
      }
      return remoteDataSource.fetchMyApplications(uid);
    }, from: 'TrainingRepository.fetchMyApplications');
  }

  @override
  Future<Either<Failure, List<TrainingApplicationEntity>>> fetchApplicationsForLawyer(
    String lawyerUid,
  ) {
    return executor.runOnline(() async {
      if (lawyerUid.trim().isEmpty) {
        throw const MissingDataException('Missing lawyer id');
      }
      return remoteDataSource.fetchApplicationsForLawyer(lawyerUid);
    }, from: 'TrainingRepository.fetchApplicationsForLawyer');
  }

  @override
  Future<Either<Failure, TrainingApplicationEntity>> updateApplicationStatus(
    String applicationId,
    TrainingApplicationStatus status,
  ) {
    return executor.runOnline(() async {
      if (applicationId.trim().isEmpty) {
        throw const MissingDataException('Missing application id');
      }
      final response = await remoteDataSource.updateStatus(
        applicationId,
        TrainingApplicationStatusUpdateRequestModel.fromStatus(status),
      );
      final resolved = _parseStatus(response.status) ?? status;
      return TrainingApplicationEntity(id: applicationId, status: resolved);
    }, from: 'TrainingRepository.updateApplicationStatus');
  }

  TrainingApplicationStatus? _parseStatus(String? value) {
    switch (value?.toLowerCase()) {
      case 'accepted':
        return TrainingApplicationStatus.accepted;
      case 'rejected':
        return TrainingApplicationStatus.rejected;
      case 'cancelled':
        return TrainingApplicationStatus.cancelled;
      case 'pending':
        return TrainingApplicationStatus.pending;
      default:
        return null;
    }
  }
}
