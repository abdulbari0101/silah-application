import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/decoders/api_json_decoder.dart';
import 'package:silah_app/core/infrastructure/network/firebase_call.dart';
import 'package:silah_app/core/infrastructure/network/firestore_helpers.dart';
import 'package:silah_app/features/discovery/data/models/ai_models.dart';
import 'package:silah_app/features/discovery/data/models/legal_specialization_model.dart';
import 'package:silah_app/features/discovery/domain/entities/discovery_request_entity.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';
import 'package:silah_app/features/profiles/domain/entities/availability_status.dart';
import 'package:silah_app/features/profiles/domain/entities/lawyer_profile_entity.dart';

import 'specifications_service.dart';

abstract class SpecificationsRemoteDataSource {
  Future<BaseApiResponse<AiClassifyResponseModel>> classify(AiClassifyRequestModel request);
  Future<BaseApiResponse<AiRecommendResponseModel>> recommend(AiRecommendRequestModel request);
  Future<List<LegalSpecializationEntity>> fetchSpecializations();
  Future<List<LawyerProfileEntity>> fetchLawyersBySpecialization(DiscoveryRequestEntity request);
}

class SpecificationsRemoteDataSourceImpl implements SpecificationsRemoteDataSource {
  final SpecificationsService specificationsService;
  final AppLogger logger;
  final FirebaseFirestore firestore;

  SpecificationsRemoteDataSourceImpl({
    required this.specificationsService,
    required this.logger,
    FirebaseFirestore? firestore,
  }) : firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<BaseApiResponse<AiClassifyResponseModel>> classify(AiClassifyRequestModel request) =>
      handleBaseApiResponse<AiClassifyResponseModel>(
        method: 'SpecificationsRemoteDataSource.classify',
        logger: logger,
        call: () => specificationsService.classify(request),
      );

  @override
  Future<BaseApiResponse<AiRecommendResponseModel>> recommend(AiRecommendRequestModel request) =>
      handleBaseApiResponse<AiRecommendResponseModel>(
        method: 'SpecificationsRemoteDataSource.recommend',
        logger: logger,
        call: () => specificationsService.recommend(request),
      );

  @override
  Future<List<LegalSpecializationEntity>> fetchSpecializations() {
    return firebaseCall<List<LegalSpecializationEntity>>(
      method: 'SpecificationsRemoteDataSource.fetchSpecializations',
      logger: logger,
      call: () async {
        final snapshot =
            await firestore.collection('specializations').where('active', isEqualTo: true).get();
        return snapshot.docs
            .map((doc) => LegalSpecializationModel(
                  id: doc.id,
                  nameAr: doc.data()['nameAr'] as String?,
                  nameEn: doc.data()['nameEn'] as String?,
                  iconUrl: doc.data()['iconUrl'] as String?,
                  active: doc.data()['active'] as bool?,
                ).toEntity())
            .toList();
      },
    );
  }

  @override
  Future<List<LawyerProfileEntity>> fetchLawyersBySpecialization(
    DiscoveryRequestEntity request,
  ) {
    return firebaseCall<List<LawyerProfileEntity>>(
      method: 'SpecificationsRemoteDataSource.fetchLawyersBySpecialization',
      logger: logger,
      payload: {
        'specializationId': request.specializationId,
        'specializationName': request.specializationName,
        'lawyerIds': request.lawyerIds,
        'cityId': request.cityId,
        'availability': request.availability,
        'limit': request.limit,
      },
      call: () async {
        final requestedIds = _sanitizeIds(request.lawyerIds);
        if (requestedIds.isNotEmpty) {
          final results = await _fetchLawyersByIds(requestedIds);
          return _applyLimit(results, request.limit);
        }

        Query<Map<String, dynamic>> baseQuery = firestore.collection('lawyers');
        final specializationId = request.specializationId?.trim();
        if (specializationId == null || specializationId.isEmpty) {
          return <LawyerProfileEntity>[];
        }

        final cityId = request.cityId?.trim();
        if (cityId != null && cityId.isNotEmpty) {
          baseQuery = baseQuery.where('cityId', isEqualTo: cityId);
        }

        final availability = request.availability?.trim();
        if (availability != null && availability.isNotEmpty) {
          baseQuery = baseQuery.where('availability', isEqualTo: availability.toLowerCase());
        }

        final results = <String, LawyerProfileEntity>{};
        final docs = await _fetchLawyersByFields(
          baseQuery,
          specializationId,
          arrayFields: const ['legalFieldIds'],
        );
        results.addAll(docs);

        final data = results.values.toList();
        return _applyLimit(data, request.limit);
      },
    );
  }

