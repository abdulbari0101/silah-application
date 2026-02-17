import 'package:dart_mappable/dart_mappable.dart';

part 'training_opportunity_entity.mapper.dart';

@MappableClass()
class TrainingOpportunityEntity with TrainingOpportunityEntityMappable {
  final int? id;
  final String? lawyerId;
  final String? title;
  final String? description;
  final String? city;
  final bool isOpen;
  final String? createdAt;

  const TrainingOpportunityEntity({
    this.id,
    this.lawyerId,
    this.title,
    this.description,
    this.city,
    this.isOpen = true,
    this.createdAt,
  });
}
