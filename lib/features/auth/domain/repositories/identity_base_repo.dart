import 'package:silah_app/core/domain/repositories/identity_repo.dart';
import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';

abstract class AuthIdentityRepo implements IdentityRepo {
  // serial number
  Future<void> saveDeviceId(String serial);
  Future<String> getOrCreateDeviceId();

  // use cCode (non changable value)
  // used to store favorites , contacts , other non user shared values
  Future<String> generateAndSaveUserId(AuthUserEntity customer);
}

// MasterData , parmamters ,