  Future<List<LawyerProfileEntity>> _fetchLawyersByIds(List<String> ids) async {
    if (ids.isEmpty) return [];
    final results = <LawyerProfileEntity>[];
    for (final chunk in _chunk(ids, 10)) {
      final snapshot = await firestore
          .collection('lawyers')
          .where(FieldPath.documentId, whereIn: chunk)
          .get();
      results.addAll(snapshot.docs.map(_mapLawyerDoc));
    }
    return results;
  }

  List<LawyerProfileEntity> _applyLimit(List<LawyerProfileEntity> data, int? limit) {
    if (limit == null || limit <= 0 || data.length <= limit) return data;
    return data.sublist(0, limit);
  }

  List<String> _sanitizeIds(List<String>? ids) {
    if (ids == null || ids.isEmpty) return const <String>[];
    final sanitized = ids.map((value) => value.trim()).where((value) => value.isNotEmpty).toSet();
    return sanitized.toList();
  }

  List<List<String>> _chunk(List<String> values, int size) {
    final chunks = <List<String>>[];
    for (var i = 0; i < values.length; i += size) {
      chunks.add(values.sublist(i, i + size > values.length ? values.length : i + size));
    }
    return chunks;
  }

  Future<Map<String, LawyerProfileEntity>> _fetchLawyersByFields(
    Query<Map<String, dynamic>> baseQuery,
    String value, {
    List<String> arrayFields = const [],
    List<String> equalsFields = const [],
  }) async {
    final results = <String, LawyerProfileEntity>{};
    for (final field in arrayFields) {
      final snapshot = await baseQuery.where(field, arrayContains: value).get();
      for (final doc in snapshot.docs) {
        results[doc.id] = _mapLawyerDoc(doc);
      }
    }
    for (final field in equalsFields) {
      final snapshot = await baseQuery.where(field, isEqualTo: value).get();
      for (final doc in snapshot.docs) {
        results[doc.id] = _mapLawyerDoc(doc);
      }
    }
    return results;
  }

  LawyerProfileEntity _mapLawyerDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? const <String, dynamic>{};
    final availabilityValue = (data['availability'] as String?)?.trim();
    final legalFieldIds = parseFirestoreStringList(data['legalFieldIds']);

    return LawyerProfileEntity(
      id: doc.id,
      fullName: (data['name'] as String?) ?? (data['fullName'] as String?),
      licenseNumber: data['licenseNumber'] as String?,
      legalFieldIds: legalFieldIds,
      city: (data['city'] as String?) ?? (data['cityId'] as String?),
      workplace: (data['workplace'] as String?) ?? (data['workDestinationId'] as String?),
      yearsOfExperience:
          parseFirestoreInt(data['experienceYears']) ?? parseFirestoreInt(data['yearsOfExperience']),
      avatarUrl: data['avatarUrl'] as String?,
      acceptsTrainees: data['acceptsTrainees'] as bool? ?? false,
      availability: _parseAvailability(availabilityValue),
    );
  }

  AvailabilityStatus _parseAvailability(String? value) {
    switch (value?.toLowerCase()) {
      case 'busy':
        return AvailabilityStatus.busy;
      case 'unavailable':
        return AvailabilityStatus.unavailable;
      case 'available':
      default:
        return AvailabilityStatus.available;
    }
  }
}
