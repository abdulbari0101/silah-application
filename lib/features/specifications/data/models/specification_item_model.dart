import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/features/specifications/domain/entities/specification_item_entity.dart';

part 'specification_item_model.mapper.dart';

@MappableClass(ignoreNull: true)
class SpecificationItemModel with SpecificationItemModelMappable {
  @MappableField(key: 'NAME')
  final String? name;

  const SpecificationItemModel({this.name});

  SpecificationItemEntity toEntity() => SpecificationItemEntity(name: name);

  factory SpecificationItemModel.fromEntity(SpecificationItemEntity entity) =>
      SpecificationItemModel(name: entity.name);
}
