import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_result.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, NotificationResult>> fetchNotifications();

  Future<Either<Failure, void>> markAllNotificationsAsSeen();
}
