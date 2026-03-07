import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_entity.dart';

part 'notification_result.mapper.dart';

@MappableClass()
class NotificationResult with NotificationResultMappable {
  final int unSeenCount;
  final List<NotificationEntity> notifications;

  const NotificationResult({
    required this.unSeenCount,
    required this.notifications,
  });
}
