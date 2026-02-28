import 'package:dart_mappable/dart_mappable.dart';

import 'availability_status.dart';

part 'lawyer_profile_entity.mapper.dart';

@MappableClass()
class LawyerProfileEntity with LawyerProfileEntityMappable {
  final String? id;
  final String? fullName;
  final String? licenseNumber;
  final List<String>? legalFieldIds;
  final String? city;
  final String? workplace;
  final int? yearsOfExperience;
  final String? avatarUrl;
  final bool acceptsTrainees;
  final AvailabilityStatus availability;

  const LawyerProfileEntity({
    this.id,
    this.fullName,
    this.licenseNumber,
    this.legalFieldIds,
    this.city,
    this.workplace,
    this.yearsOfExperience,
    this.avatarUrl,
    this.acceptsTrainees = false,
    this.availability = AvailabilityStatus.available,
  });
}
