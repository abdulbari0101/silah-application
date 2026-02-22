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
    String? avatarUrl,
  });
  Future<AuthUserModel> registerLawyer({
    required String name,
    required String email,
    required String phone,
    required String gender,
    String? genderId,
    required String password,
    required String legalField,
    String? legalFieldId,
    required String city,
    String? cityId,
    String? areaId,
    required String workplace,
    String? workDestinationId,
    required String officeName,
    String? experienceYears,
    required String licenseNumber,
    required String nationalId,
    String? avatarUrl,
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
    String? avatarUrl,
  }) =>
      firebaseCall<AuthUserModel>(
        method: 'AuthRemoteDataSource.registerUser',
        logger: logger,
        call: () => authService.registerUser(
          name: name,
          email: email,
          phone: phone,
          password: password,
          avatarUrl: avatarUrl,
        ),
      );

  @override
  Future<AuthUserModel> registerLawyer({
    required String name,
    required String email,
    required String phone,
    required String gender,
    String? genderId,
    required String password,
    required String legalField,
    String? legalFieldId,
    required String city,
    String? cityId,
    String? areaId,
    required String workplace,
    String? workDestinationId,
    required String officeName,
    String? experienceYears,
    required String licenseNumber,
    required String nationalId,
    String? avatarUrl,
  }) =>
      firebaseCall<AuthUserModel>(
        method: 'AuthRemoteDataSource.registerLawyer',
        logger: logger,
        call: () => authService.registerLawyer(
          name: name,
          email: email,
          phone: phone,
          gender: gender,
          genderId: genderId,
          password: password,
          legalField: legalField,
          legalFieldId: legalFieldId,
          city: city,
          cityId: cityId,
          areaId: areaId,
          workplace: workplace,
          workDestinationId: workDestinationId,
          officeName: officeName,
          experienceYears: experienceYears,
          licenseNumber: licenseNumber,
          nationalId: nationalId,
          avatarUrl: avatarUrl,
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
