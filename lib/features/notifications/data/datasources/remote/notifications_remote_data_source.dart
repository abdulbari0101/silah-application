import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';

import 'notifications_service.dart';

abstract class NotificationsRemoteDataSource {}

class NotificationsRemoteDataSourceImpl
    implements NotificationsRemoteDataSource {
  final NotificationsService notificationsService;
  final AppLogger logger;

  NotificationsRemoteDataSourceImpl({
    required this.notificationsService,
    required this.logger,
  });
}
