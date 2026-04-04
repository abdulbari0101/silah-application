import 'package:silah_app/core/data/local/cache/readers/auth_readers.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/auth/data/datasources/local/auth_cache_data_source.dart';

Future<void> initAuthReaders() async {
  // single instance, many interfaces
  locator.registerLazySingleton<AuthCacheDataSource>(
    () => AuthCacheDataSourceImpl(logger: locator(), appCache: locator()),
  );
  locator.registerLazySingleton<IdentityReader>(
    () => locator<AuthCacheDataSource>(),
  );
  locator.registerLazySingleton<SessionReader>(
    () => locator<AuthCacheDataSource>(),
  );
}
