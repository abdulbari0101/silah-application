import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';

class AuthUserModel {
  final String? uid;
  final String? fullName;
  final String? email;
  final String? phone;
  final AuthAccountType accountType;
  final String? password;
  final String? idToken;
  final Map<String, dynamic>? profile;

  const AuthUserModel({
    this.uid,
    required this.accountType,
    this.fullName,
    this.email,
    this.phone,
    this.password,
    this.idToken,
    this.profile,
  });

  AuthUserEntity toEntity() => AuthUserEntity(
        uid: uid,
        accountType: accountType,
        fullName: fullName,
        email: email,
        phone: phone,
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'fullName': fullName,
        'email': email,
        'phone': phone,
        'accountType': accountType.name,
      };

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    final email = (json['email'] ?? json['EMAIL']) as String?;
    final phone = (json['phone'] ?? json['mMobileNo']) as String?;
    final fullName = (json['fullName'] ?? json['NAME']) as String?;
    final typeName = json['accountType'] ?? json['typeName'] ?? json['TYPENAME'];
    final typeNo = json['typeNo'] ?? json['TYPENO'];

    String? uid = json['uid'] as String?;
    uid ??= json['cCode'] as String? ?? json['CCODE'] as String?;
    uid ??= json['shortCode'] as String? ?? json['SHORTCODE'] as String?;
    uid ??= email ?? phone;

    return AuthUserModel(
      uid: uid,
      accountType: parseAccountType(typeName ?? typeNo),
      fullName: fullName,
      email: email,
      phone: phone,
    );
  }

  static AuthAccountType parseAccountType(dynamic value) {
    if (value is AuthAccountType) return value;
    if (value is int) {
      return value == 2 ? AuthAccountType.lawyer : AuthAccountType.user;
    }
    switch (value?.toString().toLowerCase()) {
      case 'lawyer':
      case '2':
        return AuthAccountType.lawyer;
      case 'user':
      case '1':
      default:
        return AuthAccountType.user;
    }
  }
}
