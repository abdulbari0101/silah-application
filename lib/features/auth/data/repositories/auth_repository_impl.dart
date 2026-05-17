import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:silah_app/core/config/extentions/string_validation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/data/local/cache/readers/setting_reader.dart';
import 'package:silah_app/core/data/model/api/auth/token_model.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/error_codes.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/features/auth/data/datasources/local/auth_cache_data_source.dart';
import 'package:silah_app/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:silah_app/features/auth/data/models/auth_user_model.dart';
import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';
import 'package:silah_app/features/auth/domain/entities/registration_payload.dart';
import 'package:silah_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:silah_app/features/auth/domain/repositories/identity_base_repo.dart';
import 'package:silah_app/features/notifications/domain/repositories/device_token_repository.dart';
import 'package:silah_app/features/verification/domain/entities/verification_status.dart';
import 'package:silah_app/features/verification/domain/repositories/verification_repository.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDS;
  final AuthCacheDataSource cacheDS;
  final AuthIdentityRepo authIdentityRepo;
  final DeviceTokenRepository deviceFcmTokenRepository;
  final SettingReader settingReader;
  final VerificationRepository verificationRepository;
  final Executor executor;

  AuthRepoImpl({
    required this.remoteDS,
    required this.cacheDS,
    required this.executor,
    required this.authIdentityRepo,
    required this.deviceFcmTokenRepository,
    required this.settingReader,
    required this.verificationRepository,
  });

  @override
  Future<Either<Failure, AuthUserEntity>> signIn({
    required String email,
    required String password,
  }) async {
    return executor.runOnline(() async {
      final authUser = await remoteDS.signIn(email: email, password: password);
      return _persistAndBuildAuthData(authUser);
    }, from: 'AuthRepoImpl.signIn');
  }

  @override
  Future<Either<Failure, AuthUserEntity>> register(
    RegistrationPayload payload,
  ) async {
    return executor.runOnline(() async {
      final name = payload.fullName.isEmpty
          ? '${payload.firstName} ${payload.lastName}'.trim()
          : payload.fullName;

      AuthUserModel authUser;
      if (payload.accountType == RegistrationAccountType.user) {
        final model = AuthUserModel(
          accountType: AuthAccountType.user,
          fullName: name,
          email: payload.email,
          phone: payload.phone,
          password: payload.password,
          profile: {'avatarUrl': payload.avatarUrl, 'isTrainee': false},
        );
        authUser = await remoteDS.registerUser(user: model);
      } else {
        final gender = payload.gender?.trim();
        final genderId = payload.genderId?.trim();
        final legalFields = payload.legalFields
            ?.map((value) => value.trim())
            .where((value) => value.isNotEmpty)
            .toSet()
            .toList();
        final legalFieldIds = payload.legalFieldIds
            ?.map((value) => value.trim())
            .where((value) => value.isNotEmpty)
            .toSet()
            .toList();
        final city = payload.city?.trim();
        final cityId = payload.cityId?.trim();
        final countryId = payload.countryId?.trim();
        final workplace = payload.workplace?.trim();
        final workDestinationId = payload.workDestinationId?.trim();
        final officeName = payload.officeName?.trim();
        final licenseNumber = payload.licenseNumber?.trim();
        final nationalId = payload.nationalId?.trim();

        if ((gender == null && genderId == null) ||
            ((legalFields == null || legalFields.isEmpty) &&
                (legalFieldIds == null || legalFieldIds.isEmpty)) ||
            (city == null && cityId == null) ||
            (workplace == null && workDestinationId == null) ||
            officeName == null ||
            licenseNumber == null ||
            nationalId == null ||
            ((gender?.isEmpty ?? true) && (genderId?.isEmpty ?? true)) ||
            ((city?.isEmpty ?? true) && (cityId?.isEmpty ?? true)) ||
            ((workplace?.isEmpty ?? true) &&
                (workDestinationId?.isEmpty ?? true)) ||
            officeName.isEmpty ||
            licenseNumber.isEmpty ||
            nationalId.isEmpty) {
          throw AuthException(
            Strings.error_fill_form.tr(),
            ErrorCodes.badRequest400,
          );
        }

        final model = AuthUserModel(
          accountType: AuthAccountType.lawyer,
          fullName: name,
          email: payload.email,
          phone: payload.phone,
          password: payload.password,
          profile: {
            'gender': gender ?? genderId ?? '',
            'genderId': genderId,
            'legalFields': legalFields,
            'legalFieldIds': legalFieldIds,
            'city': city ?? cityId ?? '',
            'cityId': cityId,
            'countryId': countryId,
            'workplace': workplace ?? workDestinationId ?? '',
            'workDestinationId': workDestinationId,
            'officeName': officeName,
            'experienceYears': payload.experienceYears,
            'licenseNumber': licenseNumber,
            'nationalId': nationalId,
            'avatarUrl': payload.avatarUrl,
          },
        );
        authUser = await remoteDS.registerLawyer(user: model);
        await _cacheIdTokenIfNeeded(authUser.idToken);
        authUser = await _syncLawyerVerification(
          authUser: authUser,
          licenseNumber: licenseNumber,
          nationalId: nationalId,
        );
      }

      return _persistAndBuildAuthData(authUser);
    }, from: 'AuthRepoImpl.register');
  }

  @override
  Future<Either<Failure, bool>> sendPasswordReset({
    required String email,
  }) async {
    return executor.runOnline(() async {
      await remoteDS.sendPasswordReset(email: email);
      return true;
    }, from: 'AuthRepoImpl.sendPasswordReset');
  }

  @override
  Future<Either<Failure, bool>> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    return executor.runOnline(() async {
      await remoteDS.updatePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      return true;
    }, from: 'AuthRepoImpl.updatePassword');
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    return executor.runOffline(() async {
      await remoteDS.signOut();
      await cacheDS.clearToken();
      await cacheDS.clearUserId();
      return true;
    }, from: 'AuthRepoImpl.signOut');
  }

  Future<AuthUserEntity> _persistAndBuildAuthData(
    AuthUserModel authUser,
  ) async {
    final customer = authUser.toEntity();
    final userId = await authIdentityRepo.generateAndSaveUserId(customer);
    await _cacheSession(
      customer: authUser,
      userId: userId,
      idToken: authUser.idToken,
    );
    await _syncDeviceToken();
    return customer;
  }

  Future<void> _syncDeviceToken() async {
    try {
      final token = await settingReader.fcmToken();
      AppLogger().appInfo("fcmValue = $token", tag: "_syncDeviceToken");
      if (token.isNullOrEmpty) return;
      final result = await deviceFcmTokenRepository.registerDeviceFcmToken(
        deviceFcmToken: token!.trim(),
      );
      result.fold((_) => null, (_) => null);
    } catch (e) {
      AppLogger().appError(e, tag: "_syncDeviceToken");
      // ignore push token sync failures
    }
  }

  Future<AuthUserModel> _syncLawyerVerification({
    required AuthUserModel authUser,
    required String licenseNumber,
    required String nationalId,
  }) async {
    final result = await verificationRepository.verifyLicense(
      licenseNumber: licenseNumber,
      nationalId: nationalId,
    );

    return result.fold(
      (failure) {
        AppLogger().networkError(
          failure,
          tag: 'AuthRepoImpl._syncLawyerVerification',
        );
        return _recoverVerificationState(authUser);
      },
      (verification) => _applyVerificationState(authUser, verification.status),
    );
  }

  Future<void> _cacheSession({
    required AuthUserModel customer,
    required String userId,
    required String? idToken,
  }) async {
    await cacheDS.saveCustomer(customer: customer, userId: userId);

    await _cacheIdTokenIfNeeded(idToken);
  }

  Future<AuthUserModel> _recoverVerificationState(
    AuthUserModel authUser,
  ) async {
    final fallback = await verificationRepository.fetchVerificationStatus();
    return fallback.fold((_) => authUser, (verification) {
      final hasVerificationRecord =
          (verification.licenseNumber ?? '').isNotEmpty ||
          (verification.nationalId ?? '').isNotEmpty ||
          verification.status != VerificationStatus.pending;
      if (!hasVerificationRecord) {
        return authUser;
      }
      return _applyVerificationState(authUser, verification.status);
    });
  }

  AuthUserModel _applyVerificationState(
    AuthUserModel authUser,
    VerificationStatus status,
  ) {
    final updatedProfile = Map<String, dynamic>.from(authUser.profile ?? {});
    updatedProfile['verified'] = status == VerificationStatus.verified;
    updatedProfile['verificationStatus'] = status.name;
    return authUser.copyWith(profile: updatedProfile);
  }

  Future<void> _cacheIdTokenIfNeeded(String? idToken) async {
    if (idToken == null || idToken.isEmpty) {
      return;
    }
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
