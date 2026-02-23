import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:silah_app/core/infrastructure/network/adapters/json_body_mappable_adapter.dart';


part 'intro_service.g.dart';

@RestApi(parser: Parser.JsonSerializable, callAdapter: JsonBodyMappableAdapter)
abstract class IntroService {
  factory IntroService(Dio dio, {String? baseUrl}) = _IntroService;

}
