import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/features/profiles/domain/entities/lawyer_profile_entity.dart';
import 'package:silah_app/features/profiles/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> fetchProfile();

  Future<Either<Failure, ProfileEntity>> updateProfile(ProfileEntity profile);

  Future<Either<Failure, LawyerProfileEntity>> fetchLawyerProfile(String lawyerId);

  Future<Either<Failure, LawyerProfileEntity>> updateLawyerProfile(
    LawyerProfileEntity profile,
  );
}
