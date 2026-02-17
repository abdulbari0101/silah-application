import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/features/consultations/domain/entities/request_item_entity.dart';

part 'request_item_model.mapper.dart';

@MappableClass(ignoreNull: true)
class RequestItemModel with RequestItemModelMappable {
  @MappableField(key: 'NAME')
  final String? name;

  const RequestItemModel({this.name});

  RequestItemEntity toEntity() => RequestItemEntity(name: name);

  factory RequestItemModel.fromEntity(RequestItemEntity entity) =>
      RequestItemModel(name: entity.name);
}
