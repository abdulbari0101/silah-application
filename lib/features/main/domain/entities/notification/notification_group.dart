import 'package:dart_mappable/dart_mappable.dart';
import 'notification_entity.dart';

part 'notification_group.mapper.dart';
@MappableClass()
class NotificationGroup with NotificationGroupMappable {
  final String headerDate;
  final List<NotificationEntity>? notifications;

  const NotificationGroup({required this.headerDate, this.notifications});

  
}
