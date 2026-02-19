import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/features/messaging/domain/entities/chat_thread_entity.dart';
import 'package:silah_app/features/messaging/domain/entities/message_entity.dart';

abstract class MessagingRepository {
  Future<Either<Failure, List<ChatThreadEntity>>> fetchThreads();

  Future<Either<Failure, List<MessageEntity>>> fetchMessages(int threadId);

  Future<Either<Failure, MessageEntity>> sendMessage(MessageEntity message);
}
