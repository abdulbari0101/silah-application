import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/data/model/api/auth/customer_model.dart';
import 'package:silah_app/core/data/model/api/auth/token_model.dart';
import 'package:silah_app/core/domain/entities/api/auth/customer_entity.dart';
import 'package:silah_app/core/data/local/cache/readers/setting_reader.dart';
import 'package:silah_app/core/infrastructure/errors/error_codes.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/features/auth/data/datasources/local/auth_cache_data_source.dart';
import 'package:silah_app/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:silah_app/features/auth/data/models/auth_user_model.dart';
import 'package:silah_app/features/auth/domain/entities/auth_ex_data_entity.dart';
import 'package:silah_app/features/auth/domain/entities/self_registration_payload.dart';
import 'package:silah_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:silah_app/features/auth/domain/repositories/identity_base_repo.dart';
import 'package:silah_app/features/notifications/domain/repositories/device_token_repository.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDS;
  final AuthCacheDataSource cacheDS;
  final AuthIdentityRepo authIdentityRepo;
  final DeviceTokenRepository deviceTokenRepository;
  final SettingReader settingReader;
  final Executor executor;

  AuthRepoImpl({
    required this.remoteDS,
    required this.cacheDS,
    required this.executor,
    required this.authIdentityRepo,
    required this.deviceTokenRepository,
    required this.settingReader,
  });

  @override
  Future<Either<Failure, ExDataAuthEntity>> signIn({
    required String email,
    required String password,
  }) async {
    return executor.runOnline(
      () async {
        final authUser = await remoteDS.signIn(email: email, password: password);
        return _persistAndBuildAuthData(authUser);
      },
      from: 'AuthRepoImpl.signIn',
    );
  }

  @override
  Future<Either<Failure, ExDataAuthEntity>> register(SelfRegistrationPayload payload) async {
    return executor.runOnline(
      () async {
        final name = payload.fullName.isEmpty
            ? '${payload.firstName} ${payload.lastName}'.trim()
            : payload.fullName;

        AuthUserModel authUser;
        if (payload.accountType == SelfRegAccountType.user) {
          authUser = await remoteDS.registerUser(
            name: name,
            email: payload.email,
            phone: payload.phone,
            password: payload.password,
            avatarUrl: payload.avatarUrl,
          );
        } else {
          final gender = payload.gender?.trim();
          final genderId = payload.genderId?.trim();
          final legalField = payload.legalField?.trim();
          final legalFieldId = payload.legalFieldId?.trim();
          final city = payload.city?.trim();
          final cityId = payload.cityId?.trim();
          final areaId = payload.areaId?.trim();
          final workplace = payload.workplace?.trim();
          final workDestinationId = payload.workDestinationId?.trim();
          final officeName = payload.officeName?.trim();
          final licenseNumber = payload.licenseNumber?.trim();
          final nationalId = payload.nationalId?.trim();

          if ((gender == null && genderId == null) ||
              (legalField == null && legalFieldId == null) ||
              (city == null && cityId == null) ||
              (workplace == null && workDestinationId == null) ||
              officeName == null ||
              licenseNumber == null ||
              nationalId == null ||
              ((gender?.isEmpty ?? true) && (genderId?.isEmpty ?? true)) ||
              ((legalField?.isEmpty ?? true) && (legalFieldId?.isEmpty ?? true)) ||
              ((city?.isEmpty ?? true) && (cityId?.isEmpty ?? true)) ||
              ((workplace?.isEmpty ?? true) && (workDestinationId?.isEmpty ?? true)) ||
              officeName.isEmpty ||
              licenseNumber.isEmpty ||
              nationalId.isEmpty) {
            throw AuthException(Strings.error_fill_form.tr(), ErrorCodes.badRequest400);
          }

          authUser = await remoteDS.registerLawyer(
            name: name,
            email: payload.email,
            phone: payload.phone,
            gender: gender ?? genderId ?? '',
            genderId: genderId,
            password: payload.password,
            legalField: legalField ?? legalFieldId ?? '',
            legalFieldId: legalFieldId,
            city: city ?? cityId ?? '',
            cityId: cityId,
            areaId: areaId,
            workplace: workplace ?? workDestinationId ?? '',
            workDestinationId: workDestinationId,
            officeName: officeName,
            experienceYears: payload.experienceYears,
            licenseNumber: licenseNumber,
            nationalId: nationalId,
            avatarUrl: payload.avatarUrl,
          );
        }

        return _persistAndBuildAuthData(authUser);
      },
      from: 'AuthRepoImpl.register',
    );
  }

  @override
  Future<Either<Failure, bool>> sendPasswordReset({required String email}) async {
    return executor.runOnline(
      () async {
        await remoteDS.sendPasswordReset(email: email);
        return true;
      },
      from: 'AuthRepoImpl.sendPasswordReset',
    );
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    return executor.runOffline(
      () async {
        await remoteDS.signOut();
        await cacheDS.clearToken();
        await cacheDS.clearUserId();
        return true;
      },
      from: 'AuthRepoImpl.signOut',
    );
  }

  Future<ExDataAuthEntity> _persistAndBuildAuthData(AuthUserModel authUser) async {
    final customer = authUser.toCustomerEntity();
    final userId = await authIdentityRepo.generateAndSaveUserId(customer);
    await _cacheSession(customer: customer, userId: userId, idToken: authUser.idToken);
    await _syncDeviceToken();
    return ExDataAuthEntity(customer: customer);
  }

  Future<void> _syncDeviceToken() async {
    try {
      final token = await settingReader.fcmToken();
      if (token == null || token.trim().isEmpty) return;
      final result = await deviceTokenRepository.registerDeviceToken(deviceToken: token.trim());
      result.fold((_) => null, (_) => null);
    } catch (_) {
      // ignore push token sync failures
    }
  }

  Future<void> _cacheSession({
    required CustomerEntity customer,
    required String userId,
    required String? idToken,
  }) async {
    await cacheDS.saveCustomer(
      customer: CustomerModel.fromEntity(customer),
      userId: userId,
    );

    if (idToken != null && idToken.isNotEmpty) {
      await cacheDS.cacheLoginToken(
        TokenModel(
          accessToken: idToken,
          tokenType: 'Bearer',
          expiresIn: 3600,
          scope: 'firebase',
        ),
      );
    }
  }
}
