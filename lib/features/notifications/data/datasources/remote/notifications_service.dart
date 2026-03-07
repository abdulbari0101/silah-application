import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/network/adapters/json_body_mappable_adapter.dart';
import 'package:silah_app/features/notifications/data/models/notification/notification_model.dart';

part 'notifications_service.g.dart';

@RestApi(parser: Parser.JsonSerializable, callAdapter: JsonBodyMappableAdapter)
abstract class NotificationsService {
  factory NotificationsService(Dio dio, {String? baseUrl}) =
      _NotificationsService;

  @GET('/notifications')
  Future<BaseApiResponse<NotificationsResponseModel>> fetchNotifications();

  @PATCH('/notifications/seen')
  Future<BaseApiResponse<NotificationsSeenResponseModel>>
  markAllNotificationsAsSeen();
}
