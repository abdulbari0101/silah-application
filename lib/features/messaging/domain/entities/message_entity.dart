import 'package:dart_mappable/dart_mappable.dart';

import 'message_type.dart';

part 'message_entity.mapper.dart';

@MappableClass()
class MessageEntity with MessageEntityMappable {
  final String? id;
  final String? threadId;
  final String? senderId;
  final String? body;
  final MessageType type;
  final String? sentAt;
  final bool isRead;
  final List<String>? attachmentUrls;

  const MessageEntity({
    this.id,
    this.threadId,
    this.senderId,
    this.body,
    this.type = MessageType.text,
    this.sentAt,
    this.isRead = false,
    this.attachmentUrls,
  });
}
