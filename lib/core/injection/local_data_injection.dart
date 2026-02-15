
import 'package:shared_preferences/shared_preferences.dart';
import 'package:silah_app/core/data/local/cache/app_cache.dart';
import 'package:silah_app/core/data/local/cache/prefs/prefs_store.dart';
import 'package:silah_app/core/data/local/cache/secure/secure_store.dart';
import 'package:silah_app/core/injection/init_timer.dart';

import 'extenstions/getit_once.dart'; // <-- add this
import 'injection_container.dart';

Future<void> initLocalData() async {
  final sl = locator;

  // Secure storage
  await sl.registerSingletonAsyncOnce<SecureStore>(() async => SecureStore.init());

  // SharedPreferences
  await sl.registerSingletonAsyncOnce<SharedPreferences>(
    () async => SharedPreferences.getInstance(),
  );

  // PrefsStore (depends on SharedPreferences)
  await sl.registerSingletonAsyncOnce<PrefsStore>(
    () async => PrefsStore(sl<SharedPreferences>()),
    dependsOn: const [SharedPreferences],
  );

  // AppCache (depends on PrefsStore + SecureStore)
  sl.registerSingletonWithDependenciesOnce<AppCache>(
    () => AppCache(prefs: sl<PrefsStore>(), secure: sl<SecureStore>()),
    dependsOn: const [PrefsStore, SecureStore],
  );

  // Ensure everything is ready before any consumer tries to read them

  //  await timeReady<AppCache>('AppCache');
}

testLocalTime() async {
  await timeReady<SecureStore>('SecureStore');
  await timeReady<SharedPreferences>('SharedPreferences');
  await timeReady<PrefsStore>('PrefsStore');
  await timeReady<AppCache>('AppCache');
}
