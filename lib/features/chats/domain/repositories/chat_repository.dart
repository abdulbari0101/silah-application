import 'package:dartz/dartz.dart';
import 'package:silah_app/core/domain/entities/api/request/post_request_entity.dart';
import 'package:silah_app/core/domain/entities/data_entity.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';

abstract class ChatsRepository {
  Future<Either<Failure, DataEntity>> Chat(PostRequestEntity params);

  //
}
