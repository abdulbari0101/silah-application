import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/data/local/cache/base/key_value_store.dart';
import 'package:silah_app/core/data/local/cache/secure/secure_key.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';

class SecureStore implements KeyValueStore<SecureKey> {
  static SecureStore? _instance;
  late final FlutterSecureStorage _secureStorage;
  final AppLogger _logger = AppLogger();

  SecureStore._();

  static Future<SecureStore> init() async {
    if (_instance != null) return _instance!;
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final bundleId = packageInfo.packageName;

      final storage = FlutterSecureStorage(
        aOptions: const AndroidOptions(
          encryptedSharedPreferences: true,
          resetOnError: true,
          keyCipherAlgorithm:
              KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
          storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
        ),
        iOptions: IOSOptions(
          accessibility: KeychainAccessibility.first_unlock_this_device,
          accountName: bundleId,
          synchronizable: false,
        ),
      );

      _instance = SecureStore._().._secureStorage = storage;
      return _instance!;
    } catch (error, stack) {
      AppLogger().cacheError(tag: 'SecureStore.init', error, stack: stack);
      throw SecureStorageException(Strings.cache_error.tr());
    }
  }

  bool get isInitialized => _instance != null;

  String _k(SecureKey key, String? userId) => key.generateKey(userId: userId);

  @override
  Future<bool> write({
    required SecureKey key,
    required String value,
    String? userId,
  }) {
    return guard<bool>(
      key: key,
      op: 'write',
      userId: userId,
      value: value,
      deleteOnError: false,
      body: () async {
        await _secureStorage.write(key: _k(key, userId), value: value);
        return true;
      },
    );
  }

  @override
  Future<bool> delete({required SecureKey key, String? userId}) {
    return guard<bool>(
      key: key,
      op: 'delete',
      userId: userId,
      deleteOnError: false,
      body: () async {
        await _secureStorage.delete(key: _k(key, userId));
        return true;
      },
    );
  }

  @override
  Future<String?> read({required SecureKey key, String? userId}) {
    return guard<String?>(
      key: key,
      userId: userId,

      deleteOnError: true,
      op: 'read',
      body: () => _secureStorage.read(key: _k(key, userId)),
    );
  }

  @override
  Future<bool> containsKey({required SecureKey key, String? userId}) {
    return guard<bool>(
      key: key,
      userId: userId,
      op: 'containsKey',
      deleteOnError: true,
      body: () async {
        final value = await _secureStorage.read(key: _k(key, userId));
        // Keep your chosen semantics: empty string ≡ absent
        return value != null && value.trim().isNotEmpty;
      },
    );
  }

  @override
  Stream<String?> watch({required SecureKey key, String? userId}) async* {
    final kk = _k(key, userId);

    // initial emit
    final initial = await guard<String?>(
      key: key,
      userId: userId,
      deleteOnError: false,
      op: 'watch.initial',
      body: () => _secureStorage.read(key: kk),
    );
    yield initial;

    // subsequent changes
    final controller = StreamController<String?>.broadcast();
    void listener(String? v) {
      try {
        controller.add(v);
      } catch (e, s) {
        _logger.cacheError(
          tag: 'SecureStore.watch.listener/${key.name}',
          e,
          stack: s,
        );
      }
    }

    try {
      await guard<void>(
        key: key,
        userId: userId,
        deleteOnError: false,
        op: 'watch.register',
        body: () async =>
            _secureStorage.registerListener(key: kk, listener: listener),
      );

      await for (final v in controller.stream) {
        yield v;
      }
    } finally {
      try {
        _secureStorage.unregisterListener(key: kk, listener: listener);
      } catch (e, s) {
        _logger.cacheError(
          tag: 'SecureStore.watch.unregister/${key.name}',
          e,
          stack: s,
        );
      }
      await controller.close();
    }
  }

  @override
  Future<void> tryDeleteSilently({
    required SecureKey key,
    String? userId,
  }) async {
    try {
      await delete(key: key, userId: userId);
    } catch (e, s) {
      _logger.cacheError(
        tag: 'SecureStore.tryDeleteSilently/${key.name}',
        e,
        stack: s,
      );
    }
  }

  @override
  Future<T> guard<T>({
    required SecureKey key,
    required String? userId,
    required String op,
    String? value,
    required bool deleteOnError,
    required Future<T> Function() body,
  }) async {
    try {
      final result = await body();

      // _logger.cacheInfo(
      //   "$op done , result = $result userId = $userId , value $value",
      //   tag: 'SecureStore/${key.generateKey(userId: userId)}',
      // );

      return result;
    } catch (error, stack) {
      if (deleteOnError) {
        await tryDeleteSilently(key: key, userId: userId);
      }
      _logger.cacheError(
        tag: 'SecureStore.$op/${key.name}',
        error,
        stack: stack,
      );
      throw SecureStorageException(Strings.cache_error.tr());
    }
  }
}
