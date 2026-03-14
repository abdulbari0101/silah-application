import 'package:get_it/get_it.dart';
import 'package:silah_app/core/bootstrap/once_runner.dart';
import 'package:silah_app/core/injection/init_timer.dart';
import 'package:silah_app/features/admin/injection/admin_future_injection.dart';
import 'package:silah_app/features/app_shell/injection/main_future_injection.dart';
import 'package:silah_app/features/auth/injection/auth_future_injection.dart';
import 'package:silah_app/features/auth/injection/auth_readers_injection.dart';
import 'package:silah_app/features/consultations/injection/consultation_future_injection.dart';
import 'package:silah_app/features/discovery/injection/specifications_future_injection.dart';
import 'package:silah_app/features/lookups/injection/lookups_future_injection.dart';
import 'package:silah_app/features/messaging/injection/chats_future_injection.dart';
import 'package:silah_app/features/notifications/injection/notifications_future_injection.dart';
import 'package:silah_app/features/profiles/injection/profiles_future_injection.dart';
import 'package:silah_app/features/settings/injection/setting_future_injection.dart';
import 'package:silah_app/features/settings/injection/setting_readers_injection.dart';
import 'package:silah_app/features/support/injection/support_future_injection.dart';
import 'package:silah_app/features/training/injection/training_future_injection.dart';
import 'package:silah_app/features/verification/injection/verification_future_injection.dart';

import 'core_future_injection.dart';
import 'local_data_injection.dart';
import 'network_injection.dart';
import 'utils_injection.dart';

final locator = GetIt.instance;
bool _didInit = false;
bool _initializing = false;

final _once = OnceRunner();

Future<void> init() async {
  if (_didInit) return;
  if (_initializing) {
    // prevent concurrent double-inits
    await locator.allReady();
    return;
  }
  _initializing = true;
  try {
    await initOnceWithTimeNeededLog('initLocalData', initLocalData);
    await initOnceWithTimeNeededLog('initAuthReaders', initAuthReaders);
    await initOnceWithTimeNeededLog('initSettingReaders', initSettingReaders);

    await initOnceWithTimeNeededLog('initUtils', initUtils);
    await initOnceWithTimeNeededLog('initNetwork', initNetwork);

    await initOnceWithTimeNeededLog('initCore', initCore);
    await initOnceWithTimeNeededLog('initSettings', initSettings);

    await initOnceWithTimeNeededLog('initNotifications', initNotifications);
    await initOnceWithTimeNeededLog('initAuth', initAuth);
    await initOnceWithTimeNeededLog('initMain', initMain);

    await initOnceWithTimeNeededLog('initChats', initChats);
    await initOnceWithTimeNeededLog('initConsultation', initConsultation);
    await initOnceWithTimeNeededLog('initSpecifications', initSpecifications);
    await initOnceWithTimeNeededLog('initLookups', initLookups);
    await initOnceWithTimeNeededLog('initSupport', initSupport);
    await initOnceWithTimeNeededLog('initVerification', initVerification);
    await initOnceWithTimeNeededLog('initTraining', initTraining);
    await initOnceWithTimeNeededLog('initProfiles', initProfiles);
    await initOnceWithTimeNeededLog('initAdmin', initAdmin);

    //testLocalTime();

    await initOnceWithTimeNeededLog('GetIt.allReady', () => locator.allReady());
    _didInit = true;
  } finally {
    _initializing = false;
  }
}

Future<void> initOnceWithTimeNeededLog<T>(
  String name,
  Future<T> Function() run, {
  String tag = 'Init',
}) async {
  return _once.run(name, () async {
    await timeAsync(name, run, tag: tag);
  });
}
