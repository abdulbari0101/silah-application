import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:silah_app/core/data/local/cache/readers/auth_readers.dart';
import 'package:silah_app/core/domain/entities/api/auth/customer_entity.dart';
import 'package:silah_app/core/foundation/formatting/phone_utils.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/platform/device_serial_service.dart';
import 'package:silah_app/features/auth/data/datasources/local/auth_cache_data_source.dart';
import 'package:silah_app/features/auth/domain/repositories/identity_base_repo.dart';

class IdentityRepoImpl implements AuthIdentityRepo {
  final AuthCacheDataSource _cacheDS; // persists serial & userId
  final SesstionReader _sessionReader; // device token, login tokens
  final DeviceSerialService _deviceSerialService; // creates serial on first run
  final AppLogger _log;

  IdentityRepoImpl({
    required AuthCacheDataSource cacheDS,
    required IdentityReader identityReader,
    required SesstionReader sessionReader,
    required DeviceSerialService deviceSerialService,
    required AppLogger logger,
  }) : _cacheDS = cacheDS,
       _sessionReader = sessionReader,
       _deviceSerialService = deviceSerialService,
       _log = logger;

  @override
  Future<String?> deviceId() => _cacheDS.deviceSerialId();

  @override
  Future<void> saveDeviceId(String serial) => _cacheDS.saveDeviceSerialId(serial: serial);

  @override
  Future<String?> userId() => _cacheDS.userId();

  @override
  Future<String> generateAndSaveUserId(CustomerEntity customer) async {
    final rawValue = customer.cCode ?? customer.shortCode ?? customer.mobileNo ?? '';
    final userId = _generateCode(rawValue);
    await _cacheDS.saveUserId(userId: userId);
    return userId;
  }

  String _generateCode(String value) {
    final bytes = utf8.encode(value);
    return sha256.convert(bytes).toString();
  }

  @override
  Future<String> getOrCreateDeviceId() async {
    final existing = await _cacheDS.deviceSerialId();
    if (existing != null && existing.isNotEmpty) return existing;

    final either = await _deviceSerialService.create(); // returns Either<Failure,String>
    return either.fold(
      (err) {
        _log.appError(tag: 'IdentityRepo.getOrCreateDeviceId', err);
        throw err; // bubble Failure as exception—your Executor will map it
      },
      (serial) async {
        await _cacheDS.saveDeviceSerialId(serial: serial);
        return serial;
      },
    );
  }

  @override
  Future<bool> isLoginFromNewDevice(String mobile) async {
    final cachedMobile = (await _cacheDS.custMobile())?.normalizePhone();

    if (cachedMobile != mobile) return true;

    final hasToken = await _sessionReader.hasDeviceToken();
    return !hasToken;
  }

  @override
  Future<String> generateIMI() async {
    final serial = await getOrCreateDeviceId();

    return "$serial";
  }

}
