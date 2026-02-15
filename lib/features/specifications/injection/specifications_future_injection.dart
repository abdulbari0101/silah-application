import 'package:silah_app/core/config/constants/api_constants.dart';
import 'package:silah_app/core/infrastructure/network/dio_client.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/specifications/data/datasources/local/specifications_local_data_source.dart';
import 'package:silah_app/features/specifications/data/datasources/remote/specifications_remote_data_source.dart';
import 'package:silah_app/features/specifications/data/datasources/remote/specifications_service.dart';
import 'package:silah_app/features/specifications/data/repositories/specifications_repository_impl.dart';
import 'package:silah_app/features/specifications/domain/repositories/specifications_repository.dart';
import 'package:silah_app/features/specifications/presentation/blocs/specifications/specifications_bloc.dart';
//! Features -Specifications

Future<void> initSpecifications() async {
  // Bloc

  locator.registerLazySingleton(() => SpecificationsBloc(repository: locator()));

  // Repo
  locator.registerLazySingleton<SpecificationsRepository>(
    () => SpecificationsRepositoryoImpl(
      remoteDS: locator(),
      executor: locator(),
      localDS: locator(),
      deviceInfoHelper: locator(),
    ),
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
