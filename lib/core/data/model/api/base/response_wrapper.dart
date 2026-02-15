import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/data/model/api/result_model.dart';

part 'response_wrapper.mapper.dart';

@MappableClass(ignoreNull: true)
class BaseRespWrapper with BaseRespWrapperMappable {
  @MappableField(key: 'Result')
  final ResultModel? result;

  const BaseRespWrapper({required this.result});
}
