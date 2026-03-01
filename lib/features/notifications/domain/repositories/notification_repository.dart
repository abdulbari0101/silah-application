import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_entity.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_result.dart';

/// Repo interface for managing favorite operations and syncing static services.
abstract class NotifyRepo {
  /// Called after login to get all unseen server-side notifications.
  /// Saved in DB with `isSeen = false`, and will be reflected in the UI via stream sync.
  Future<Either<Failure, void>> syncAllUnseenNotifications();

  /// Called after any successful operation to check if there are new notifications in server-side.
  /// If found, they are saved in DB with `isSeen = false` and shown  real device notification.
  Future<Either<Failure, NotificationEntity?>> fetchNewOperationNotification();

  /// Returns a stream of all notifications (seen and unseen), grouped by date.
  /// Used to populate notification screen and unseen counter.
  Stream<NotificationResult> observeAllNotifications();

  /// Marks all notifications as seen when user closes or exits the notifications screen.
  Future<Either<Failure, void>> markAllNotificationsAsSeen();

  Future<Either<Failure, void>> tempSaveSeenNotifications(
    List<NotificationEntity> notifications,
  );

  /// Deletes all notifications from local database.
  Future<Either<Failure, void>> clearAllNotifications();

  /// Deletes a specific notification by its local ID.
  Future<Either<Failure, void>> removeNotificationById(int id);

  /////////////////////////////////////////////////////////
}
