import 'package:dart_mappable/dart_mappable.dart';

part 'legal_specialization_entity.mapper.dart';

@MappableClass()
class LegalSpecializationEntity with LegalSpecializationEntityMappable {
  final String? id;
  final String? code;
  final String? name;
  final String? description;
  final String? iconUrl;
  final List<String>? keywords;

  const LegalSpecializationEntity({
    this.id,
    this.code,
    this.name,
    this.description,
    this.iconUrl,
    this.keywords,
  });
}
