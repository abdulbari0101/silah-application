import 'package:dart_mappable/dart_mappable.dart';

import 'message_entity.dart';

part 'chat_thread_entity.mapper.dart';

@MappableClass()
class ChatThreadEntity with ChatThreadEntityMappable {
  final int? id;
  final List<String>? participantIds;
  final MessageEntity? lastMessage;
  final int unreadCount;
  final String? updatedAt;

  const ChatThreadEntity({
    this.id,
    this.participantIds,
    this.lastMessage,
    this.unreadCount = 0,
    this.updatedAt,
  });
}
