import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/data/model/api/base/response_wrapper.dart';
import 'package:silah_app/core/data/model/api/result_model.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_entity.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_result.dart';

part 'notification_model.mapper.dart';

@MappableClass(ignoreNull: true)
class NotificationModel with NotificationModelMappable {
  @MappableField(key: 'notificationId')
  final String? id;

  final String? type;

  final String? timestamp;

  final String? title;

  final String? message;

  final Map<String, dynamic>? data;

  @MappableField(key: 'isSeen')
  final bool isSeen;

  const NotificationModel({
    this.id,
    this.type,
    this.timestamp,
    this.title,
    this.message,
    this.data,
    this.isSeen = false,
  });

  NotificationEntity toEntity() => NotificationEntity(
    id: id,
    type: type,
    timestamp: timestamp,
    title: title,
    message: message,
    data: data,
    isSeen: isSeen,
  );
}

@MappableClass(ignoreNull: true)
class NotificationsResponseModel extends BaseRespWrapper
    with NotificationsResponseModelMappable {
  final List<NotificationModel>? notifications;
  final int? unSeenCount;

  const NotificationsResponseModel({
    required super.result,
    this.notifications,
    this.unSeenCount,
  });

  NotificationResult toEntity() {
    final items =
        notifications?.map((item) => item.toEntity()).toList(growable: false) ??
        const <NotificationEntity>[];
    final fallbackUnSeenCount = items
        .where((notification) => notification.isSeen == false)
        .length;
    return NotificationResult(
      unSeenCount: unSeenCount ?? fallbackUnSeenCount,
      notifications: items,
    );
  }
}

@MappableClass(ignoreNull: true)
class NotificationsSeenResponseModel extends BaseRespWrapper
    with NotificationsSeenResponseModelMappable {
  final int? updatedCount;

  const NotificationsSeenResponseModel({
    required super.result,
    this.updatedCount,
  });
}
