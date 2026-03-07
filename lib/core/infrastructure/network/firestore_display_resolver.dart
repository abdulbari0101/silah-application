import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:silah_app/core/foundation/localization/localized_value_resolver.dart';
import 'package:silah_app/core/foundation/parsing/profile_field_reader.dart';

class FirestoreDisplayResolver {
  FirestoreDisplayResolver._();

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final Map<String, _ResolvedUserDisplay> _userCache =
      <String, _ResolvedUserDisplay>{};
  static final Map<String, Future<_ResolvedUserDisplay?>> _userLookups =
      <String, Future<_ResolvedUserDisplay?>>{};

  static final Map<String, String?> _specializationCache = <String, String?>{};
  static final Map<String, Future<String?>> _specializationLookups =
      <String, Future<String?>>{};

  static Future<String?> resolveUserName(String? uid) {
    final normalized = uid?.trim() ?? '';
    if (normalized.isEmpty) {
      return Future<String?>.value(null);
    }
    return _resolveUserDisplay(normalized).then((value) => value?.name);
  }

  static Future<String?> resolveUserAvatarUrl(String? uid) {
    final normalized = uid?.trim() ?? '';
    if (normalized.isEmpty) {
      return Future<String?>.value(null);
    }
    return _resolveUserDisplay(normalized).then((value) => value?.avatarUrl);
  }

  static Future<_ResolvedUserDisplay?> _resolveUserDisplay(String uid) {
    if (_userCache.containsKey(uid)) {
      return Future<_ResolvedUserDisplay?>.value(_userCache[uid]);
    }
    return _userLookups.putIfAbsent(uid, () async {
      final value = await _loadUserDisplay(uid);
      if (value != null && value.hasData) {
        _userCache[uid] = value;
      }
      _userLookups.remove(uid);
      return value;
    });
  }

  static Future<String?> resolveSpecializationName(
    String? specializationId, {
    required String localeCode,
  }) {
    final normalized = specializationId?.trim() ?? '';
    if (normalized.isEmpty) {
      return Future<String?>.value(null);
    }

    final cacheKey = '$localeCode::$normalized';
    if (_specializationCache.containsKey(cacheKey)) {
      return Future<String?>.value(_specializationCache[cacheKey]);
    }

    return _specializationLookups.putIfAbsent(cacheKey, () async {
      final doc = await _firestore
          .collection('specializations')
          .doc(normalized)
          .get();
      final data = doc.data();
      final value = _extractSpecializationName(data, localeCode);
      _specializationCache[cacheKey] = value;
      _specializationLookups.remove(cacheKey);
      return value;
    });
  }

  static Future<List<String>> resolveSpecializationNames(
    Iterable<String>? specializationIds, {
    required String localeCode,
  }) async {
    final values = <String>[];
    final seen = <String>{};
    for (final rawId in specializationIds ?? const <String>[]) {
      final resolved = await resolveSpecializationName(
        rawId,
        localeCode: localeCode,
      );
      final normalized = resolved?.trim();
      if (normalized == null || normalized.isEmpty || !seen.add(normalized)) {
        continue;
      }
      values.add(normalized);
    }
    return values;
  }

  static Future<_ResolvedUserDisplay?> _loadUserDisplay(String uid) async {
    for (final collection in const <String>['lawyers', 'users']) {
      final display = await _loadUserDisplayFromCollection(collection, uid);
      if (display != null && display.hasData) {
        return display;
      }
    }
    return null;
  }

  static Future<_ResolvedUserDisplay?> _loadUserDisplayFromCollection(
    String collection,
    String uid,
  ) async {
    try {
      final doc = await _firestore.collection(collection).doc(uid).get();
      if (!doc.exists) {
        return null;
      }
      final data = doc.data();
      return _ResolvedUserDisplay(
        name: _extractUserName(data),
        avatarUrl: _extractUserAvatarUrl(data),
      );
    } on FirebaseException catch (error) {
      if (error.code == 'permission-denied') {
        return null;
      }
      rethrow;
    }
  }

  static String? _extractUserName(Map<String, dynamic>? data) {
    return ProfileFieldReader.readDisplayName(data);
  }

  static String? _extractUserAvatarUrl(Map<String, dynamic>? data) {
    return ProfileFieldReader.readAvatarUrl(data);
  }

  static String? _extractSpecializationName(
    Map<String, dynamic>? data,
    String localeCode,
  ) {
    return LocalizedValueResolver.resolveFromMap(data, localeCode: localeCode);
  }
}

class _ResolvedUserDisplay {
  const _ResolvedUserDisplay({this.name, this.avatarUrl});

  final String? name;
  final String? avatarUrl;

  bool get hasData {
    return (name?.trim().isNotEmpty ?? false) ||
        (avatarUrl?.trim().isNotEmpty ?? false);
  }
}
