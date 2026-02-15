import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:uuid/uuid.dart';

abstract class DeviceSerialService {
  Future<Either<Failure, String>> create();
}

class DeviceSerialServiceImpl implements DeviceSerialService {
  DeviceSerialServiceImpl({required DeviceInfoPlugin deviceInfo}) : _deviceInfo = deviceInfo;

  final DeviceInfoPlugin _deviceInfo;

  @override
  Future<Either<Failure, String>> create() async {
    try {
      // Generate
      final serial = await _generate();

      return Right(serial);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<String> _generate() async {
    final uuidPart = const Uuid().v4();
    final info = await _deviceInfoStringOrNull();

    if (info == null || info.isEmpty) {
      return uuidPart;
    }

    final hashPart = sha256.convert(info.codeUnits).toString().substring(0, 8);
    return '$uuidPart-$hashPart';
  }

  Future<String?> _deviceInfoStringOrNull() async {
    try {
      if (Platform.isAndroid) {
        final a = await _deviceInfo.androidInfo;
        return '${a.id}${a.model}${a.product}';
      } else if (Platform.isIOS) {
        final i = await _deviceInfo.iosInfo;
        return '${i.identifierForVendor}${i.model}${i.utsname.machine}';
      }
      return null;
    } catch (_) {
      return null;
    }
  }
}
