import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/features/messaging/domain/entities/chat_item_entity.dart';

part 'chat_item_model.mapper.dart';

@MappableClass(ignoreNull: true)
class ChatItemModel with ChatItemModelMappable {
  @MappableField(key: 'NAME')
  final String? name;

  const ChatItemModel({this.name});

  ChatItemEntity toEntity() => ChatItemEntity(name: name);

  factory ChatItemModel.fromEntity(ChatItemEntity entity) => ChatItemModel(name: entity.name);
}
