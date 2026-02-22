import 'package:silah_app/core/config/constants/api_constants.dart';
import 'package:silah_app/core/infrastructure/network/dio_client.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/discovery/data/datasources/local/specifications_local_data_source.dart';
import 'package:silah_app/features/discovery/data/datasources/remote/specifications_remote_data_source.dart';
import 'package:silah_app/features/discovery/data/datasources/remote/specifications_service.dart';
import 'package:silah_app/features/discovery/data/repositories/discovery_repository_impl.dart';
import 'package:silah_app/features/discovery/domain/repositories/discovery_repository.dart';
import 'package:silah_app/features/discovery/presentation/blocs/specifications/specifications_bloc.dart';
//! Features -Specifications

Future<void> initSpecifications() async {
  // Bloc

  locator.registerLazySingleton(() => SpecificationsBloc(repository: locator()));

  // Repo
  locator.registerLazySingleton<DiscoveryRepository>(
    () => DiscoveryRepositoryImpl(aiRemoteDataSource: locator(), executor: locator()),
  );

  // Data sources
  locator.registerLazySingleton<SpecificationsLocalDataSource>(
    () => SpecificationsLocalDataSourceImpl(logger: locator(), appCache: locator()),
  );

  locator.registerLazySingleton<SpecificationsRemoteDataSource>(
    () => SpecificationsRemoteDataSourceImpl(specificationsService: locator(), logger: locator()),
  );

  // Specifications services
  locator.registerLazySingleton(
    () => SpecificationsService(locator<DioClient>().dio, baseUrl: ApiConstants.baseUrl),
  );
}
