import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';

import '../base/key_value_store.dart';
import 'prefs_key.dart';

class PrefsStore implements KeyValueStore<PrefsKey> {
  final SharedPreferences prefs;
  final AppLogger _logger = AppLogger();

  /// Emits mutations as (compositeKey -> newValue).
  /// compositeKey = key.generateKey(userId: userId)
  final _changes = StreamController<MapEntry<String, String?>>.broadcast();

  PrefsStore(this.prefs);

  String _k(PrefsKey key, String? userId) => key.generateKey(userId: userId);

  @override
  Future<bool> write({required PrefsKey key, required String value, String? userId}) {
    return guard<bool>(
      key: key,
      userId: userId,
      op: 'write',
      deleteOnError: false,
      body: () async {
        final k = _k(key, userId);
        final ok = await prefs.setString(k, value);
        if (ok) _changes.add(MapEntry(k, value));
        return ok;
      },
    );
  }

  @override
  Future<String?> read({required PrefsKey key, String? userId}) {
    return guard<String?>(
      key: key,
      userId: userId,
      op: 'read',
      deleteOnError: true,
      body: () async {
        return prefs.getString(_k(key, userId));
      },
    );
  }

  @override
  Future<bool> delete({required PrefsKey key, String? userId}) {
    return guard<bool>(
      key: key,
      userId: userId,
      op: 'delete',
      deleteOnError: false,
      body: () async {
        final k = _k(key, userId);
        final ok = await prefs.remove(k);
        if (ok) _changes.add(MapEntry(k, null));
        return ok;
      },
    );
  }

  @override
  Future<bool> containsKey({required PrefsKey key, String? userId}) {
    return guard<bool>(
      key: key,
      userId: userId,
      op: 'containsKey',
      deleteOnError: true,
      body: () async {
        final v = prefs.getString(_k(key, userId));
        // Keep semantics: empty string ≡ absent
        return v != null && v.isNotEmpty;
      },
    );
  }

  @override
  Stream<String?> watch({required PrefsKey key, String? userId}) async* {
    final k = _k(key, userId);

    // 1) emit current value (guarded)
    final initial = await guard<String?>(
      key: key,
      userId: userId,
      op: 'watch.initial',
      deleteOnError: false,
      body: () async => prefs.getString(k),
    );
    yield initial;

    // 2) future writes/deletes for THIS composite key only
    await for (final entry in _changes.stream) {
      if (entry.key == k) yield entry.value;
    }
  }

  /// Call when your app closes to avoid leaks.
  void dispose() {
    _changes.close();
  }

  // ---------- shared pattern: silent delete + guard ----------

  @override
  Future<void> tryDeleteSilently({required PrefsKey key, String? userId}) async {
    final k = _k(key, userId);
    try {
      final ok = await prefs.remove(k);
      if (ok) _changes.add(MapEntry(k, null));
    } catch (e, s) {
      _logger.cacheError(tag: 'PrefsStore.tryDeleteSilently/${key.name}', e, stack: s);
    }
  }

  @override
  Future<T> guard<T>({
    required PrefsKey key,
    required String? userId,
    required String op,
    required bool deleteOnError,
    required Future<T> Function() body,
  }) async {
    try {
      return await body();
    } catch (error, stack) {
      if (deleteOnError) {
        await tryDeleteSilently(key: key, userId: userId);
      }
      _logger.cacheError(tag: 'PrefsStore.$op/${key.name}', error, stack: stack);
      // Prefs layer should surface LocalStorageException
      throw LocalStorageException(Strings.cache_error.tr());
    }
  }
}
