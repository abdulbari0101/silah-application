import 'package:silah_app/core/config/constants/api_constants.dart';
import 'package:silah_app/core/infrastructure/network/dio_client.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/features/training/data/datasources/remote/training_remote_data_source.dart';
import 'package:silah_app/features/training/data/datasources/remote/training_service.dart';
import 'package:silah_app/features/training/data/repositories/training_repository_impl.dart';
import 'package:silah_app/features/training/domain/repositories/training_repository.dart';

// ! Features - Training

Future<void> initTraining() async {
  locator.registerLazySingleton<TrainingRepository>(
    () => TrainingRepositoryImpl(remoteDataSource: locator(), executor: locator()),
  );

  locator.registerLazySingleton<TrainingRemoteDataSource>(
    () => TrainingRemoteDataSourceImpl(service: locator(), logger: locator()),
  );

  locator.registerLazySingleton(
    () => TrainingService(locator<DioClient>().dio, baseUrl: ApiConstants.baseUrl),
  );
}
