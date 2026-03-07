import 'package:flutter/material.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_entity.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_entity_extensions.dart';

class NotificationTimestampPresenter {
  const NotificationTimestampPresenter._();

  static String? format(BuildContext context, NotificationEntity notification) {
    final local = notification.localTimestamp;
    if (local == null) {
      return null;
    }
    final materialLocalizations = MaterialLocalizations.of(context);
    final date = materialLocalizations.formatShortDate(local);
    final time = materialLocalizations.formatTimeOfDay(
      TimeOfDay.fromDateTime(local),
    );
    return '$date $time';
  }
}
