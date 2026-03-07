import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:silah_app/core/config/extentions/string_validation.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/features/settings/data/datasources/local/settings_cache_data_source.dart';

class FcmTokenListener {
  FcmTokenListener({
    required FirebaseMessaging messaging,
    required SettingsCacheDataSource local,
    required AppLogger logger,
  }) : _messaging = messaging,
       _local = local,
       _logger = logger;

  final FirebaseMessaging _messaging;
  final SettingsCacheDataSource _local;
  final AppLogger _logger;

  StreamSubscription<String>? _tokenSub;

  void init() {
    try {
      // Initial token
      _messaging.getToken().then((value) {
        _persist(value);
      });

      // Ongoing refreshes
      _tokenSub = _messaging.onTokenRefresh.listen(_persist);
    } catch (e, s) {
      _logger.appError(tag: 'FCM-token init failed', e, stack: s); //
    }
  }

  Future<void> dispose() async {
    await _tokenSub?.cancel();
  }

  Future<void> _persist(String? token) async {
    if (token.isNotNullOrEmpty) {
      await _local.saveFCMToken(token!);
      _logger.appDebug('Saved FCM token $token');
    }
  }
}
