import 'package:silah_app/core/config/constants/api_constants.dart';
import 'package:silah_app/core/infrastructure/network/dio_client.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/notifications/data/datasources/local/notifications_cache_data_source.dart';
import 'package:silah_app/features/notifications/data/datasources/remote/notifications_remote_data_source.dart';
import 'package:silah_app/features/notifications/data/datasources/remote/notifications_service.dart';

// ! Features - Notifications

Future<void> initNotifications() async {
  // Data sources
  locator.registerLazySingleton<NotificationsCacheDataSource>(
    () => NotificationsCacheDataSourceImpl(
      logger: locator(),
      appCache: locator(),
      identityReader: locator(),
    ),
  );

  locator.registerLazySingleton<NotificationsRemoteDataSource>(
    () => NotificationsRemoteDataSourceImpl(
      notificationsService: locator(),
      logger: locator(),
    ),
  );

  // Services
  locator.registerLazySingleton(
    () => NotificationsService(locator<DioClient>().dio, baseUrl: ApiConstants.baseUrl),
  );
}
