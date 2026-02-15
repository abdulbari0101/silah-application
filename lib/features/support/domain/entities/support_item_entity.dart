import 'package:dart_mappable/dart_mappable.dart';

part 'support_item_entity.mapper.dart';

@MappableClass()
class SupportItemEntity with SupportItemEntityMappable {
  final String? name;

  const SupportItemEntity({this.name});
}
