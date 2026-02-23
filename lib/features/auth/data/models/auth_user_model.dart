import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';

part 'auth_user_model.mapper.dart';

@MappableClass(ignoreNull: true)
class AuthUserModel with AuthUserModelMappable {
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
        profile: profile,
      );
}
