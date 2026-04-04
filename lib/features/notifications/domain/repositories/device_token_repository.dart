import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';

abstract class DeviceTokenRepository {
  Future<Either<Failure, bool>> registerDeviceFcmToken({
    required String deviceFcmToken,
    String? platform,
  });
}
