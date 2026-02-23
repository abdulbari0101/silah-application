import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/config/extentions/string_validation.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart';
import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';

part 'app_state_data.mapper.dart';

@MappableClass()
class AppStateData with AppStateDataMappable {
  final bool isLoggedIn;
  final AuthUserEntity? customer; // local or remoteDS
  final UserAuthStatus userAuthStatus;

  AppStateData({
    this.isLoggedIn = false,

    this.customer,

    UserAuthStatus? userAuthStatus,
  }) : userAuthStatus =
           userAuthStatus ??
           computeUserAuthStatus(
             isLoggedIn: isLoggedIn,
             isDeviceVerified: customer?.phone.isNotNullOrEmpty ?? false,
             isAccountVerified: false,
             wasLoggedInBefore: customer?.phone.isNotNullOrEmpty ?? false,
           );

  static UserAuthStatus computeUserAuthStatus({
    required bool isLoggedIn,
    required bool isDeviceVerified,
    required bool isAccountVerified,
    required bool wasLoggedInBefore,
  }) {
    if (isLoggedIn) {
      if (!isDeviceVerified) return UserAuthStatus.loggedInUnverifiedDevice;
      if (!isAccountVerified) return UserAuthStatus.loggedInUnverifiedAccount;
      return UserAuthStatus.loggedInFullyVerified;
    } else if (wasLoggedInBefore) {
      return UserAuthStatus.loggedOutReturningUser;
    } else {
      return UserAuthStatus.firstTimeGuest;
    }
  }
}
