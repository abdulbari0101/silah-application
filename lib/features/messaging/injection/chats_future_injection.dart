import 'package:silah_app/core/config/constants/api_constants.dart';
import 'package:silah_app/core/infrastructure/network/dio_client.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/messaging/data/datasources/local/chats_local_data_source.dart';
import 'package:silah_app/features/messaging/data/datasources/remote/chats_remote_data_source.dart';
import 'package:silah_app/features/messaging/data/datasources/remote/chats_service.dart';
import 'package:silah_app/features/messaging/data/repositories/chats_repository_impl.dart';
import 'package:silah_app/features/messaging/domain/repositories/messaging_repository.dart';
import 'package:silah_app/features/messaging/presentation/blocs/chats/chats_bloc.dart';
//! Features -Chats

Future<void> initChats() async {
  // Bloc

  locator.registerLazySingleton(() => ChatsBloc(repository: locator()));

  // Repo
  locator.registerLazySingleton<MessagingRepository>(
    () => MessagingRepositoryoImpl(
      remoteDS: locator(),
      executor: locator(),
      localDS: locator(),
      deviceInfoHelper: locator(),
    ),
  );

  // Data sources
  locator.registerLazySingleton<ChatsLocalDataSource>(
    () => ChatsLocalDataSourceImpl(logger: locator(), appCache: locator()),
  );

  locator.registerLazySingleton<ChatsRemoteDataSource>(
    () => ChatsRemoteDataSourceImpl(chatsService: locator(), logger: locator()),
  );

  // Chats services
  locator.registerLazySingleton(
    () => ChatsService(locator<DioClient>().dio, baseUrl: ApiConstants.baseUrl),
  );
}
