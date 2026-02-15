import 'package:dartz/dartz.dart';
import 'package:silah_app/core/domain/entities/api/request/post_request_entity.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/features/auth/domain/entities/auth_ex_data_entity.dart';
import 'package:silah_app/features/auth/domain/entities/self_registration_payload.dart';

abstract class AuthRepo {
  // Login
  Future<Either<Failure, bool>> loginToken({required String password, required String mobile});
  Future<Either<Failure, ExDataAuthEntity>> login(PostRequestEntity parmas);

  Future<Either<Failure, bool>> reqDeviceRegistration(PostRequestEntity parmas);
  Future<Either<Failure, bool>> comDeviceRegistration(PostRequestEntity parmas);

  //forget pass

  Future<Either<Failure, bool>> resetPass(String mobileNo);
  Future<Either<Failure, bool>> resetPassComplete(PostRequestEntity params);

  ////
  /// self registration
  Future<Either<Failure, bool>> selfRegToken();

  Future<Either<Failure, bool>> selfRegMobileRequest(PostRequestEntity parmas);
  Future<Either<Failure, bool>> selfRegMobileComplete(PostRequestEntity parmas);

  Future<Either<Failure, bool>> selfRegEmailRequest(PostRequestEntity parmas);
  Future<Either<Failure, bool>> selfRegEmailComplete(PostRequestEntity parmas);

  Future<Either<Failure, bool>> selfRegComplete(SelfRegistrationPayload payload);
  /////
  ///
  ///
  Future<Either<Failure, bool>> changeFirstPassword(PostRequestEntity parmas);
  Future<Either<Failure, bool>> changeFirstPin(PostRequestEntity parmas);
}
