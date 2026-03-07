import 'package:dart_mappable/dart_mappable.dart';
part 'notification_entity.mapper.dart';

@MappableClass()
class NotificationEntity with NotificationEntityMappable {
  final String? id;
  final String? type;
  final String? timestamp;
  final String? title;
  final String? message;
  final Map<String, dynamic>? data;
  final bool isSeen;

  const NotificationEntity({
    this.id,
    this.type,
    this.timestamp,
    this.title,
    this.message,
    this.data,
    this.isSeen = false,
  });
}
