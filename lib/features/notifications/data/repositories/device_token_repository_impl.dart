import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/features/notifications/data/datasources/remote/device_token_remote_data_source.dart';
import 'package:silah_app/features/notifications/data/models/device_token_models.dart';
import 'package:silah_app/features/notifications/domain/repositories/device_token_repository.dart';

class DeviceTokenRepositoryImpl implements DeviceTokenRepository {
  final DeviceTokenRemoteDataSource remoteDataSource;
  final Executor executor;

  DeviceTokenRepositoryImpl({required this.remoteDataSource, required this.executor});

  @override
  Future<Either<Failure, bool>> registerDeviceFcmToken({required String deviceFcmToken, String? platform}) {
    return executor.runOnline(() async {
      await remoteDataSource.registerDeviceFcmToken(
        DeviceTokenRequestModel(deviceFcmToken: deviceFcmToken, platform: platform),
      );
      return true;
    }, from: 'DeviceTokenRepository.registerDeviceFcmToken');
  }
}
