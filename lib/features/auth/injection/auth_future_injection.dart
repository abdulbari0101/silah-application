import 'package:silah_app/core/domain/repositories/identity_repo.dart';
import 'package:silah_app/core/injection/injection_container.dart';

import 'package:silah_app/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:silah_app/features/auth/data/datasources/remote/auth_service.dart';
import 'package:silah_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:silah_app/features/auth/data/repositories/identity_repo_impl.dart';
import 'package:silah_app/features/auth/domain/repositories/identity_base_repo.dart';
import 'package:silah_app/features/auth/presentation/blocs/forget_pass/forget_pass_bloc.dart';
import 'package:silah_app/features/auth/presentation/blocs/login/login_bloc.dart';
import 'package:silah_app/features/auth/presentation/blocs/self_registration/self_registration_bloc.dart';

import '../domain/repositories/auth_repository.dart';

Future<void> initAuth() async {
  // Bloc
  locator.registerLazySingleton(
    () => LoginBloc(repository: locator(), appStateBloc: locator()),
  );

  locator.registerFactory(() => ForgetPassBloc(repository: locator()));
  locator.registerFactory(
    () => SelfRegBloc(
      repository: locator(),
      appStateBloc: locator(),
    ),
  );

  // Auth services (Firebase)
  locator.registerLazySingleton(() => AuthService());

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

  locator.registerLazySingleton<IdentityRepo>(() => locator<AuthIdentityRepo>());
}
