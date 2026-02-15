import 'package:silah_app/core/config/constants/api_constants.dart';
import 'package:silah_app/core/infrastructure/network/dio_client.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/Intro/data/datasources/local/intro_cache_data_source.dart';
import 'package:silah_app/features/Intro/data/datasources/remote/intro_remote_data_source.dart';

import '../data/datasources/remote/intro_service.dart';
import '../data/repositories/intro_repository_impl.dart';
import '../domain/repositories/intro_repository.dart';
//! Features -Intro

Future<void> initIntro() async {
  // Bloc

  // Repo
  locator.registerLazySingleton<IntroRepo>(
    () => IntroRepoImpl(
      remoteDS: locator(),
      cacheDS: locator(),
      executor: locator(),
      deviceInfoHelper: locator(),
    ),
  );

  // Data sources
  locator.registerLazySingleton<IntroCacheDataSource>(
    () => IntroCacheDataSourceImpl(logger: locator(), appCache: locator()),
  );

  locator.registerLazySingleton<IntroRemoteDataSource>(
    () => IntroRemoteDataSourceImpl(introService: locator(), logger: locator()),
  );

  // Intro services
  locator.registerLazySingleton(
    () => IntroService(locator<DioClient>().dio, baseUrl: ApiConstants.baseUrl),
  );
}
