import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/foundation/parsing/profile_field_reader.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/decoders/api_json_decoder.dart';
import 'package:silah_app/core/infrastructure/network/firebase_call.dart';
import 'package:silah_app/core/infrastructure/network/firestore_helpers.dart';
import 'package:silah_app/features/discovery/data/models/ai_models.dart';
import 'package:silah_app/features/discovery/domain/entities/discovery_request_entity.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';
import 'package:silah_app/features/profiles/domain/entities/availability_status.dart';
import 'package:silah_app/features/profiles/domain/entities/lawyer_profile_entity.dart';

import 'specifications_service.dart';

abstract class SpecificationsRemoteDataSource {
  Future<BaseApiResponse<AiRecommendResponseModel>> recommend(
    AiRecommendRequestModel request,
  );
  Future<List<LegalSpecializationEntity>> fetchSpecializations();
  String generateSpecializationId();
  Future<String> uploadSpecializationIcon({
    required String specializationId,
    required File imageFile,
  });
  Future<void> upsertSpecialization({
    required String specializationId,
    required String nameAr,
    required String nameEn,
    required int order,
    String? iconUrl,
    bool active = true,
  });
  Future<List<LawyerProfileEntity>> fetchLawyersBySpecialization(
    DiscoveryRequestEntity request,
  );
}

