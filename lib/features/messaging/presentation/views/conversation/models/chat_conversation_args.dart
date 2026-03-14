import 'package:silah_app/features/messaging/domain/entities/chat_thread_entity.dart';

class ChatConversationArgs {
  final ChatThreadEntity thread;

  const ChatConversationArgs({required this.thread});

  Map<String, dynamic> toJson() {
    return {'thread': thread.toJson()};
  }

  static ChatConversationArgs? fromExtra(Object? extra) {
    if (extra is ChatConversationArgs) {
      return extra;
    }
    if (extra is Map) {
      final rawThread = extra['thread'];
      if (rawThread is Map) {
        return ChatConversationArgs(
          thread: ChatThreadEntityMapper.fromJson(
            Map<String, dynamic>.from(rawThread),
          ),
        );
      }
    }
    return null;
  }
}
