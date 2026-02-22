import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';

abstract class DeviceTokenRepository {
  Future<Either<Failure, bool>> registerDeviceToken({
    required String deviceToken,
    String? platform,
  });
}
