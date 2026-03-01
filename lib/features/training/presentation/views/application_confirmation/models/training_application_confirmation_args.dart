import 'package:silah_app/features/training/domain/entities/training_application_entity.dart';
import 'package:silah_app/features/training/domain/entities/training_opportunity_entity.dart';

class TrainingApplicationConfirmationArgs {
  final TrainingOpportunityEntity opportunity;
  final TrainingApplicationEntity application;

  const TrainingApplicationConfirmationArgs({
    required this.opportunity,
    required this.application,
  });
}
