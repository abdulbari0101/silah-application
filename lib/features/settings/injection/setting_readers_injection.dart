import 'package:silah_app/core/data/local/cache/readers/auth_readers.dart';
import 'package:silah_app/core/data/local/cache/readers/setting_reader.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/settings/data/datasources/local/settings_cache_data_source.dart';

Future<void> initSettingReaders() async {
  // single instance, many interfaces
  // Data sources
  locator.registerLazySingleton<SettingsCacheDataSource>(
    () => SettingsCacheDataSourceImpl(
      logger: locator(),
      appCache: locator(),
      identityReader: locator.get<IdentityReader>(),
    ),
  );
  locator.registerLazySingleton<SettingReader>(
    () => locator<SettingsCacheDataSource>(),
  );
}
