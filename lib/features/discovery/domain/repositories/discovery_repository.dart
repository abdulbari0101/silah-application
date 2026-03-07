import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/features/discovery/domain/entities/ai_classification_request_entity.dart';
import 'package:silah_app/features/discovery/domain/entities/ai_recommendation_entity.dart';
import 'package:silah_app/features/discovery/domain/entities/discovery_request_entity.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';

abstract class DiscoveryRepository {
  Future<Either<Failure, List<LegalSpecializationEntity>>>
  fetchSpecializations();
  Future<Either<Failure, List<DiscoveryRequestEntity>>>
  fetchLawyersBySpecialization(DiscoveryRequestEntity request);

  Future<Either<Failure, void>> upsertSpecialization({
    String? specializationId,
    required String nameAr,
    required String nameEn,
    required int order,
    String? iconUrl,
    File? iconFile,
    bool active = true,
  });

  Future<Either<Failure, AiRecommendationEntity>> recommendLawyers(
    AiClassificationRequestEntity request,
  );
}
