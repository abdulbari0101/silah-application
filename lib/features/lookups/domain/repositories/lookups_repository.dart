import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/features/lookups/domain/entities/lookup_item_entity.dart';

abstract class LookupsRepository {
  Future<Either<Failure, List<LookupItemEntity>>> fetchGenders();

  Future<Either<Failure, List<LookupItemEntity>>> fetchAreas();

  Future<Either<Failure, List<LookupItemEntity>>> fetchCities({String? areaId});

  Future<Either<Failure, List<LookupItemEntity>>> fetchWorkDestinations();
}
