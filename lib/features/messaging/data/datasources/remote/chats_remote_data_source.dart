import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/firebase_call.dart';
import 'package:silah_app/core/infrastructure/network/firestore_helpers.dart';
import 'package:silah_app/features/messaging/domain/entities/chat_thread_entity.dart';
import 'package:silah_app/features/messaging/domain/entities/message_entity.dart';
import 'package:silah_app/features/messaging/domain/entities/message_type.dart';

import 'chats_service.dart';

abstract class ChatsRemoteDataSource {
  Future<List<ChatThreadEntity>> fetchThreads();
}

class ChatsRemoteDataSourceImpl implements ChatsRemoteDataSource {
  final ChatsService chatsService;
  final AppLogger logger;
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  ChatsRemoteDataSourceImpl({
    required this.chatsService,
    required this.logger,
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : firestore = firestore ?? FirebaseFirestore.instance,
        auth = auth ?? FirebaseAuth.instance;

  @override
  Future<List<ChatThreadEntity>> fetchThreads() {
    return firebaseCall<List<ChatThreadEntity>>(
      method: 'ChatsRemoteDataSource.fetchThreads',
      logger: logger,
      call: () async {
        final uid = auth.currentUser?.uid;
        if (uid == null) {
          return [];
        }

        final snapshot = await firestore
            .collection('chats')
            .where('participants', arrayContains: uid)
            .orderBy('updatedAt', descending: true)
            .get();

        final threads = <ChatThreadEntity>[];
        for (final doc in snapshot.docs) {
          final data = doc.data();
          final lastMessage = _parseLastMessage(data['lastMessage']);
          final resolvedMessage =
              lastMessage ?? await _fetchLastMessage(doc.reference);
          threads.add(
            ChatThreadEntity(
              participantIds: (data['participants'] as List?)?.whereType<String>().toList(),
              lastMessage: resolvedMessage,
              unreadCount: (data['unreadCount'] as int?) ?? 0,
              updatedAt: parseFirestoreTimestamp(data['updatedAt']),
            ),
          );
        }
        return threads;
      },
    );
  }

  MessageEntity? _parseLastMessage(dynamic value) {
    if (value is! Map) return null;
    return MessageEntity(
      senderId: value['senderId'] as String?,
      body: value['body'] as String?,
      type: _parseType(value['type'] as String?),
      sentAt: parseFirestoreTimestamp(value['sentAt']),
      isRead: value['isRead'] as bool? ?? false,
      attachmentUrls: (value['attachmentUrls'] as List?)?.whereType<String>().toList(),
    );
  }

  Future<MessageEntity?> _fetchLastMessage(DocumentReference<Map<String, dynamic>> chatRef) async {
    final snapshot = await chatRef
        .collection('messages')
        .orderBy('sentAt', descending: true)
        .limit(1)
        .get();
    if (snapshot.docs.isEmpty) {
      return null;
    }
    final data = snapshot.docs.first.data();
    return MessageEntity(
      senderId: data['senderId'] as String?,
      body: data['body'] as String?,
      type: _parseType(data['type'] as String?),
      sentAt: parseFirestoreTimestamp(data['sentAt']),
      isRead: data['isRead'] as bool? ?? false,
      attachmentUrls: (data['attachmentUrls'] as List?)?.whereType<String>().toList(),
    );
  }

  MessageType _parseType(String? value) {
    switch (value?.toLowerCase()) {
      case 'image':
        return MessageType.image;
      case 'file':
        return MessageType.file;
      case 'system':
        return MessageType.system;
      case 'text':
      default:
        return MessageType.text;
    }
  }
}
