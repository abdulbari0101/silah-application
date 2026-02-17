import 'package:dartz/dartz.dart';
import 'package:silah_app/core/domain/entities/api/request/post_request_entity.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/features/app_shell/domain/entities/intro_entity.dart';

abstract class IntroRepo {
  Future<Either<Failure, List<IntroEntity>>> doSomething(PostRequestEntity parmas);
}
