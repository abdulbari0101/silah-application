import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';

import 'key_value_store.dart';

extension KeyValueStoreExt<K> on KeyValueStore<K> {
  static final _log = AppLogger();

  String _keyLabel(K key) => key is Enum ? key.name : key.toString();

  Future<String> readOr({
    required K key,
    String? userId,
    String? fallback,
    String Function()? orElse,
    bool deleteOnError = false,
    bool treatEmptyAsMissing = true,
  }) async {
    String alt() {
      if (orElse != null) return orElse();
      if (fallback != null) return fallback;
      throw ArgumentError('Provide either fallback or orElse');
    }

    try {
      final v = await read(key: key, userId: userId); // parent-guarded
      if (v == null) return alt();
      if (treatEmptyAsMissing && v.trim().isEmpty) return alt();
      return v;
    } catch (_) {
      if (deleteOnError) {
        try {
          await tryDeleteSilently(key: key, userId: userId);
        } catch (_) {}
      }
      return alt();
    }
  }

  Future<bool> writeObject<T>({
    required K key,
    String? userId,
    required T object,
    required Map<String, dynamic> Function(T) toJson,
  }) async {
    final payload = jsonEncode(toJson(object));
    // parent-guarded I/O
    return write(key: key, value: payload, userId: userId);
  }

  Future<T?> readObject<T>({
    required K key,
    String? userId,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final jsonStr = await read(key: key, userId: userId); // parent-guarded
    if (jsonStr == null || jsonStr.trim().isEmpty) return null;

    try {
      final map = jsonDecode(jsonStr) as Map<String, dynamic>;
      return fromJson(map);
    } catch (error, stack) {
      // parsing failed → delete corrupt value and escalate
      try {
        await tryDeleteSilently(key: key, userId: userId);
      } catch (_) {}
      _log.cacheError(
        tag: 'KeyValueStore.readObject.parse/${_keyLabel(key)}',
        error,
        stack: stack,
      );
      throw LocalStorageException(Strings.cache_error.tr());
    }
  }

  Future<T> readObjectOr<T>({
    required K key,
    String? userId,
    required T Function(Map<String, dynamic>) fromJson,
    T? fallback,
    T Function()? orElse,
    bool deleteOnError = true,
  }) async {
    T alt() {
      if (orElse != null) return orElse();
      if (fallback != null) return fallback as T;
      throw ArgumentError('Provide either fallback or orElse');
    }

    String? jsonStr;
    try {
      jsonStr = await read(key: key, userId: userId); // parent-guarded
      if (jsonStr == null || jsonStr.trim().isEmpty) return alt();
    } catch (_) {
      if (deleteOnError) {
        try {
          await tryDeleteSilently(key: key, userId: userId);
        } catch (_) {}
      }
      return alt();
    }

    try {
      final map = jsonDecode(jsonStr) as Map<String, dynamic>;
      return fromJson(map);
    } catch (error, stack) {
      if (deleteOnError) {
        try {
          await tryDeleteSilently(key: key, userId: userId);
        } catch (_) {}
      }
      _log.cacheError(
        tag: 'KeyValueStore.readObjectOr.parse/${_keyLabel(key)}',
        error,
        stack: stack,
      );
      return alt();
    }
  }

  Future<bool> writeStringList({
    required K key,
    String? userId,
    required List<String> list,
  }) async {
    final payload = jsonEncode(list);
    // parent-guarded I/O
    return write(key: key, value: payload, userId: userId);
  }

  Future<List<String>> readStringList({required K key, String? userId}) async {
    final jsonStr = await read(key: key, userId: userId); // parent-guarded
    if (jsonStr == null || jsonStr.trim().isEmpty) return const [];

    try {
      final raw = jsonDecode(jsonStr);
      return (raw as List<dynamic>).cast<String>();
    } catch (error, stack) {
      try {
        await tryDeleteSilently(key: key, userId: userId);
      } catch (_) {}
      _log.cacheError(
        tag: 'KeyValueStore.readStringList.parse/${_keyLabel(key)}',
        error,
        stack: stack,
      );
      return const [];
    }
  }

  Future<bool> writeObjectList<T>({
    required K key,
    String? userId,
    required List<T> list,
    required Map<String, dynamic> Function(T) toJson,
  }) async {
    final payload = jsonEncode(list.map(toJson).toList());
    // parent-guarded I/O
    return write(key: key, value: payload, userId: userId);
  }

  Future<List<T>> readObjectList<T>({
    required K key,
    String? userId,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final jsonStr = await read(key: key, userId: userId); // parent-guarded
    if (jsonStr == null || jsonStr.trim().isEmpty) return const [];

    try {
      final raw = jsonDecode(jsonStr) as List<dynamic>;
      return raw.cast<Map<String, dynamic>>().map(fromJson).toList();
    } catch (error, stack) {
      try {
        await tryDeleteSilently(key: key, userId: userId);
      } catch (_) {}
      _log.cacheError(
        tag: 'KeyValueStore.readObjectList.parse/${_keyLabel(key)}',
        error,
        stack: stack,
      );
      throw LocalStorageException(Strings.cache_error.tr());
    }
  }
}
