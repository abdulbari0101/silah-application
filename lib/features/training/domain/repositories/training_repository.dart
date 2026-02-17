import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/features/training/domain/entities/training_application_entity.dart';
import 'package:silah_app/features/training/domain/entities/training_opportunity_entity.dart';

abstract class TrainingRepository {
  Future<Either<Failure, List<TrainingOpportunityEntity>>> fetchOpportunities();

  Future<Either<Failure, TrainingApplicationEntity>> submitApplication(
    TrainingApplicationEntity application,
  );

  Future<Either<Failure, List<TrainingApplicationEntity>>> fetchMyApplications();
}
