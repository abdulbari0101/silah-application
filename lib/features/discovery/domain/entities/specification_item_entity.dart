import 'package:dart_mappable/dart_mappable.dart';

part 'specification_item_entity.mapper.dart';

@MappableClass()
class SpecificationItemEntity with SpecificationItemEntityMappable {
  final String? name;

  const SpecificationItemEntity({this.name});
}
