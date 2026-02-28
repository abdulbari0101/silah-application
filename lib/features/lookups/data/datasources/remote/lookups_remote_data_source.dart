import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/firebase_call.dart';
import 'package:silah_app/features/lookups/data/models/lookup_item_model.dart';
import 'package:silah_app/features/lookups/domain/entities/lookup_item_entity.dart';

abstract class LookupsRemoteDataSource {
  Future<List<LookupItemEntity>> fetchGenders();
  Future<List<LookupItemEntity>> fetchAreas();
  Future<List<LookupItemEntity>> fetchCities({String? areaId});
  Future<List<LookupItemEntity>> fetchWorkDestinations();
}

class LookupsRemoteDataSourceImpl implements LookupsRemoteDataSource {
  final FirebaseFirestore firestore;
  final AppLogger logger;

  LookupsRemoteDataSourceImpl({required this.logger, FirebaseFirestore? firestore})
    : firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<List<LookupItemEntity>> fetchGenders() => _fetchCollection('genders');

  @override
  Future<List<LookupItemEntity>> fetchAreas() => _fetchCollection('areas');

  @override
  Future<List<LookupItemEntity>> fetchCities({String? areaId}) {
    return firebaseCall<List<LookupItemEntity>>(
      method: 'LookupsRemoteDataSource.fetchCities',
      logger: logger,
      call: () async {
        Query<Map<String, dynamic>> query = firestore.collection('cities');
        if (areaId != null && areaId.trim().isNotEmpty) {
          query = query.where('areaId', isEqualTo: areaId.trim());
        }
        final snapshot = await query.get();
        return snapshot.docs.map(_mapDoc).toList();
      },
    );
  }

  @override
  Future<List<LookupItemEntity>> fetchWorkDestinations() => _fetchCollection('work_destinations');

  Future<List<LookupItemEntity>> _fetchCollection(String collection) {
    return firebaseCall<List<LookupItemEntity>>(
      method: 'LookupsRemoteDataSource.fetch.$collection',
      logger: logger,
      call: () async {
        final snapshot = await firestore.collection(collection).get();
        return snapshot.docs.map(_mapDoc).toList();
      },
    );
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
