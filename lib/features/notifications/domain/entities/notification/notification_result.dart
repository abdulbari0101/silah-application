import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_group.dart';

part 'notification_result.mapper.dart';

@MappableClass()
class NotificationResult with NotificationResultMappable {
  final int unSeenCount;
  final List<NotificationGroup>? groups;

  const NotificationResult({required this.unSeenCount, this.groups});
}
