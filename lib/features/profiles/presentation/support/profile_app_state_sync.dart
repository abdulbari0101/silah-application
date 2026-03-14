import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/features/auth/presentation/support/auth_user_auth_status_resolver.dart';
import 'package:silah_app/features/profiles/domain/entities/profile_entity.dart';

void syncProfileToAppState({
  required AppStateBloc appStateBloc,
  required ProfileEntity profile,
}) {
  final authUser = appStateBloc.state.data.customer;
  if (authUser == null) return;

  final resolvedAccountType =
      profile.accountType ?? authUser.profile?['accountType']?.toString();
  final isLawyer = resolvedAccountType?.toLowerCase() == 'lawyer';

  final nextProfile = <String, dynamic>{
    ...?authUser.profile,
    if (profile.name != null) 'name': profile.name,
    if (profile.email != null) 'email': profile.email,
    if (profile.phone != null) 'phone': profile.phone,
    if (profile.city != null) 'city': profile.city,
    if (profile.avatarUrl != null) 'avatarUrl': profile.avatarUrl,
    if (profile.accountType != null) 'accountType': profile.accountType,
    'isTrainee': profile.isTrainee,
    if (isLawyer) 'acceptsTrainees': profile.isTrainee,
    if (profile.verified != null) 'verified': profile.verified,
    if (profile.verificationStatus != null)
      'verificationStatus': profile.verificationStatus,
  };

  final updated = authUser.copyWith(
    fullName: profile.name ?? authUser.fullName,
    email: profile.email ?? authUser.email,
    phone: profile.phone ?? authUser.phone,
    profile: nextProfile,
  );

  appStateBloc.add(
    UpdateSession(
      authData: updated,
      userAuthStatus: resolveUserAuthStatus(updated),
    ),
  );
}
