import 'package:silah_app/core/config/constants/api_constants.dart';
import 'package:silah_app/core/infrastructure/network/dio_client.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/verification/data/datasources/remote/verification_remote_data_source.dart';
import 'package:silah_app/features/verification/data/datasources/remote/verification_service.dart';
import 'package:silah_app/features/verification/data/repositories/verification_repository_impl.dart';
import 'package:silah_app/features/verification/domain/repositories/verification_repository.dart';

// ! Features - Verification

Future<void> initVerification() async {
  // Repo
  locator.registerLazySingleton<VerificationRepository>(
    () => VerificationRepositoryImpl(
      remoteDataSource: locator(),
      executor: locator(),
    ),
  );

  // Data sources
  locator.registerLazySingleton<VerificationRemoteDataSource>(
    () => VerificationRemoteDataSourceImpl(service: locator(), logger: locator()),
  );

  // Services
  locator.registerLazySingleton(
    () => VerificationService(locator<DioClient>().dio, baseUrl: ApiConstants.baseUrl),
  );
}
