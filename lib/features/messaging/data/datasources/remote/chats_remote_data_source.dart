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
  Future<ChatThreadEntity> ensureThread(ChatThreadEntity thread);
  Future<List<MessageEntity>> fetchMessages(String threadId);
  Stream<List<MessageEntity>> watchMessages(String threadId);
  Future<MessageEntity> sendMessage(String threadId, MessageEntity message);
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
  }) : firestore = firestore ?? FirebaseFirestore.instance,
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
              id: doc.id,
              participantIds: (data['participants'] as List?)
                  ?.whereType<String>()
                  .toList(),
              lastMessage: resolvedMessage,
              unreadCount: (data['unreadCount'] as int?) ?? 0,
              updatedAt: parseFirestoreTimestamp(data['updatedAt']),
              consultationId: data['consultationId'] as String?,
              trainingApplicationId: data['trainingApplicationId'] as String?,
            ),
          );
        }
        return threads;
      },
    );
  }

  @override
  Future<ChatThreadEntity> ensureThread(ChatThreadEntity thread) {
    return firebaseCall<ChatThreadEntity>(
      method: 'ChatsRemoteDataSource.ensureThread',
      logger: logger,
      payload: {
        'threadId': thread.id,
        'consultationId': thread.consultationId,
        'trainingApplicationId': thread.trainingApplicationId,
      },
      call: () async {
        final threadId = thread.id?.trim();
        if (threadId == null || threadId.isEmpty) {
          throw ArgumentError('Missing thread id');
        }
        final participants = (thread.participantIds ?? const <String>[])
            .map((item) => item.trim())
            .where((item) => item.isNotEmpty)
            .toSet()
            .toList();
        if (participants.isEmpty) {
          throw ArgumentError('Missing thread participants');
        }

        final chatData = <String, dynamic>{
          'participants': participants,
          'updatedAt': FieldValue.serverTimestamp(),
        };
        final consultationId = thread.consultationId?.trim();
        if (consultationId != null && consultationId.isNotEmpty) {
          chatData['consultationId'] = consultationId;
        }
        final trainingApplicationId = thread.trainingApplicationId?.trim();
        if (trainingApplicationId != null && trainingApplicationId.isNotEmpty) {
          chatData['trainingApplicationId'] = trainingApplicationId;
        }

        await firestore
            .collection('chats')
            .doc(threadId)
            .set(chatData, SetOptions(merge: true));

        return ChatThreadEntity(
          id: threadId,
          participantIds: participants,
          lastMessage: thread.lastMessage,
          unreadCount: thread.unreadCount,
          updatedAt: thread.updatedAt,
          consultationId: consultationId,
          trainingApplicationId: trainingApplicationId,
        );
      },
    );
  }

  @override
  Future<List<MessageEntity>> fetchMessages(String threadId) {
    return firebaseCall<List<MessageEntity>>(
      method: 'ChatsRemoteDataSource.fetchMessages',
      logger: logger,
      payload: {'threadId': threadId},
      call: () async {
        final snapshot = await firestore
            .collection('chats')
            .doc(threadId)
            .collection('messages')
            .orderBy('sentAt', descending: false)
            .get();
        return snapshot.docs
            .map((doc) => _mapMessageDoc(doc, threadId))
            .toList();
      },
    );
  }

  @override
  Stream<List<MessageEntity>> watchMessages(String threadId) {
    return firestore
        .collection('chats')
        .doc(threadId)
        .collection('messages')
        .orderBy('sentAt', descending: false)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => _mapMessageDoc(doc, threadId))
              .toList();
        });
  }

  @override
  Future<MessageEntity> sendMessage(String threadId, MessageEntity message) {
    return firebaseCall<MessageEntity>(
      method: 'ChatsRemoteDataSource.sendMessage',
      logger: logger,
      payload: {'threadId': threadId},
      call: () async {
        final chatRef = firestore.collection('chats').doc(threadId);
        final messageRef = chatRef.collection('messages').doc();
        final data = <String, dynamic>{
          'senderId': message.senderId,
          'body': message.body,
          'type': message.type.name,
          'sentAt': FieldValue.serverTimestamp(),
          'isRead': false,
          'attachmentUrls': message.attachmentUrls ?? <String>[],
        };
        await messageRef.set(data);
        await chatRef.set({
          'lastMessage': {
            'senderId': message.senderId,
            'body': message.body,
            'type': message.type.name,
            'sentAt': FieldValue.serverTimestamp(),
            'isRead': false,
            'attachmentUrls': message.attachmentUrls ?? <String>[],
          },
          'updatedAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
        return MessageEntity(
          id: messageRef.id,
          threadId: threadId,
          senderId: message.senderId,
          body: message.body,
          type: message.type,
        );
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
      attachmentUrls: (value['attachmentUrls'] as List?)
          ?.whereType<String>()
          .toList(),
    );
  }

  MessageEntity _mapMessageDoc(
    QueryDocumentSnapshot<Map<String, dynamic>> doc,
    String threadId,
  ) {
    final data = doc.data();
    return MessageEntity(
      id: doc.id,
      threadId: threadId,
      senderId: data['senderId'] as String?,
      body: data['body'] as String?,
      type: _parseType(data['type'] as String?),
      sentAt: parseFirestoreTimestamp(data['sentAt']),
      isRead: data['isRead'] as bool? ?? false,
      attachmentUrls: (data['attachmentUrls'] as List?)
          ?.whereType<String>()
          .toList(),
    );
  }

  Future<MessageEntity?> _fetchLastMessage(
    DocumentReference<Map<String, dynamic>> chatRef,
  ) async {
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
      attachmentUrls: (data['attachmentUrls'] as List?)
          ?.whereType<String>()
          .toList(),
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
