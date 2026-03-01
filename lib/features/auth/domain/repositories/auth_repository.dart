import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';
import 'package:silah_app/features/auth/domain/entities/registration_payload.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthUserEntity>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthUserEntity>> register(RegistrationPayload payload);

  Future<Either<Failure, bool>> sendPasswordReset({required String email});

  Future<Either<Failure, bool>> updatePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<Either<Failure, bool>> signOut();
}
