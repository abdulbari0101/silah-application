import 'package:dart_mappable/dart_mappable.dart';

part 'auth_user_entity.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.lowerCase)
enum AuthAccountType { user, lawyer }

@MappableClass(ignoreNull: true)
class AuthUserEntity with AuthUserEntityMappable {
  final String? uid;
  final String? fullName;
  final String? email;
  final String? phone;
  final AuthAccountType accountType;
  const AuthUserEntity({
    this.uid,
    this.fullName,
    this.email,
    this.phone,
    this.accountType = AuthAccountType.user,
  });
}
