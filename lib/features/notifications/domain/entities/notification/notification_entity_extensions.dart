import 'notification_entity.dart';

extension NotificationEntityX on NotificationEntity {
  DateTime? get parsedTimestamp {
    final value = timestamp?.trim();
    if (value == null || value.isEmpty) {
      return null;
    }
    return DateTime.tryParse(value);
  }

  DateTime? get localTimestamp => parsedTimestamp?.toLocal();
}
