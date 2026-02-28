import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/system/executor.dart';
import 'package:silah_app/features/auth/data/datasources/local/auth_cache_data_source.dart';
import 'package:silah_app/features/auth/data/models/auth_user_model.dart';
import 'package:silah_app/features/auth/domain/repositories/identity_base_repo.dart';
import 'package:silah_app/features/profiles/data/datasources/remote/profile_remote_data_source.dart';
import 'package:silah_app/features/profiles/domain/entities/lawyer_profile_entity.dart';
import 'package:silah_app/features/profiles/domain/entities/profile_entity.dart';
import 'package:silah_app/features/profiles/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final Executor executor;
  final AuthCacheDataSource cacheDataSource;
  final AuthIdentityRepo identityRepo;

  ProfileRepositoryImpl({
    required this.remoteDataSource,
    required this.executor,
    required this.cacheDataSource,
    required this.identityRepo,
  });

  @override
  Future<Either<Failure, ProfileEntity>> fetchProfile() {
    return executor.runOnline(() async {
      return remoteDataSource.fetchProfile();
    }, from: 'ProfileRepository.fetchProfile');
  }

  @override
  Future<Either<Failure, ProfileEntity>> updateProfile(ProfileEntity profile) {
    return executor.runOnline(() async {
      final updated = await remoteDataSource.updateProfile(profile);
      await _syncCachedProfile(updated);
      return updated;
    }, from: 'ProfileRepository.updateProfile');
  }

  @override
  Future<Either<Failure, LawyerProfileEntity>> fetchLawyerProfile(String lawyerId) {
    throw const MissingDataException('Not implemented');
  }

  @override
  Future<Either<Failure, LawyerProfileEntity>> updateLawyerProfile(
    LawyerProfileEntity profile,
  ) {
    throw const MissingDataException('Not implemented');
  }

  Future<void> _syncCachedProfile(ProfileEntity profile) async {
    final cached = await cacheDataSource.customer();
    if (cached == null) return;

    final userId = await cacheDataSource.userId() ??
        await identityRepo.generateAndSaveUserId(cached.toEntity());

    final nextProfile = <String, dynamic>{
      ...?cached.profile,
      if (profile.name != null) 'name': profile.name,
      if (profile.email != null) 'email': profile.email,
      if (profile.phone != null) 'phone': profile.phone,
      if (profile.city != null) 'city': profile.city,
      if (profile.avatarUrl != null) 'avatarUrl': profile.avatarUrl,
      if (profile.accountType != null) 'accountType': profile.accountType,
      'isTrainee': profile.isTrainee,
    };

    final updated = AuthUserModel(
      uid: cached.uid,
      accountType: cached.accountType,
      fullName: cached.fullName,
      email: cached.email,
      phone: cached.phone,
      password: cached.password,
      idToken: cached.idToken,
      profile: nextProfile,
    );

    await cacheDataSource.saveCustomer(customer: updated, userId: userId);
  }
}
