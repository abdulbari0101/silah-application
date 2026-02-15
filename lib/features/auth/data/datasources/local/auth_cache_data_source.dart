import 'package:silah_app/core/config/extentions/string_validation.dart';
import 'package:silah_app/core/data/local/cache/app_cache.dart';
import 'package:silah_app/core/data/local/cache/base/key_value_store_ex.dart';
import 'package:silah_app/core/data/local/cache/readers/auth_readers.dart';
import 'package:silah_app/core/data/local/cache/secure/secure_key.dart';
import 'package:silah_app/core/data/model/api/auth/customer_model.dart';
import 'package:silah_app/core/data/model/api/auth/token_model.dart';
import 'package:silah_app/features/auth/data/models/device_token_model.dart';

import '../../../../../core/infrastructure/analytics/logger/app_logger.dart';
import '../../../../../core/infrastructure/errors/exceptions.dart';

abstract class AuthCacheDataSource implements SesstionReader, IdentityReader {
  // shared
  Future<void> saveCustomer({required CustomerModel customer, required String userId});
  Future<void> saveCustMobile({required String mobile, required String userId});

  //Sesstion
  Future<void> cacheDeviceToken(DeviceTokenModel token);
  Future<void> cacheLoginToken(TokenModel token);
 
  Future<void> clearToken();

  //Identity
  Future<void> saveDeviceSerialId({required String serial});
  Future<void> saveUserId({required String userId});
  Future<void> clearUserId();
}

class AuthCacheDataSourceImpl implements AuthCacheDataSource {
  final AppCache appCache;
  final AppLogger logger;

  AuthCacheDataSourceImpl({required this.appCache, required this.logger});

  // user id
  @override
  Future<void> saveUserId({required String userId}) {
    return appCache.secure.write(key: SecureKey.userHashedId, value: userId);
  }

  /// Call this wherever you need to scope DB access or ID context
  ///
  @override
  Future<String?> userId() async {
    return appCache.secure.read(key: SecureKey.userHashedId);
  }

  @override
  Future<void> cacheDeviceToken(DeviceTokenModel token) async {
    await appCache.secure.write(key: SecureKey.deviceToken, value: token.deviceToken ?? '');
  }

  @override
  Future<void> cacheLoginToken(TokenModel token) async {
    return _cacheDSToken(token, SecureKey.authTokenLogin);
  }

  Future<void> _cacheDSToken(TokenModel token, SecureKey secureKey) async {
    if (token.tokenType.isNullOrEmpty) {
      throw MissingDataException('token_type not Found');
    }

    if (token.accessToken.isNullOrEmpty) {
      throw MissingDataException('access_token not Found');
    }

    if (token.expiresIn == null) {
      throw MissingDataException('expires_in not Found');
    }

    await appCache.secure.writeObject(
      key: secureKey,
      object: token,
      toJson: (value) => value.toJson(),
    );
  }

  @override
  Future<bool> hasDeviceToken() async {
    return appCache.secure.containsKey(key: SecureKey.deviceToken);
  }

  @override
  Future<String?> deviceToken() async {
    return await appCache.secure.read(key: SecureKey.deviceToken);
  }

  @override
  Future<TokenModel?> loginToken() async {
    return await appCache.secure.readObject(
      key: SecureKey.authTokenLogin,
      fromJson: (json) => TokenModelMapper.fromJson(json),
    );
  }





  @override
  Future<bool> saveCustomer({required CustomerModel customer, required String userId}) async {
    return appCache.secure.writeObject<CustomerModel>(
      key: SecureKey.csr,
      object: customer,
      toJson: (value) => value.toJson(),
      userId: userId,
    );
  }

  @override
  Future<CustomerModel?> customer() async {
    final userId = await this.userId();
    return await appCache.secure.readObject<CustomerModel>(
      key: SecureKey.csr,
      fromJson: (json) => CustomerModelMapper.fromJson(json),
      userId: userId,
    );
  }

  @override
  Future<void> saveCustMobile({required String mobile, required String userId}) async {
    await appCache.secure.write(key: SecureKey.mb, value: mobile, userId: userId);
  }

  @override
  Future<String?> custMobile() async {
    final userId = await this.userId();
    return await appCache.secure.read(key: SecureKey.mb, userId: userId);
  }

  @override
  Future<void> clearToken() async {
    try {
      await appCache.secure.delete(key: SecureKey.authTokenLogin);
      await appCache.secure.delete(key: SecureKey.authTokenReg);
      await appCache.secure.delete(key: SecureKey.fcmToken);
      await appCache.secure.delete(key: SecureKey.deviceToken);
    } catch (error, stack) {
      logger.cacheError(tag: 'clearToken', error, stack: stack);
      throw SecureStorageException('Failed to clear tokens');
    }
  }

  /// Optional: For logout cleanup
  ///
  @override
  Future<void> clearUserId() async {
    await appCache.secure.delete(key: SecureKey.userHashedId);
  }

  // seril
  @override
  Future<String?> deviceSerialId() {
    return appCache.secure.read(key: SecureKey.ser);
  }

  @override
  Future<void> saveDeviceSerialId({required String serial}) {
    return appCache.secure.write(key: SecureKey.ser, value: serial);
  }
}
