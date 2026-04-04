import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/data/model/api/base/response_wrapper.dart';
import 'package:silah_app/core/data/model/api/result_model.dart';

part 'auth_role_models.mapper.dart';

@MappableClass(ignoreNull: true)
class RoleSyncResponseModel extends BaseRespWrapper
    with RoleSyncResponseModelMappable {
  final String? role;

  const RoleSyncResponseModel({required super.result, this.role});
}
