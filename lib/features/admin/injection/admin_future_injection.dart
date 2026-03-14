import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/admin/data/datasources/remote/admin_remote_data_source.dart';
import 'package:silah_app/features/admin/data/repositories/admin_repository_impl.dart';
import 'package:silah_app/features/admin/domain/repositories/admin_repository.dart';
import 'package:silah_app/features/support/data/datasources/remote/support_service.dart';
import 'package:silah_app/features/verification/data/datasources/remote/verification_service.dart';

// ! Features - Admin

Future<void> initAdmin() async {
  locator.registerLazySingleton<AdminRemoteDataSource>(
    () => AdminRemoteDataSourceImpl(
      logger: locator(),
      supportService: locator<SupportService>(),
      verificationService: locator<VerificationService>(),
    ),
  );
  locator.registerLazySingleton<AdminRepository>(
    () => AdminRepositoryImpl(remoteDataSource: locator(), executor: locator()),
  );
}
