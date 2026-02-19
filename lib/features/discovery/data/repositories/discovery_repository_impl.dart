import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/core/infrastructure/network/firebase_call.dart';
import 'package:silah_app/features/discovery/data/datasources/remote/ai_remote_data_source.dart';
import 'package:silah_app/features/discovery/data/models/ai_models.dart';
import 'package:silah_app/features/discovery/data/models/legal_specialization_model.dart';
import 'package:silah_app/features/discovery/domain/entities/ai_classification_request_entity.dart';
import 'package:silah_app/features/discovery/domain/entities/ai_classification_result_entity.dart';
import 'package:silah_app/features/discovery/domain/entities/ai_recommendation_entity.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';
import 'package:silah_app/features/discovery/domain/repositories/discovery_repository.dart';

class DiscoveryRepositoryImpl implements DiscoveryRepository {
  final AiRemoteDataSource aiRemoteDataSource;
  final Executor executor;
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  DiscoveryRepositoryImpl({
    required this.aiRemoteDataSource,
    required this.executor,
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : firestore = firestore ?? FirebaseFirestore.instance,
        auth = auth ?? FirebaseAuth.instance;

  @override
  Future<Either<Failure, List<LegalSpecializationEntity>>> fetchSpecializations() {
    return executor.runOnline(() async {
      final result = await firebaseCall<List<LegalSpecializationEntity>>(
        method: 'DiscoveryRepository.fetchSpecializations',
        logger: executor.logger,
        call: () async {
          final snapshot =
              await firestore.collection('specializations').where('active', isEqualTo: true).get();
          return snapshot.docs
              .map((doc) => LegalSpecializationModel(
                    id: doc.id,
                    nameAr: doc.data()['nameAr'] as String?,
                    nameEn: doc.data()['nameEn'] as String?,
                    active: doc.data()['active'] as bool?,
                  ).toEntity())
              .toList();
        },
      );
      return result;
    }, from: 'DiscoveryRepository.fetchSpecializations');
  }

  @override
  Future<Either<Failure, AiClassificationResultEntity>> classifyIssue(
    AiClassificationRequestEntity request,
  ) {
    return executor.runOnline(() async {
      final response = await aiRemoteDataSource.classify(
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
      final response = await aiRemoteDataSource.recommend(
        AiRecommendRequestModel.fromEntity(request),
      );
      return response.toEntity();
    }, from: 'DiscoveryRepository.recommendLawyers');
  }
}
