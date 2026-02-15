import 'package:easy_localization/easy_localization.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/domain/entities/api/auth/customer_entity.dart';

extension CustomerEx on CustomerEntity? {
  String get displayName {
    final full = this?.fullName?.trim();
    if (full?.isNotEmpty == true) return full!;

    final first = this?.firstName?.trim();
    final last = this?.lastName?.trim();

    if (first?.isNotEmpty == true && last?.isNotEmpty == true) {
      return '$first $last';
    } else if (first?.isNotEmpty == true) {
      return first!;
    } else if (last?.isNotEmpty == true) {
      return last!;
    }

    return Strings.no_name.tr();
  }

  String get safeFirstName =>
      this?.firstName?.trim().isNotEmpty == true ? this!.firstName! : Strings.no_name.tr();

  String get safeLastName =>
      this?.lastName?.trim().isNotEmpty == true ? this!.lastName! : Strings.no_surname.tr();

  String get safeEmail =>
      this?.email?.trim().isNotEmpty == true ? this!.email! : Strings.no_email.tr();

  String get safePhone =>
      this?.mobileNo?.trim().isNotEmpty == true ? this!.mobileNo! : Strings.no_phone.tr();

  String get safeBirthDate =>
      this?.birthDate?.trim().isNotEmpty == true ? this!.birthDate! : Strings.no_birth_date.tr();

}
