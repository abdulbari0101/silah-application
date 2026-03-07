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
      final resolvedTraineeId = application.traineeId?.trim();
      final uid = resolvedTraineeId != null && resolvedTraineeId.isNotEmpty
          ? resolvedTraineeId
          : remoteDataSource.currentUserId();
      final opportunityId = application.opportunityId?.trim();
      final cvUrl = application.cvUrl?.trim();
      if (uid == null) {
        throw const MissingDataException('Missing trainee id');
      }
      if (opportunityId == null || opportunityId.isEmpty) {
        throw const MissingDataException('Missing opportunityId');
      }
      if (cvUrl == null || cvUrl.isEmpty) {
        throw const MissingDataException('Missing CV URL');
      }

      final preparedApplication = application.copyWith(
        traineeId: uid,
        opportunityId: opportunityId,
        cvUrl: cvUrl,
        cityId: application.cityId?.trim(),
        city: application.city?.trim(),
        areaId: application.areaId?.trim(),
        fullName: application.fullName?.trim(),
        university: application.university?.trim(),
        faculty: application.faculty?.trim(),
      );
      final request = TrainingApplicationCreateRequestModel.fromEntity(
        preparedApplication,
      );

      final response = await remoteDataSource.createApplication(request);

      final applicationId = response.applicationId;
      return TrainingApplicationEntity(
        id: applicationId,
        opportunityId: request.opportunityId,
        traineeId: uid,
        fullName: preparedApplication.fullName,
        university: preparedApplication.university,
        faculty: preparedApplication.faculty,
        cityId: preparedApplication.cityId,
        city: preparedApplication.city,
        areaId: preparedApplication.areaId,
        graduationYear: preparedApplication.graduationYear,
        cvUrl: request.cvUrl,
        status: TrainingApplicationStatus.pending,
      );
    }, from: 'TrainingRepository.submitApplication');
  }

  @override
  Future<Either<Failure, List<TrainingApplicationEntity>>>
  fetchMyApplications() {
    return executor.runOnline(() async {
      final uid = remoteDataSource.currentUserId();
      if (uid == null) {
        throw const MissingDataException('Missing user id');
      }
      return remoteDataSource.fetchMyApplications(uid);
    }, from: 'TrainingRepository.fetchMyApplications');
  }

  @override
  Future<Either<Failure, List<TrainingApplicationEntity>>>
  fetchApplicationsForLawyer(String lawyerUid) {
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
      final resolved =
          TrainingApplicationStatusX.tryParse(response.status) ?? status;
      return TrainingApplicationEntity(id: applicationId, status: resolved);
    }, from: 'TrainingRepository.updateApplicationStatus');
  }
}
