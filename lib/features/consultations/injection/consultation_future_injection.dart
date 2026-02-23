import 'package:silah_app/core/config/constants/api_constants.dart';
import 'package:silah_app/core/infrastructure/network/dio_client.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/consultations/data/datasources/remote/consultations_remote_data_source.dart';
import 'package:silah_app/features/consultations/data/datasources/remote/consultations_service.dart';
import 'package:silah_app/features/consultations/data/repositories/consultations_repository_impl.dart';
import 'package:silah_app/features/consultations/domain/repositories/consultations_repository.dart';

//! Features Consultation

Future<void> initConsultation() async {
  // Repo
  locator.registerLazySingleton<ConsultationsRepository>(
    () => ConsultationsRepositoryImpl(remoteDataSource: locator(), executor: locator()),
  );

  // Data sources
  locator.registerLazySingleton<ConsultationsRemoteDataSource>(
    () => ConsultationsRemoteDataSourceImpl(service: locator(), logger: locator()),
  );

  // Services
  locator.registerLazySingleton(
    () => ConsultationsService(locator<DioClient>().dio, baseUrl: ApiConstants.baseUrl),
  );
}
