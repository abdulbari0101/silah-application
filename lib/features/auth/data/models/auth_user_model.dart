import 'package:silah_app/core/domain/entities/api/auth/customer_entity.dart';

enum AuthAccountType { user, lawyer }

class AuthUserModel {
  final String uid;
  final String? fullName;
  final String? email;
  final String? phone;
  final AuthAccountType accountType;
  final String? idToken;
  final Map<String, dynamic>? profile;

  const AuthUserModel({
    required this.uid,
    required this.accountType,
    this.fullName,
    this.email,
    this.phone,
    this.idToken,
    this.profile,
  });

  CustomerEntity toCustomerEntity() {
    final resolvedName = fullName?.trim() ?? '';
    final parts = resolvedName.split(RegExp(r'\\s+')).where((p) => p.isNotEmpty).toList();
    final firstName = parts.isNotEmpty ? parts.first : resolvedName;
    final lastName = parts.length > 1 ? parts.sublist(1).join(' ') : '';

    return CustomerEntity(
      fullName: resolvedName.isEmpty ? null : resolvedName,
      firstName: firstName.isEmpty ? null : firstName,
      lastName: lastName.isEmpty ? null : lastName,
      email: email,
      mobileNo: phone ?? email,
      typeName: accountType.name,
      typeNo: accountType == AuthAccountType.user ? 1 : 2,
    );
  }

  static AuthAccountType parseAccountType(String? value) {
    switch (value?.toLowerCase()) {
      case 'lawyer':
        return AuthAccountType.lawyer;
      case 'user':
      default:
        return AuthAccountType.user;
    }
  }
}
