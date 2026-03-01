import 'package:dart_mappable/dart_mappable.dart';
part 'notification_entity.mapper.dart';

@MappableClass()
class NotificationEntity with NotificationEntityMappable {
  final String? timestamp;
  final int? serviceNo; // you can hide it if you mapped the name in data layer
  final String?
  operationName; //  mapped from the service code if not found hide the title
  final int? languageCode;
  final String? message;
  final int? id;
  final bool isSeen;

  const NotificationEntity({
    this.timestamp,
    this.serviceNo,
    this.operationName,
    this.languageCode,
    this.message,
    this.id,
    this.isSeen = false,
  });
}
