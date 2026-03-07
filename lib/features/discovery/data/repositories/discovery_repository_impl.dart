import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/features/discovery/data/models/ai_models.dart';
import 'package:silah_app/features/discovery/data/datasources/remote/specifications_remote_data_source.dart';
import 'package:silah_app/features/discovery/domain/entities/ai_classification_request_entity.dart';
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
  Future<Either<Failure, List<LegalSpecializationEntity>>>
  fetchSpecializations() {
    return executor.runOnline(() async {
      return remoteDataSource.fetchSpecializations();
    }, from: 'DiscoveryRepository.fetchSpecializations');
  }

  @override
  Future<Either<Failure, AiRecommendationEntity>> recommendLawyers(
    AiClassificationRequestEntity request,
  ) {
    return executor.runOnline(() async {
      final response = await remoteDataSource.recommend(
        AiRecommendRequestModel.fromEntity(request),
      );
      return response.toEntity();
    }, from: 'DiscoveryRepository.recommendLawyers');
  }

  @override
  Future<Either<Failure, List<DiscoveryRequestEntity>>>
  fetchLawyersBySpecialization(DiscoveryRequestEntity request) {
    return executor.runOnline(() async {
      final lawyers = await remoteDataSource.fetchLawyersBySpecialization(
        request,
      );
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

  @override
  Future<Either<Failure, void>> upsertSpecialization({
    String? specializationId,
    required String nameAr,
    required String nameEn,
    required int order,
    String? iconUrl,
    File? iconFile,
    bool active = true,
  }) {
    return executor.runOnline(() async {
      final currentId = specializationId?.trim();
      final targetId = (currentId != null && currentId.isNotEmpty)
          ? currentId
          : remoteDataSource.generateSpecializationId();

      var resolvedIconUrl = iconUrl?.trim();
      if (iconFile != null) {
        resolvedIconUrl = await remoteDataSource.uploadSpecializationIcon(
          specializationId: targetId,
          imageFile: iconFile,
        );
      }

      await remoteDataSource.upsertSpecialization(
        specializationId: targetId,
        nameAr: nameAr,
        nameEn: nameEn,
        order: order,
        iconUrl: resolvedIconUrl,
        active: active,
      );
    }, from: 'DiscoveryRepository.upsertSpecialization');
  }
}
