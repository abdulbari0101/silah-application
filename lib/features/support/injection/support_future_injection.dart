import 'package:silah_app/core/config/constants/api_constants.dart';
import 'package:silah_app/core/infrastructure/network/dio_client.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/support/data/datasources/local/support_local_data_source.dart';
import 'package:silah_app/features/support/data/datasources/remote/support_remote_data_source.dart';
import 'package:silah_app/features/support/data/datasources/remote/support_service.dart';
import 'package:silah_app/features/support/data/repositories/support_repository_impl.dart';
import 'package:silah_app/features/support/domain/repositories/support_tickets_repository.dart';
import 'package:silah_app/features/support/presentation/blocs/support/support_bloc.dart';
//! Features -Support

Future<void> initSupport() async {
  // Bloc

  locator.registerLazySingleton(() => SupportBloc(repository: locator()));

  // Repo
  locator.registerLazySingleton<SupportTicketsRepository>(
    () => SupportTicketsRepositoryoImpl(
      remoteDS: locator(),
      executor: locator(),
      localDS: locator(),
      deviceInfoHelper: locator(),
    ),
  );

  // Data sources
  locator.registerLazySingleton<SupportLocalDataSource>(
    () => SupportLocalDataSourceImpl(logger: locator(), appCache: locator()),
  );

  locator.registerLazySingleton<SupportRemoteDataSource>(
    () => SupportRemoteDataSourceImpl(supportService: locator(), logger: locator()),
  );

  // Support services
  locator.registerLazySingleton(
    () => SupportService(locator<DioClient>().dio, baseUrl: ApiConstants.baseUrl),
  );
}
