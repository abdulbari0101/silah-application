import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/network/firebase_call.dart';
import 'package:silah_app/features/auth/data/datasources/remote/auth_service.dart';
import 'package:silah_app/features/auth/data/models/auth_user_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthUserModel> signIn({
    required String email,
    required String password,
  });
  Future<AuthUserModel> registerUser({required AuthUserModel user});
  Future<AuthUserModel> registerLawyer({required AuthUserModel user});
  Future<void> sendPasswordReset({required String email});
  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
  });
  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthService authService;
  final AppLogger logger;

  AuthRemoteDataSourceImpl({required this.authService, required this.logger});

  @override
  Future<AuthUserModel> signIn({
    required String email,
    required String password,
  }) => firebaseCall<AuthUserModel>(
    method: 'AuthRemoteDataSource.signIn',
    logger: logger,
    call: () => authService.signIn(email: email, password: password),
  );

  @override
  Future<AuthUserModel> registerUser({required AuthUserModel user}) =>
      firebaseCall<AuthUserModel>(
        method: 'AuthRemoteDataSource.registerUser',
        logger: logger,
        call: () => authService.registerUser(request: user),
      );

  @override
  Future<AuthUserModel> registerLawyer({required AuthUserModel user}) =>
      firebaseCall<AuthUserModel>(
        method: 'AuthRemoteDataSource.registerLawyer',
        logger: logger,
        call: () => authService.registerLawyer(request: user),
      );

  @override
  Future<void> sendPasswordReset({required String email}) => firebaseCall<void>(
    method: 'AuthRemoteDataSource.sendPasswordReset',
    logger: logger,
    call: () => authService.sendPasswordResetEmail(email: email),
  );

  @override
  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) => firebaseCall<void>(
    method: 'AuthRemoteDataSource.updatePassword',
    logger: logger,
    call: () => authService.updatePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    ),
  );

  @override
  Future<void> signOut() => firebaseCall<void>(
    method: 'AuthRemoteDataSource.signOut',
    logger: logger,
    call: () => authService.signOut(),
  );
}
