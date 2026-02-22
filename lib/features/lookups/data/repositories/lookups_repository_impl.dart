import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/network/firebase_call.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/features/lookups/data/models/lookup_item_model.dart';
import 'package:silah_app/features/lookups/domain/entities/lookup_item_entity.dart';
import 'package:silah_app/features/lookups/domain/repositories/lookups_repository.dart';

class LookupsRepositoryImpl implements LookupsRepository {
  final Executor executor;
  final FirebaseFirestore firestore;

  LookupsRepositoryImpl({
    required this.executor,
    FirebaseFirestore? firestore,
  }) : firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<Either<Failure, List<LookupItemEntity>>> fetchGenders() {
    return _fetchCollection('genders');
  }

  @override
  Future<Either<Failure, List<LookupItemEntity>>> fetchAreas() {
    return _fetchCollection('areas');
  }

  @override
  Future<Either<Failure, List<LookupItemEntity>>> fetchCities({String? areaId}) {
    return executor.runOnline(() async {
      return firebaseCall<List<LookupItemEntity>>(
        method: 'LookupsRepository.fetchCities',
        logger: executor.logger,
        call: () async {
          Query<Map<String, dynamic>> query = firestore.collection('cities');
          if (areaId != null && areaId.trim().isNotEmpty) {
            query = query.where('areaId', isEqualTo: areaId.trim());
          }
          final snapshot = await query.get();
          return snapshot.docs.map(_mapDoc).toList();
        },
      );
    }, from: 'LookupsRepository.fetchCities');
  }

  @override
  Future<Either<Failure, List<LookupItemEntity>>> fetchWorkDestinations() {
    return _fetchCollection('work_destinations');
  }

  Future<Either<Failure, List<LookupItemEntity>>> _fetchCollection(String collection) {
    return executor.runOnline(() async {
      return firebaseCall<List<LookupItemEntity>>(
        method: 'LookupsRepository.fetch.$collection',
        logger: executor.logger,
        call: () async {
          final snapshot = await firestore.collection(collection).get();
          return snapshot.docs.map(_mapDoc).toList();
        },
      );
    }, from: 'LookupsRepository.fetch.$collection');
  }

  LookupItemEntity _mapDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    return LookupItemModel(
      id: doc.id,
      nameAr: data['nameAr'] as String?,
      nameEn: data['nameEn'] as String?,
      iconUrl: data['iconUrl'] as String?,
      areaId: data['areaId'] as String?,
    ).toEntity();
  }
}
