import 'package:dart_mappable/dart_mappable.dart';

import 'training_application_status.dart';

part 'training_application_entity.mapper.dart';

@MappableClass()
class TrainingApplicationEntity with TrainingApplicationEntityMappable {
  final int? id;
  final int? opportunityId;
  final String? traineeId;
  final String? fullName;
  final String? university;
  final String? faculty;
  final String? city;
  final String? graduationYear;
  final String? cvUrl;
  final TrainingApplicationStatus status;
  final String? submittedAt;

  const TrainingApplicationEntity({
    this.id,
    this.opportunityId,
    this.traineeId,
    this.fullName,
    this.university,
    this.faculty,
    this.city,
    this.graduationYear,
    this.cvUrl,
    this.status = TrainingApplicationStatus.pending,
    this.submittedAt,
  });
}
