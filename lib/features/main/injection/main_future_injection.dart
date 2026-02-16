import 'package:silah_app/core/config/constants/api_constants.dart';
import 'package:silah_app/core/infrastructure/network/dio_client.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/main/data/datasources/local/main_cache_data_source.dart';
import 'package:silah_app/features/main/data/datasources/remote/main_remote_data_source.dart';
import 'package:silah_app/features/main/data/datasources/remote/main_service.dart';

import 'package:silah_app/features/main/presentation/blocs/home_bloc/home_bloc.dart';
//! Features -Main

Future<void> initMain() async {
  // Bloc

  locator.registerLazySingleton(() => HomeBloc());

  // Repo

  // Data sources

  locator.registerLazySingleton<MainCacheDataSource>(
    () => MainCacheDataSourceImpl(
      logger: locator(),
      appCache: locator(),
      identityReader: locator(),
    ),
  );

  //

  ///

  locator.registerLazySingleton<MainRemoteDataSource>(
    () => MainRemoteDataSourceImpl(mainService: locator(), logger: locator()),
  );

  // Main services
  locator.registerLazySingleton(
    () => MainService(locator<DioClient>().dio, baseUrl: ApiConstants.baseUrl),
  );
}
