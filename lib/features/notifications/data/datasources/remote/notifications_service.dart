import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:silah_app/core/infrastructure/network/adapters/json_body_mappable_adapter.dart';

part 'notifications_service.g.dart';

@RestApi(parser: Parser.JsonSerializable, callAdapter: JsonBodyMappableAdapter)
abstract class NotificationsService {
  factory NotificationsService(Dio dio, {String? baseUrl}) =
      _NotificationsService;
}
