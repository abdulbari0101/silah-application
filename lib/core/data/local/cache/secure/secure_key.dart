import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/config/extentions/string_validation.dart';

part 'secure_key.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.snakeCase)
enum SecureKey {
  deviceToken, // → 'device_token'
  authTokenLogin, // → 'auth_token_login'
  authTokenReg, // → 'auth_token_reg'

  fcmToken, // → 'fcm_token'
  offlineActivated, // → 'offline_activated'
  useOffline, // → 'use_offline'
  mb, // → 'mb'
  ps, // → 'ps'
  csr, // → 'csr'
  ofk, // → 'ofk'
  rKey, // → 'r_key'
  uiKey, // → 'ui_key'
  sc, // → 'sc'
  ser, // → 'ser'
  pin, // → 'pin'
  otp, // → 'otp'
  dbEncryptionKey, // → 'db_encryption_key'
  ipc, // → 'ipc'
  userHashedId, // → 'userHashedId'
  biometricLoginEnabled, // → 'biometric_login_enabled'
  biometricPassword, // → 'biometric_password'
}

extension SecureKeyExt on SecureKey {
  String generateKey({String? userId}) {
    if (userId.isNotNullOrEmpty) {
      return '${toValue()}_${userId?.substring(0, 10)}';
    } else {
      return toValue();
    }
  }
}
