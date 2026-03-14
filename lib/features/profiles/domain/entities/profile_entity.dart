import 'package:dart_mappable/dart_mappable.dart';

part 'profile_entity.mapper.dart';

@MappableClass()
class ProfileEntity with ProfileEntityMappable {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? city;
  final String? avatarUrl;
  final String? accountType;
  final bool isTrainee;
  final bool? verified;
  final String? verificationStatus;

  const ProfileEntity({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.city,
    this.avatarUrl,
    this.accountType,
    this.isTrainee = false,
    this.verified,
    this.verificationStatus,
  });
}
