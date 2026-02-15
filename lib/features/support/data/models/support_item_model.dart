import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/features/support/domain/entities/support_item_entity.dart';

part 'support_item_model.mapper.dart';

@MappableClass(ignoreNull: true)
class SupportItemModel with SupportItemModelMappable {
  @MappableField(key: 'NAME')
  final String? name;

  const SupportItemModel({this.name});

  SupportItemEntity toEntity() => SupportItemEntity(name: name);

  factory SupportItemModel.fromEntity(SupportItemEntity entity) =>
      SupportItemModel(name: entity.name);
}
