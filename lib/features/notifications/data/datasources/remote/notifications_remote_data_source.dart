import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/decoders/api_json_decoder.dart';
import 'package:silah_app/features/notifications/data/models/notification/notification_model.dart';

import 'notifications_service.dart';

abstract class NotificationsRemoteDataSource {
  Future<BaseApiResponse<NotificationsResponseModel>> fetchNotifications();
  Future<BaseApiResponse<NotificationsSeenResponseModel>>
  markAllNotificationsAsSeen();
}

class NotificationsRemoteDataSourceImpl
    implements NotificationsRemoteDataSource {
  final NotificationsService notificationsService;
  final AppLogger logger;

  NotificationsRemoteDataSourceImpl({
    required this.notificationsService,
    required this.logger,
  });

  @override
  Future<BaseApiResponse<NotificationsResponseModel>> fetchNotifications() =>
      handleBaseApiResponse<NotificationsResponseModel>(
        method: 'NotificationsRemoteDataSource.fetchNotifications',
        logger: logger,
        call: notificationsService.fetchNotifications,
      );

  @override
  Future<BaseApiResponse<NotificationsSeenResponseModel>>
  markAllNotificationsAsSeen() =>
      handleBaseApiResponse<NotificationsSeenResponseModel>(
        method: 'NotificationsRemoteDataSource.markAllNotificationsAsSeen',
        logger: logger,
        call: notificationsService.markAllNotificationsAsSeen,
      );
}
