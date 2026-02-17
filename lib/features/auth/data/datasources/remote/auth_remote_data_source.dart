import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/firebase_call.dart';
import 'package:silah_app/features/auth/data/datasources/remote/auth_service.dart';
import 'package:silah_app/features/auth/data/models/auth_user_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthUserModel> signIn({required String email, required String password});
  Future<AuthUserModel> registerUser({
    required String name,
    required String email,
    required String phone,
    required String password,
  });
  Future<AuthUserModel> registerLawyer({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
    required String legalField,
    required String city,
    required String workplace,
    required String officeName,
    String? experienceYears,
    required String licenseNumber,
    required String nationalId,
  });
  Future<void> sendPasswordReset({required String email});
  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthService authService;
  final AppLogger logger;

  AuthRemoteDataSourceImpl({
    required this.authService,
    required this.logger,
  });

  @override
  Future<AuthUserModel> signIn({required String email, required String password}) =>
      firebaseCall<AuthUserModel>(
        method: 'AuthRemoteDataSource.signIn',
        logger: logger,
        call: () => authService.signIn(email: email, password: password),
      );

  @override
  Future<AuthUserModel> registerUser({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) =>
      firebaseCall<AuthUserModel>(
        method: 'AuthRemoteDataSource.registerUser',
        logger: logger,
        call: () => authService.registerUser(
          name: name,
          email: email,
          phone: phone,
          password: password,
        ),
      );

  @override
  Future<AuthUserModel> registerLawyer({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
    required String legalField,
    required String city,
    required String workplace,
    required String officeName,
    String? experienceYears,
    required String licenseNumber,
    required String nationalId,
  }) =>
      firebaseCall<AuthUserModel>(
        method: 'AuthRemoteDataSource.registerLawyer',
        logger: logger,
        call: () => authService.registerLawyer(
          name: name,
          email: email,
          phone: phone,
          gender: gender,
          password: password,
          legalField: legalField,
          city: city,
          workplace: workplace,
          officeName: officeName,
          experienceYears: experienceYears,
          licenseNumber: licenseNumber,
          nationalId: nationalId,
        ),
      );

  @override
  Future<void> sendPasswordReset({required String email}) => firebaseCall<void>(
        method: 'AuthRemoteDataSource.sendPasswordReset',
        logger: logger,
        call: () => authService.sendPasswordResetEmail(email: email),
      );

  @override
  Future<void> signOut() => firebaseCall<void>(
        method: 'AuthRemoteDataSource.signOut',
        logger: logger,
        call: () => authService.signOut(),
      );
}
