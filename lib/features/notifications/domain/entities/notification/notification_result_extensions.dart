import 'notification_entity.dart';
import 'notification_entity_extensions.dart';
import 'notification_result.dart';

extension NotificationResultX on NotificationResult {
  bool get isEmpty => notifications.isEmpty;

  NotificationResult sortedByNewest() {
    final sortedNotifications = List<NotificationEntity>.from(notifications)
      ..sort((a, b) {
        final left =
            a.parsedTimestamp ?? DateTime.fromMillisecondsSinceEpoch(0);
        final right =
            b.parsedTimestamp ?? DateTime.fromMillisecondsSinceEpoch(0);
        return right.compareTo(left);
      });
    return copyWith(
      notifications: sortedNotifications,
      unSeenCount: _unseenCount(sortedNotifications),
    );
  }

  NotificationResult markAllSeenLocally() {
    final updatedNotifications = notifications
        .map(
          (notification) => notification.isSeen
              ? notification
              : notification.copyWith(isSeen: true),
        )
        .toList(growable: false);
    return copyWith(notifications: updatedNotifications, unSeenCount: 0);
  }

  int _unseenCount(List<NotificationEntity> items) {
    return items.where((notification) => notification.isSeen == false).length;
  }
}
