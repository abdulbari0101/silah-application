import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/lookups/data/datasources/remote/lookups_remote_data_source.dart';
import 'package:silah_app/features/lookups/data/repositories/lookups_repository_impl.dart';
import 'package:silah_app/features/lookups/domain/repositories/lookups_repository.dart';

// ! Features - Lookups

Future<void> initLookups() async {
  locator.registerLazySingleton<LookupsRepository>(
    () =>
        LookupsRepositoryImpl(executor: locator(), remoteDataSource: locator()),
  );

  locator.registerLazySingleton<LookupsRemoteDataSource>(
    () => LookupsRemoteDataSourceImpl(logger: locator()),
  );
}
