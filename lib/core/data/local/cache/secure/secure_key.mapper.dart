// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'secure_key.dart';

class SecureKeyMapper extends EnumMapper<SecureKey> {
  SecureKeyMapper._();

  static SecureKeyMapper? _instance;
  static SecureKeyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SecureKeyMapper._());
    }
    return _instance!;
  }

  static SecureKey fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  SecureKey decode(dynamic value) {
    switch (value) {
      case r'device_token':
        return SecureKey.deviceToken;
      case r'auth_token_login':
        return SecureKey.authTokenLogin;
      case r'auth_token_reg':
        return SecureKey.authTokenReg;
      case r'fcm_token':
        return SecureKey.fcmToken;
      case r'offline_activated':
        return SecureKey.offlineActivated;
      case r'use_offline':
        return SecureKey.useOffline;
      case r'mb':
        return SecureKey.mb;
      case r'ps':
        return SecureKey.ps;
      case r'csr':
        return SecureKey.csr;
      case r'ofk':
        return SecureKey.ofk;
      case r'r_key':
        return SecureKey.rKey;
      case r'ui_key':
        return SecureKey.uiKey;
      case r'sc':
        return SecureKey.sc;
      case r'ser':
        return SecureKey.ser;
      case r'pin':
        return SecureKey.pin;
      case r'otp':
        return SecureKey.otp;
      case r'db_encryption_key':
        return SecureKey.dbEncryptionKey;
      case r'ipc':
        return SecureKey.ipc;
      case r'user_hashed_id':
        return SecureKey.userHashedId;
      case r'biometric_login_enabled':
        return SecureKey.biometricLoginEnabled;
      case r'biometric_password':
        return SecureKey.biometricPassword;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(SecureKey self) {
    switch (self) {
      case SecureKey.deviceToken:
        return r'device_token';
      case SecureKey.authTokenLogin:
        return r'auth_token_login';
      case SecureKey.authTokenReg:
        return r'auth_token_reg';
      case SecureKey.fcmToken:
        return r'fcm_token';
      case SecureKey.offlineActivated:
        return r'offline_activated';
      case SecureKey.useOffline:
        return r'use_offline';
      case SecureKey.mb:
        return r'mb';
      case SecureKey.ps:
        return r'ps';
      case SecureKey.csr:
        return r'csr';
      case SecureKey.ofk:
        return r'ofk';
      case SecureKey.rKey:
        return r'r_key';
      case SecureKey.uiKey:
        return r'ui_key';
      case SecureKey.sc:
        return r'sc';
      case SecureKey.ser:
        return r'ser';
      case SecureKey.pin:
        return r'pin';
      case SecureKey.otp:
        return r'otp';
      case SecureKey.dbEncryptionKey:
        return r'db_encryption_key';
      case SecureKey.ipc:
        return r'ipc';
      case SecureKey.userHashedId:
        return r'user_hashed_id';
      case SecureKey.biometricLoginEnabled:
        return r'biometric_login_enabled';
      case SecureKey.biometricPassword:
        return r'biometric_password';
    }
  }
}

extension SecureKeyMapperExtension on SecureKey {
  String toValue() {
    SecureKeyMapper.ensureInitialized();
    return MapperContainer.globals.toValue<SecureKey>(this) as String;
  }
}
