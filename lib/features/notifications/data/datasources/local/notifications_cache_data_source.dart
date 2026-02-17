import 'package:silah_app/core/data/local/cache/app_cache.dart';
import 'package:silah_app/core/data/local/cache/base/key_value_store_ex.dart';
import 'package:silah_app/core/data/local/cache/prefs/prefs_key.dart';
import 'package:silah_app/core/data/local/cache/readers/auth_readers.dart';
import 'package:silah_app/features/notifications/data/models/notification/notification_model.dart';

import '../../../../../core/infrastructure/analytics/logger/app_logger.dart';

abstract class NotificationsCacheDataSource {
  Future<void> savePendingSeenNotifications(List<NotificationModel> notifications);
  Future<List<String>> getPendingSeenNotificationIds();
}

class NotificationsCacheDataSourceImpl extends NotificationsCacheDataSource {
  final AppCache appCache;
  final AppLogger logger;

  final IdentityReader identityReader;
  NotificationsCacheDataSourceImpl({
    required this.logger,
    required this.identityReader,
    required this.appCache,
  });

  @override
  Future<void> savePendingSeenNotifications(List<NotificationModel> notifications) async {
    final userId = await identityReader.userId();
    await appCache.prefs.delete(key: PrefsKey.notificationsPendingSeen, userId: userId);

    final groupUnseenIds = notifications
        .where((notification) => notification.isSeen == false)
        .map((notification) => notification.id.toString())
        .toList();
    await appCache.prefs.writeStringList(
      key: PrefsKey.notificationsPendingSeen,
      list: groupUnseenIds,
    );
  }

  @override
  Future<List<String>> getPendingSeenNotificationIds() async {
    final userId = await identityReader.userId();
    return appCache.prefs.readStringList(key: PrefsKey.notificationsPendingSeen, userId: userId);
  }
}
