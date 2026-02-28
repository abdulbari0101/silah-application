import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/features/profiles/domain/entities/lawyer_profile_entity.dart';

part 'discovery_request_entity.mapper.dart';

@MappableClass()
class DiscoveryRequestEntity with DiscoveryRequestEntityMappable {
  final String? specializationId;
  final String? specializationName;
  final List<String>? lawyerIds;
  final String? cityId;
  final String? availability;
  final int? limit;
  final LawyerProfileEntity? lawyer;

  const DiscoveryRequestEntity({
    this.specializationId,
    this.specializationName,
    this.lawyerIds,
    this.cityId,
    this.availability,
    this.limit,
    this.lawyer,
  });
}
