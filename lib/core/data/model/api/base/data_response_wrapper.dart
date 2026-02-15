import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/data/model/api/base/response_wrapper.dart';
import 'package:silah_app/core/data/model/api/data_model.dart';
import 'package:silah_app/core/data/model/api/result_model.dart';

part 'data_response_wrapper.mapper.dart';

@MappableClass(ignoreNull: true)
class DataRespWrapper<D extends DataModel> extends BaseRespWrapper with DataRespWrapperMappable {
  @MappableField(key: 'Data')
  final D? data;

  const DataRespWrapper({required super.result, required this.data});
}
