import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:silah_app/core/data/model/api/base/base_api_response.dart';
import 'package:silah_app/core/infrastructure/network/adapters/json_body_mappable_adapter.dart';
import 'package:silah_app/features/auth/data/models/auth_role_models.dart';

part 'auth_role_service.g.dart';

@RestApi(parser: Parser.JsonSerializable, callAdapter: JsonBodyMappableAdapter)
abstract class AuthRoleService {
  factory AuthRoleService(Dio dio, {String? baseUrl}) = _AuthRoleService;

  @POST('/auth/sync-role')
  Future<BaseApiResponse<RoleSyncResponseModel>> syncRole(
    @Header('Authorization') String authorization,
  );
}
