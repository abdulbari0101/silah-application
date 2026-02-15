import 'package:dart_mappable/dart_mappable.dart';

part 'request_item_entity.mapper.dart';

@MappableClass()
class RequestItemEntity with RequestItemEntityMappable {
  final String? name;

  const RequestItemEntity({this.name});
}
