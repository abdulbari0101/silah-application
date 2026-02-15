import 'package:silah_app/core/domain/entities/api/auth/customer_entity.dart';
import 'package:silah_app/core/domain/repositories/identity_repo.dart';

abstract class AuthIdentityRepo implements IdentityRepo {
  // serial number
  Future<void> saveDeviceId(String serial);
  Future<String> getOrCreateDeviceId();

  // use cCode (non changable value)
  // used to store favorites , contacts , other non user shared values
  Future<String> generateAndSaveUserId(CustomerEntity customer);

  // true when (no device token yet or mobile number has changed).
  Future<bool> isLoginFromNewDevice(String mobile);
}


// MasterData , parmamters , 