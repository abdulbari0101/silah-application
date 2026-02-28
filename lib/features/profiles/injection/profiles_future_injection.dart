import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/profiles/data/datasources/remote/profile_remote_data_source.dart';
import 'package:silah_app/features/profiles/data/repositories/profile_repository_impl.dart';
import 'package:silah_app/features/profiles/domain/repositories/profile_repository.dart';

// ! Features - Profiles

Future<void> initProfiles() async {
  locator.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(logger: locator()),
  );

  locator.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      remoteDataSource: locator(),
      executor: locator(),
      cacheDataSource: locator(),
      identityRepo: locator(),
    ),
  );
}
