import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';

part 'legal_specialization_model.mapper.dart';

@MappableClass(ignoreNull: true)
class LegalSpecializationModel with LegalSpecializationModelMappable {
  final String? id;
  final String? nameAr;
  final String? nameEn;
  final bool? active;

  const LegalSpecializationModel({
    this.id,
    this.nameAr,
    this.nameEn,
    this.active,
  });

  LegalSpecializationEntity toEntity() => LegalSpecializationEntity(
        id: id,
        code: nameEn,
        name: (nameAr?.isNotEmpty == true) ? nameAr : nameEn,
        description: null,
        keywords: null,
      );
}
