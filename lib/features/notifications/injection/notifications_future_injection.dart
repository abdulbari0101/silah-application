import 'package:silah_app/core/config/constants/api_constants.dart';
import 'package:silah_app/core/infrastructure/network/dio_client.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/notifications/data/datasources/remote/device_token_remote_data_source.dart';
import 'package:silah_app/features/notifications/data/datasources/remote/device_token_service.dart';
import 'package:silah_app/features/notifications/data/datasources/remote/notifications_remote_data_source.dart';
import 'package:silah_app/features/notifications/data/datasources/remote/notifications_service.dart';
import 'package:silah_app/features/notifications/data/repositories/device_token_repository_impl.dart';
import 'package:silah_app/features/notifications/data/repositories/notifications_repository_impl.dart';
import 'package:silah_app/features/notifications/domain/repositories/device_token_repository.dart';
import 'package:silah_app/features/notifications/domain/repositories/notification_repository.dart';

// ! Features - Notifications

Future<void> initNotifications() async {
  // Data sources
  locator.registerLazySingleton<NotificationsRemoteDataSource>(
    () => NotificationsRemoteDataSourceImpl(
      notificationsService: locator(),
      logger: locator(),
    ),
  );

  locator.registerLazySingleton<DeviceTokenRemoteDataSource>(
    () =>
        DeviceTokenRemoteDataSourceImpl(service: locator(), logger: locator()),
  );

  locator.registerLazySingleton<DeviceTokenRepository>(
    () => DeviceTokenRepositoryImpl(
      remoteDataSource: locator(),
      executor: locator(),
    ),
  );

  locator.registerLazySingleton<NotificationsRepository>(
    () => NotificationsRepositoryImpl(
      remoteDataSource: locator(),
      executor: locator(),
    ),
  );

  // Services
  locator.registerLazySingleton(
    () => NotificationsService(
      locator<DioClient>().dio,
      baseUrl: ApiConstants.baseUrl,
    ),
  );

  locator.registerLazySingleton(
    () => DeviceTokenService(
      locator<DioClient>().dio,
      baseUrl: ApiConstants.baseUrl,
    ),
  );
}
