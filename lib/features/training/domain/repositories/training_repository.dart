import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/features/training/domain/entities/training_application_entity.dart';
import 'package:silah_app/features/training/domain/entities/training_application_status.dart';
import 'package:silah_app/features/training/domain/entities/training_opportunity_entity.dart';

abstract class TrainingRepository {
  Future<Either<Failure, List<TrainingOpportunityEntity>>> fetchOpportunities({
    String? lawyerUid,
  });

  Future<Either<Failure, TrainingApplicationEntity>> submitApplication(
    TrainingApplicationEntity application,
  );

  Future<Either<Failure, List<TrainingApplicationEntity>>>
  fetchMyApplications();

  Future<Either<Failure, List<TrainingApplicationEntity>>>
  fetchApplicationsForLawyer(String lawyerUid);

  Future<Either<Failure, TrainingApplicationEntity>> updateApplicationStatus(
    String applicationId,
    TrainingApplicationStatus status,
  );
}
