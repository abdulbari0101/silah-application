import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/platform/device_info_helper.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/messaging/data/datasources/local/chats_local_data_source.dart';
import 'package:silah_app/features/messaging/data/datasources/remote/chats_remote_data_source.dart';
import 'package:silah_app/features/messaging/domain/entities/chat_thread_entity.dart';
import 'package:silah_app/features/messaging/domain/entities/message_entity.dart';
import 'package:silah_app/features/messaging/domain/repositories/messaging_repository.dart';

class MessagingRepositoryoImpl implements MessagingRepository {
  final ChatsRemoteDataSource remoteDS;
  final ChatsLocalDataSource localDS;
  final DeviceInfoHelper deviceInfoHelper;

  final Executor executor;

  final AppLogger logger = locator.get<AppLogger>();

  MessagingRepositoryoImpl({
    required this.remoteDS,
    required this.localDS,
    required this.executor,
    required this.deviceInfoHelper,
  });

  @override
  Future<Either<Failure, List<MessageEntity>>> fetchMessages(String threadId) {
    return executor.runOnline(() async {
      return remoteDS.fetchMessages(threadId);
    }, from: 'MessagingRepository.fetchMessages');
  }

  @override
  Stream<List<MessageEntity>> watchMessages(String threadId) {
    return remoteDS.watchMessages(threadId);
  }

  @override
  Future<Either<Failure, List<ChatThreadEntity>>> fetchThreads() {
    return executor.runOnline(() async {
      return remoteDS.fetchThreads();
    }, from: 'MessagingRepository.fetchThreads');
  }

  @override
  Future<Either<Failure, ChatThreadEntity>> ensureThread(
    ChatThreadEntity thread,
  ) {
    return executor.runOnline(() async {
      final threadId = thread.id?.trim();
      if (threadId == null || threadId.isEmpty) {
        throw const MissingDataException('Missing thread id');
      }
      final participants = (thread.participantIds ?? const <String>[])
          .map((item) => item.trim())
          .where((item) => item.isNotEmpty)
          .toList();
      if (participants.isEmpty) {
        throw const MissingDataException('Missing thread participants');
      }
      return remoteDS.ensureThread(
        thread.copyWith(id: threadId, participantIds: participants),
      );
    }, from: 'MessagingRepository.ensureThread');
  }

  @override
  Future<Either<Failure, MessageEntity>> sendMessage(MessageEntity message) {
    return executor.runOnline(() async {
      final threadId = message.threadId;
      if (threadId == null || threadId.isEmpty) {
        throw const MissingDataException('Missing thread id');
      }
      return remoteDS.sendMessage(threadId, message);
    }, from: 'MessagingRepository.sendMessage');
  }
}
