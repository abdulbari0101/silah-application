import 'package:silah_app/core/config/constants/api_constants.dart';
import 'package:silah_app/core/domain/repositories/identity_repo.dart';
import 'package:silah_app/core/infrastructure/network/dio_client.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:silah_app/features/auth/data/datasources/remote/auth_role_service.dart';
import 'package:silah_app/features/auth/data/datasources/remote/auth_service.dart';
import 'package:silah_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:silah_app/features/auth/data/repositories/identity_repo_impl.dart';
import 'package:silah_app/features/auth/domain/repositories/identity_base_repo.dart';
import 'package:silah_app/features/auth/presentation/blocs/login/login_bloc.dart';
import 'package:silah_app/features/auth/presentation/blocs/registration/registration_bloc.dart';
import 'package:silah_app/features/notifications/domain/repositories/device_token_repository.dart';

import '../domain/repositories/auth_repository.dart';

Future<void> initAuth() async {
  // Bloc
  locator.registerLazySingleton(
    () => LoginBloc(repository: locator(), appStateBloc: locator()),
  );
  locator.registerFactory(
    () => RegistrationBloc(repository: locator(), appStateBloc: locator()),
  );

  // Auth services (Firebase)
  locator.registerLazySingleton(
    () => AuthRoleService(
      locator<DioClient>().dio,
      baseUrl: ApiConstants.baseUrl,
    ),
  );
  locator.registerLazySingleton(() => AuthService(roleService: locator()));

  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(authService: locator(), logger: locator()),
  );

  // Repo
  locator.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      remoteDS: locator(),
      cacheDS: locator(),
      executor: locator(),
      authIdentityRepo: locator(),
      deviceFcmTokenRepository: locator<DeviceTokenRepository>(),
      settingReader: locator(),
    ),
  );

  // single instance, many interfaces

  locator.registerLazySingleton<AuthIdentityRepo>(
    () => IdentityRepoImpl(
      cacheDS: locator(),
      deviceSerialService: locator(),
      logger: locator(),
    ),
  );

  locator.registerLazySingleton<IdentityRepo>(
    () => locator<AuthIdentityRepo>(),
  );
}
