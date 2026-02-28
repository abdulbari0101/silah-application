import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/features/discovery/data/models/ai_models.dart';
import 'package:silah_app/features/discovery/data/datasources/remote/specifications_remote_data_source.dart';
import 'package:silah_app/features/discovery/domain/entities/ai_classification_request_entity.dart';
import 'package:silah_app/features/discovery/domain/entities/ai_classification_result_entity.dart';
import 'package:silah_app/features/discovery/domain/entities/ai_recommendation_entity.dart';
import 'package:silah_app/features/discovery/domain/entities/discovery_request_entity.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';
import 'package:silah_app/features/discovery/domain/repositories/discovery_repository.dart';

class DiscoveryRepositoryImpl implements DiscoveryRepository {
  final SpecificationsRemoteDataSource remoteDataSource;
  final Executor executor;

  DiscoveryRepositoryImpl({
    required this.remoteDataSource,
    required this.executor,
  });

  @override
  Future<Either<Failure, List<LegalSpecializationEntity>>> fetchSpecializations() {
    return executor.runOnline(() async {
      return remoteDataSource.fetchSpecializations();
    }, from: 'DiscoveryRepository.fetchSpecializations');
  }

  @override
  Future<Either<Failure, AiClassificationResultEntity>> classifyIssue(
    AiClassificationRequestEntity request,
  ) {
    return executor.runOnline(() async {
      final response = await remoteDataSource.classify(
        AiClassifyRequestModel.fromEntity(request),
      );
      return response.toEntity();
    }, from: 'DiscoveryRepository.classifyIssue');
  }

  @override
  Future<Either<Failure, AiRecommendationEntity>> recommendLawyers(
    AiClassificationRequestEntity request,
  ) {
    return executor.runOnline(() async {
      final response = await remoteDataSource.recommend(
        AiRecommendRequestModel.fromEntity(request),
      );
      final base = response.toEntity();

      final lawyerIds = response.lawyerIds ?? const <String>[];
      if (lawyerIds.isNotEmpty) {
        final lawyers = await remoteDataSource.fetchLawyersBySpecialization(
          DiscoveryRequestEntity(lawyerIds: lawyerIds),
        );
        return AiRecommendationEntity(
          specialization: base.specialization,
          lawyers: lawyers,
        );
      }

      final specializationId = response.specializationId ?? base.specialization?.id;
      if (specializationId != null && specializationId.trim().isNotEmpty) {
        final lawyers = await remoteDataSource.fetchLawyersBySpecialization(
          DiscoveryRequestEntity(
            specializationId: specializationId,
            specializationName: base.specialization?.name,
          ),
        );
        return AiRecommendationEntity(
          specialization: base.specialization,
          lawyers: lawyers,
        );
      }

      return base;
    }, from: 'DiscoveryRepository.recommendLawyers');
  }

  @override
  Future<Either<Failure, List<DiscoveryRequestEntity>>> fetchLawyersBySpecialization(
    DiscoveryRequestEntity request,
  ) {
    return executor.runOnline(() async {
      final lawyers = await remoteDataSource.fetchLawyersBySpecialization(request);
      return lawyers
          .map(
            (lawyer) => DiscoveryRequestEntity(
              specializationId: request.specializationId,
              specializationName: request.specializationName,
              lawyerIds: request.lawyerIds,
              cityId: request.cityId,
              availability: request.availability,
              limit: request.limit,
              lawyer: lawyer,
            ),
          )
          .toList();
    }, from: 'DiscoveryRepository.fetchLawyersBySpecialization');
  }
}
