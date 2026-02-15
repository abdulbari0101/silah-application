import 'package:dart_mappable/dart_mappable.dart';

part 'chat_item_entity.mapper.dart';

@MappableClass()
class ChatItemEntity with ChatItemEntityMappable {
  final String? name;

  const ChatItemEntity({this.name});
}
