import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';

import 'secure_key.dart';
import 'secure_store.dart';

extension BiometricExt on SecureStore {
  static final _log = AppLogger();
  static final LocalAuthentication _auth = LocalAuthentication();
  static bool _authInProgress = false;

  Future<void> _requireBiometrics({
    bool allowDeviceCredential = false,
    String? localizedReason,
    bool fingerprintOnly = true,
  }) async {
    // avoid overlapping prompts
    if (_authInProgress) {
      try {
        await _auth.stopAuthentication();
      } catch (_) {}
    }
    _authInProgress = true;
    try {
      final supported = await _auth.isDeviceSupported();
      // canCheckBiometrics checks hardware; ensure enrollment as well
      final enrolled = await _auth.getAvailableBiometrics();
      if (!supported || enrolled.isEmpty) {
        throw SecureStorageException(Strings.biometrics_unavailable.tr());
      }
      if (fingerprintOnly) {
        final hasFingerprint = enrolled.contains(BiometricType.fingerprint);
        final hasStrong = enrolled.contains(BiometricType.strong);
        if (!hasFingerprint && !hasStrong) {
          throw SecureStorageException(Strings.biometrics_unavailable.tr());
        }
      }

      final ok = await _auth.authenticate(
        localizedReason: localizedReason ?? Strings.biometrics_reason.tr(),
        options: AuthenticationOptions(
          biometricOnly:
              !allowDeviceCredential, // enforce biometrics by default
          stickyAuth: true,

          sensitiveTransaction: true,
          useErrorDialogs: true,
        ),
      );

      if (!ok) {
        // user canceled or failed; surface user-safe message
        throw SecureStorageException(Strings.biometrics_cancelled.tr());
      }
    } on PlatformException catch (e, s) {
      _log.cacheError(tag: 'SecureStore.biometric/platform', e, stack: s);
      throw SecureStorageException(Strings.biometrics_unavailable.tr());
    } finally {
      _authInProgress = false;
    }
  }

  Future<bool> writeProtected({
    required SecureKey key,
    required String value,
    String? userId,
    bool allowDeviceCredential = false,
    bool fingerprintOnly = false,
    String? reason,
  }) async {
    await _requireBiometrics(
      allowDeviceCredential: allowDeviceCredential,
      localizedReason: reason,
      fingerprintOnly: fingerprintOnly,
    );
    // storage I/O is guarded by SecureStore.guard
    await write(key: key, value: value, userId: userId);
    return true;
  }

  Future<String?> readProtected({
    required SecureKey key,
    String? userId,
    bool allowDeviceCredential = false,
    bool fingerprintOnly = false,
    String? reason,
  }) async {
    await _requireBiometrics(
      allowDeviceCredential: allowDeviceCredential,
      localizedReason: reason,
      fingerprintOnly: fingerprintOnly,
    );
    // storage I/O is guarded by SecureStore.guard
    return read(key: key, userId: userId);
  }
}
