import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/features/notifications/data/datasources/remote/notifications_remote_data_source.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_result.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_result_extensions.dart';
import 'package:silah_app/features/notifications/domain/repositories/notification_repository.dart';

class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationsRemoteDataSource remoteDataSource;
  final Executor executor;

  NotificationsRepositoryImpl({
    required this.remoteDataSource,
    required this.executor,
  });

  @override
  Future<Either<Failure, NotificationResult>> fetchNotifications() {
    return executor.runOnline(() async {
      final response = await remoteDataSource.fetchNotifications();
      return response.toEntity().sortedByNewest();
    }, from: 'NotificationsRepository.fetchNotifications');
  }

  @override
  Future<Either<Failure, void>> markAllNotificationsAsSeen() {
    return executor.runOnline(() async {
      await remoteDataSource.markAllNotificationsAsSeen();
      return;
    }, from: 'NotificationsRepository.markAllNotificationsAsSeen');
  }
}
