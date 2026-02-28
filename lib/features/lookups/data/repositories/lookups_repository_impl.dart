import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/features/lookups/data/datasources/remote/lookups_remote_data_source.dart';
import 'package:silah_app/features/lookups/domain/entities/lookup_item_entity.dart';
import 'package:silah_app/features/lookups/domain/repositories/lookups_repository.dart';

class LookupsRepositoryImpl implements LookupsRepository {
  final Executor executor;
  final LookupsRemoteDataSource remoteDataSource;

  LookupsRepositoryImpl({
    required this.executor,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<LookupItemEntity>>> fetchGenders() {
    return executor.runOnline(() async {
      return remoteDataSource.fetchGenders();
    }, from: 'LookupsRepository.fetchGenders');
  }

  @override
  Future<Either<Failure, List<LookupItemEntity>>> fetchAreas() {
    return executor.runOnline(() async {
      return remoteDataSource.fetchAreas();
    }, from: 'LookupsRepository.fetchAreas');
  }

  @override
  Future<Either<Failure, List<LookupItemEntity>>> fetchCities({String? areaId}) {
    return executor.runOnline(() async {
      return remoteDataSource.fetchCities(areaId: areaId);
    }, from: 'LookupsRepository.fetchCities');
  }

  @override
  Future<Either<Failure, List<LookupItemEntity>>> fetchWorkDestinations() {
    return executor.runOnline(() async {
      return remoteDataSource.fetchWorkDestinations();
    }, from: 'LookupsRepository.fetchWorkDestinations');
  }
}
