import 'package:silah_app/core/config/constants/api_constants.dart';
import 'package:silah_app/core/infrastructure/network/dio_client.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/consultations/data/datasources/local/requests_local_data_source.dart';
import 'package:silah_app/features/consultations/data/datasources/remote/requests_remote_data_source.dart';
import 'package:silah_app/features/consultations/data/datasources/remote/requests_service.dart';
import 'package:silah_app/features/consultations/data/repositories/requests_repository_impl.dart';
import 'package:silah_app/features/consultations/domain/repositories/request_repository.dart';
import 'package:silah_app/features/consultations/presentation/blocs/requests/requests_bloc.dart';
//! Features -Requests

Future<void> initRequests() async {
  // Bloc

  locator.registerLazySingleton(() => RequestsBloc(repository: locator()));

  // Repo
  locator.registerLazySingleton<RequestsRepository>(
    () => RequestsRepositoryoImpl(
      remoteDS: locator(),
      executor: locator(),
      localDS: locator(),
      deviceInfoHelper: locator(),
    ),
  );

  // Data sources
  locator.registerLazySingleton<RequestsLocalDataSource>(
    () => RequestsLocalDataSourceImpl(logger: locator(), appCache: locator()),
  );

  locator.registerLazySingleton<RequestsRemoteDataSource>(
    () => RequestsRemoteDataSourceImpl(requestsService: locator(), logger: locator()),
  );

  // Requests services
  locator.registerLazySingleton(
    () => RequestsService(locator<DioClient>().dio, baseUrl: ApiConstants.baseUrl),
  );
}
