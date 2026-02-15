
import 'package:dart_mappable/dart_mappable.dart';

part 'app_auth_status.mapper.dart';

@MappableEnum()

enum UserAuthStatus {
  /// User has never logged in on this device before
  firstTimeGuest,

  /// Logged out but previously logged in on this device
  loggedOutReturningUser,

  /// Logged in, device is verified via OTP, but KYC/account is not completed
  loggedInUnverifiedAccount,



  /// Logged in, but device not yet verified via OTP (registration step not completed)
  loggedInUnverifiedDevice,

  /// Fully logged in with both device + account verified
  loggedInFullyVerified,
}
