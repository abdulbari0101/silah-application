import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/data/model/api/auth/customer_model.dart';
import 'package:silah_app/core/data/model/api/auth/token_model.dart';
import 'package:silah_app/core/domain/entities/api/auth/customer_entity.dart';
import 'package:silah_app/core/domain/entities/api/request/post_request_entity.dart';
import 'package:silah_app/core/infrastructure/errors/error_codes.dart';
import 'package:silah_app/core/infrastructure/errors/exception_mapper.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/features/auth/data/datasources/local/auth_cache_data_source.dart';
import 'package:silah_app/features/auth/data/datasources/remote/auth_service.dart';
import 'package:silah_app/features/auth/domain/entities/auth_ex_data_entity.dart';
import 'package:silah_app/features/auth/domain/entities/self_registration_payload.dart';
import 'package:silah_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:silah_app/features/auth/domain/repositories/identity_base_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthService authService;
  final AuthCacheDataSource cacheDS;
  final AuthIdentityRepo authIdentityRepo;
  final Executor executor;

  AuthRepoImpl({
    required this.authService,
    required this.cacheDS,
    required this.executor,
    required this.authIdentityRepo,
  });

  @override
  Future<Either<Failure, bool>> loginToken({
    required String password,
    required String mobile,
  }) async {
    return executor.runOnline(
      () async {
        final result = await authService.signInWithEmailAndPassword(
          email: mobile.trim(),
          password: password,
        );

        if (!result.isSuccess || result.user == null) {
          throw AuthException(
            result.errorMessage ?? Strings.err_login.tr(),
            result.errorCode ?? ErrorCodes.badRequest400,
          );
        }

        final token = TokenModel(
          accessToken: result.user!.uid,
          tokenType: 'firebase',
          expiresIn: 3600,
          scope: 'firebase',
        );
        await cacheDS.cacheLoginToken(token);

        return false;
      },
      onError: (e, trace) {
        if (e is BadRequestException) {
          return AuthFailure(Strings.msg_user_pass_not_correct.tr(), ErrorCodes.invalidUserPass11);
        }

        return ExceptionMapper.map(e, from: "AuthRepoImpl.loginToken", stack: trace);
      },

      from: "AuthRepoImpl.loginToken",
    );
  }

  @override
  Future<Either<Failure, ExDataAuthEntity>> login(PostRequestEntity params) async {
    return executor.runOnline(() async {
      final user = authService.currentUser;
      if (user == null) {
        throw AuthException(Strings.err_login.tr(), ErrorCodes.badRequest400);
      }

      final fullName = user.displayName?.trim() ?? '';
      final parts = fullName.split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
      final firstName = parts.isNotEmpty ? parts.first : fullName;
      final lastName = parts.length > 1 ? parts.sublist(1).join(' ') : '';

      final customer = CustomerEntity(
        fullName: fullName.isEmpty ? null : fullName,
        firstName: firstName.isEmpty ? null : firstName,
        lastName: lastName.isEmpty ? null : lastName,
        email: user.email,
        mobileNo: user.phoneNumber ?? user.email,
      );

      final userId = await authIdentityRepo.generateAndSaveUserId(customer);
      await saveLoginDataToCache(customer, userId);

      return ExDataAuthEntity(customer: customer);
    }, from: "AuthRepoImpl.login");
  }

  Future<void> saveLoginDataToCache(CustomerEntity customer, String userId) async {
    final identifier = customer.mobileNo ?? customer.email;
    if (identifier != null && identifier.trim().isNotEmpty) {
      await cacheDS.saveCustMobile(mobile: identifier, userId: userId);
    }

    await cacheDS.saveCustomer(
      customer: CustomerModel.fromEntity(customer),
      userId: userId,
    );
  }

  @override
  Future<Either<Failure, bool>> reqDeviceRegistration(PostRequestEntity params) async {
    return executor.runOnline(() async {
      return true;
    }, from: "AuthRepoImpl.reqDeviceRegistration");
  }

  @override
  Future<Either<Failure, bool>> resetPass(String mobileNO) async {
    return executor.runOnline(() async {
      final result = await authService.sendPasswordResetEmail(email: mobileNO);
      if (!result.isSuccess) {
        throw AuthException(
          result.errorMessage ?? Strings.unexpected_error.tr(),
          result.errorCode ?? ErrorCodes.badRequest400,
        );
      }
      return true;
    }, from: "AuthRepoImpl.resetPass");
  }

  @override
  Future<Either<Failure, bool>> resetPassComplete(PostRequestEntity params) async {
    return executor.runOnline(() async {
      return true;
    }, from: "AuthRepoImpl.resetPassComplete");
  }

  @override
  Future<Either<Failure, bool>> comDeviceRegistration(PostRequestEntity params) async {
    return executor.runOnline(() async {
      return true;
    }, from: "AuthRepoImpl.comDeviceRegistration");
  }

  @override
  Future<Either<Failure, bool>> changeFirstPassword(PostRequestEntity params) async {
    return executor.runOnline(() async {
      return true;
    }, from: "AuthRepoImpl.changeFirstPassword");
  }

  @override
  Future<Either<Failure, bool>> changeFirstPin(PostRequestEntity params) async {
    return executor.runOnline(() async {
      return true;
    }, from: "AuthRepoImpl.changeFirstPin");
  }

  @override
  Future<Either<Failure, bool>> selfRegToken() async {
    return executor.runOnline(
      () async {
        return true;
      },
      onError: (e, trace) {
        if (e is BadRequestException) {
          return AuthFailure(Strings.msg_user_pass_not_correct.tr(), ErrorCodes.invalidUserPass11);
        }

        return ExceptionMapper.map(e, from: "AuthRepoImpl.selfRegToken", stack: trace);
      },
      from: "AuthRepoImpl.selfRegToken",
    );
  }

  @override
  Future<Either<Failure, bool>> selfRegMobileRequest(PostRequestEntity params) async {
    return executor.runOnline(() async {
      return true;
    }, from: "AuthRepoImpl.selfRegMobileRequest");
  }

  @override
  Future<Either<Failure, bool>> selfRegMobileComplete(PostRequestEntity params) async {
    return executor.runOnline(() async {
      return true;
    }, from: "AuthRepoImpl.selfRegMobileComplete");
  }

  @override
  Future<Either<Failure, bool>> selfRegEmailRequest(PostRequestEntity params) async {
    return executor.runOnline(() async {
      return true;
    }, from: "AuthRepoImpl.selfRegEmailRequest");
  }

  @override
  Future<Either<Failure, bool>> selfRegEmailComplete(PostRequestEntity params) async {
    return executor.runOnline(() async {
      return true;
    }, from: "AuthRepoImpl.selfRegMobileComplete");
  }

  @override
  Future<Either<Failure, bool>> selfRegComplete(SelfRegistrationPayload payload) async {
    return executor.runOnline(() async {
      final name = payload.fullName.isEmpty ? payload.firstName : payload.fullName;
      if (payload.accountType == SelfRegAccountType.user) {
        final result = await authService.createUserAccount(
          name: name,
          email: payload.email,
          phone: payload.phone,
          password: payload.password,
        );
        if (!result.isSuccess) {
          throw AuthException(
            result.errorMessage ?? Strings.error_self_reg.tr(),
            result.errorCode ?? ErrorCodes.badRequest400,
          );
        }
        return true;
      }

      final gender = payload.gender?.trim();
      final legalField = payload.legalField?.trim();
      final city = payload.city?.trim();
      final workplace = payload.workplace?.trim();
      final officeName = payload.officeName?.trim();
      final licenseNumber = payload.licenseNumber?.trim();
      final nationalId = payload.nationalId?.trim();

      if (gender == null ||
          legalField == null ||
          city == null ||
          workplace == null ||
          officeName == null ||
          licenseNumber == null ||
          nationalId == null ||
          gender.isEmpty ||
          legalField.isEmpty ||
          city.isEmpty ||
          workplace.isEmpty ||
          officeName.isEmpty ||
          licenseNumber.isEmpty ||
          nationalId.isEmpty) {
        throw AuthException(Strings.error_fill_form.tr(), ErrorCodes.badRequest400);
      }

      final result = await authService.createLawyerAccount(
        name: name,
        email: payload.email,
        phone: payload.phone,
        gender: gender,
        password: payload.password,
        legalField: legalField,
        city: city,
        workplace: workplace,
        officeName: officeName,
        experienceYears: payload.experienceYears,
        licenseNumber: licenseNumber,
        nationalId: nationalId,
      );
      if (!result.isSuccess) {
        throw AuthException(
          result.errorMessage ?? Strings.error_self_reg.tr(),
          result.errorCode ?? ErrorCodes.badRequest400,
        );
      }
      return true;
    }, from: "AuthRepoImpl.selfRegComplete");
  }
}
