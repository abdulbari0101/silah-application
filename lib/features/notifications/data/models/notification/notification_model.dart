import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_entity.dart';

part 'notification_model.mapper.dart';

@MappableClass(ignoreNull: true)
class NotificationModel with NotificationModelMappable {
  @MappableField(key: 'DATEIN')
  final String? timestamp;

  @MappableField(key: 'SERVICENO')
  final int? serviceNo;

  @MappableField(key: 'LANGNO')
  final int? languageCode;

  @MappableField(key: 'MESSAGE')
  final String? message;

  @MappableField(key: 'local_id')
  final int? id; // for db primary key

  @MappableField(key: 'local_user_id')
  final String? userId; // hide it from entity , keep private handled in data layer exactly in db_source

  @MappableField(key: 'isSeen')
  final bool isSeen;

  const NotificationModel({
    this.timestamp,
    this.serviceNo,
    this.languageCode,
    this.message,
    this.id,
    this.userId,
    this.isSeen = false,
  });

  NotificationEntity toEntity() => NotificationEntity(
    timestamp: timestamp,
    id: id,
    languageCode: languageCode,
    message: message,
    serviceNo: serviceNo,

    isSeen: isSeen,
  );

  factory NotificationModel.fromEntity(NotificationEntity entity) => NotificationModel(
    id: entity.id,
    timestamp: entity.timestamp,
    languageCode: entity.languageCode,
    message: entity.message,
    serviceNo: entity.serviceNo,
    isSeen: entity.isSeen,
  );
}
