import 'package:easy_localization/easy_localization.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';

extension AuthUserEx on AuthUserEntity? {
  String get displayName {
    final full = this?.fullName?.trim();
    if (full?.isNotEmpty == true) return full!;

    return Strings.no_name.tr();
  }

  String get safeEmail => this?.email?.trim().isNotEmpty == true
      ? this!.email!
      : Strings.no_email.tr();

  String get safePhone => this?.phone?.trim().isNotEmpty == true
      ? this!.phone!
      : Strings.no_phone.tr();
}
