import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/features/auth/domain/entities/auth_ex_data_entity.dart';
import 'package:silah_app/features/auth/domain/entities/self_registration_payload.dart';

abstract class AuthRepo {
  Future<Either<Failure, ExDataAuthEntity>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, ExDataAuthEntity>> register(SelfRegistrationPayload payload);

  Future<Either<Failure, bool>> sendPasswordReset({required String email});

  Future<Either<Failure, bool>> signOut();
}
