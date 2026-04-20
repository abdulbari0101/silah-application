import 'package:dart_mappable/dart_mappable.dart';

import 'availability_status.dart';

part 'lawyer_profile_entity.mapper.dart';

@MappableClass()
class LawyerProfileEntity with LawyerProfileEntityMappable {
  final String? id;
  final String? fullName;
  final String? licenseNumber;
  final List<String>? legalFields;
  final List<String>? legalFieldIds;
  final String? city;
  final String? cityId;
  final String? areaId;
  final String? workplace;
  final String? workDestinationId;
  final int? yearsOfExperience;
  final String? avatarUrl;
  final bool acceptsTrainees;
  final AvailabilityStatus availability;
  final String? officeName;

  const LawyerProfileEntity({
    this.id,
    this.fullName,
    this.licenseNumber,
    this.legalFields,
    this.legalFieldIds,
    this.city,
    this.cityId,
    this.areaId,
    this.workplace,
    this.officeName,
    this.workDestinationId,
    this.yearsOfExperience,
    this.avatarUrl,
    this.acceptsTrainees = false,
    this.availability = AvailabilityStatus.available,
  });
}