class SpecificationsRemoteDataSourceImpl
    implements SpecificationsRemoteDataSource {
  final SpecificationsService specificationsService;
  final AppLogger logger;
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  SpecificationsRemoteDataSourceImpl({
    required this.specificationsService,
    required this.logger,
    FirebaseFirestore? firestore,
    FirebaseStorage? storage,
  }) : firestore = firestore ?? FirebaseFirestore.instance,
       storage = storage ?? FirebaseStorage.instance;

  @override
  Future<BaseApiResponse<AiRecommendResponseModel>> recommend(
    AiRecommendRequestModel request,
  ) => handleBaseApiResponse<AiRecommendResponseModel>(
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
        final snapshot = await firestore
            .collection('specializations')
            .where('active', isEqualTo: true)
            .get();
        final items = snapshot.docs.map((doc) {
          final data = doc.data();
          final nameAr = (data['nameAr'] as String?)?.trim();
          final nameEn = (data['nameEn'] as String?)?.trim();
          final order = parseFirestoreInt(data['order']);
          return LegalSpecializationEntity(
            id: doc.id,
            code: nameEn,
            name: (nameAr?.isNotEmpty == true) ? nameAr : nameEn,
            description: order?.toString(),
            iconUrl: (data['iconUrl'] as String?)?.trim(),
            keywords: null,
          );
        }).toList();
        items.sort((a, b) {
          final orderA = int.tryParse(a.description ?? '') ?? 1 << 30;
          final orderB = int.tryParse(b.description ?? '') ?? 1 << 30;
          if (orderA != orderB) return orderA.compareTo(orderB);
          final nameA = (a.name ?? a.code ?? '').toLowerCase();
          final nameB = (b.name ?? b.code ?? '').toLowerCase();
          return nameA.compareTo(nameB);
        });
        return items;
      },
    );
  }

  @override
  String generateSpecializationId() {
    return firestore.collection('specializations').doc().id;
  }

  @override
  Future<String> uploadSpecializationIcon({
    required String specializationId,
    required File imageFile,
  }) {
    return firebaseCall<String>(
      method: 'SpecificationsRemoteDataSource.uploadSpecializationIcon',
      logger: logger,
      payload: {'specializationId': specializationId},
      call: () async {
        final path =
            'specializations/$specializationId/icon_${DateTime.now().millisecondsSinceEpoch}.jpg';
        final ref = storage.ref().child(path);
        await ref.putFile(
          imageFile,
          SettableMetadata(contentType: 'image/jpeg'),
        );
        return ref.getDownloadURL();
      },
    );
  }

  @override
  Future<void> upsertSpecialization({
    required String specializationId,
    required String nameAr,
    required String nameEn,
    required int order,
    String? iconUrl,
    bool active = true,
  }) {
    return firebaseCall<void>(
      method: 'SpecificationsRemoteDataSource.upsertSpecialization',
      logger: logger,
      payload: {
        'specializationId': specializationId,
        'nameAr': nameAr,
        'nameEn': nameEn,
        'order': order,
        'active': active,
      },
      call: () async {
        final ref = firestore
            .collection('specializations')
            .doc(specializationId);
        final exists = (await ref.get()).exists;
        final payload = <String, dynamic>{
          'nameAr': nameAr.trim(),
          'nameEn': nameEn.trim(),
          'order': order,
          'active': active,
          'updatedAt': FieldValue.serverTimestamp(),
        };
        final icon = iconUrl?.trim();
        if (icon != null && icon.isNotEmpty) {
          payload['iconUrl'] = icon;
        }
        if (!exists) {
          payload['createdAt'] = FieldValue.serverTimestamp();
        }

        await ref.set(payload, SetOptions(merge: true));
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

        Query<Map<String, dynamic>> baseQuery = firestore
            .collection('lawyers')
            .where('verified', isEqualTo: true);
        final specializationId = request.specializationId?.trim();
        if (specializationId == null || specializationId.isEmpty) {
          return <LawyerProfileEntity>[];
        }

        final availability = request.availability?.trim();
        if (availability != null && availability.isNotEmpty) {
          baseQuery = baseQuery.where(
            'availability',
            isEqualTo: availability.toLowerCase(),
          );
        }

        final results = <String, LawyerProfileEntity>{};
        final cityId = request.cityId?.trim();
        final queries = <Query<Map<String, dynamic>>>[];
        if (cityId != null && cityId.isNotEmpty) {
          queries
            ..add(baseQuery.where('cityId', isEqualTo: cityId))
            ..add(baseQuery.where('city', isEqualTo: cityId));
        } else {
          queries.add(baseQuery);
        }

        for (final query in queries) {
          final docs = await _fetchLawyersByFields(
            query,
            specializationId,
            arrayFields: const ['legalFieldIds'],
          );
          results.addAll(docs);
        }

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
      for (final doc in snapshot.docs) {
        final data = doc.data();
        if (data['verified'] != true) continue;
        results.add(_mapLawyerDoc(doc));
      }
    }
    return results;
  }

  List<LawyerProfileEntity> _applyLimit(
    List<LawyerProfileEntity> data,
    int? limit,
  ) {
    if (limit == null || limit <= 0 || data.length <= limit) return data;
    return data.sublist(0, limit);
  }

  List<String> _sanitizeIds(List<String>? ids) {
    if (ids == null || ids.isEmpty) return const <String>[];
    final sanitized = ids
        .map((value) => value.trim())
        .where((value) => value.isNotEmpty)
        .toSet();
    return sanitized.toList();
  }

  List<List<String>> _chunk(List<String> values, int size) {
    final chunks = <List<String>>[];
    for (var i = 0; i < values.length; i += size) {
      chunks.add(
        values.sublist(i, i + size > values.length ? values.length : i + size),
      );
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

  LawyerProfileEntity _mapLawyerDoc(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? const <String, dynamic>{};
    final availabilityValue = (data['availability'] as String?)?.trim();
    final legalFieldIds = parseFirestoreStringList(data['legalFieldIds']);
    final legalFields = parseFirestoreStringList(data['legalFields']);
    final cityId = (data['cityId'] as String?)?.trim();
    final cityName = (data['city'] as String?)?.trim();
    final workDestinationId = (data['workDestinationId'] as String?)?.trim();
    final workplaceName = (data['workplace'] as String?)?.trim();
    final officeName = (data['officeName'] as String?)?.trim();

    return LawyerProfileEntity(
      id: doc.id,
      fullName: (data['name'] as String?) ?? (data['fullName'] as String?),
      licenseNumber: data['licenseNumber'] as String?,
      legalFields: legalFields,
      legalFieldIds: legalFieldIds,
      city: (cityName != null && cityName.isNotEmpty) ? cityName : cityId,
      cityId: cityId,
      areaId: (data['areaId'] as String?)?.trim(),
      workplace: (workplaceName != null && workplaceName.isNotEmpty)
          ? workplaceName
          : workDestinationId,
      officeName: officeName,
      workDestinationId: workDestinationId,
      yearsOfExperience:
          parseFirestoreInt(data['experienceYears']) ??
          parseFirestoreInt(data['yearsOfExperience']),
      avatarUrl: ProfileFieldReader.readAvatarUrl(data),
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
