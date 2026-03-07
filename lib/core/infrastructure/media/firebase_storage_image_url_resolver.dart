import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageImageUrlResolver {
  FirebaseStorageImageUrlResolver._();

  static final FirebaseStorage _storage = FirebaseStorage.instance;
  static final Map<String, String?> _cache = <String, String?>{};
  static final Map<String, Future<String?>> _lookups =
      <String, Future<String?>>{};

  static bool isHttpUrl(String? value) {
    final normalized = value?.trim();
    if (normalized == null || normalized.isEmpty) {
      return false;
    }
    final uri = Uri.tryParse(normalized);
    if (uri == null) {
      return false;
    }
    return uri.scheme == 'http' || uri.scheme == 'https';
  }

  static bool isGsUrl(String? value) {
    final normalized = value?.trim();
    if (normalized == null || normalized.isEmpty) {
      return false;
    }
    final uri = Uri.tryParse(normalized);
    if (uri == null) {
      return false;
    }
    return uri.scheme == 'gs';
  }

  static Future<String?> resolve(String? value) {
    final normalized = value?.trim();
    if (normalized == null || normalized.isEmpty) {
      return Future<String?>.value(null);
    }
    if (isHttpUrl(normalized)) {
      return Future<String?>.value(normalized);
    }
    if (!isGsUrl(normalized)) {
      return Future<String?>.value(null);
    }
    if (_cache.containsKey(normalized)) {
      return Future<String?>.value(_cache[normalized]);
    }
    return _lookups.putIfAbsent(normalized, () async {
      try {
        final resolved = await _storage.refFromURL(normalized).getDownloadURL();
        _cache[normalized] = resolved;
        return resolved;
      } on FirebaseException {
        return null;
      } finally {
        _lookups.remove(normalized);
      }
    });
  }
}
