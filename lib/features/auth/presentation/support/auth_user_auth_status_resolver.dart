import 'package:silah_app/core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart';
import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';

UserAuthStatus resolveUserAuthStatus(AuthUserEntity authUser) {
  if (authUser.accountType != AuthAccountType.lawyer) {
    return UserAuthStatus.loggedInFullyVerified;
  }

  final isVerified = authUser.profile?['verified'] == true;
  return isVerified
      ? UserAuthStatus.loggedInFullyVerified
      : UserAuthStatus.loggedInUnverifiedAccount;
}
