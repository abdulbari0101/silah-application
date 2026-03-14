import 'package:silah_app/features/training/domain/entities/training_application_entity.dart';

class TrainingApplicationDetailsArgs {
  final TrainingApplicationEntity application;

  const TrainingApplicationDetailsArgs({required this.application});

  Map<String, dynamic> toJson() {
    return {'application': application.toJson()};
  }

  static TrainingApplicationDetailsArgs? fromExtra(Object? extra) {
    if (extra is TrainingApplicationDetailsArgs) {
      return extra;
    }
    if (extra is Map) {
      final rawApplication = extra['application'];
      if (rawApplication is Map) {
        return TrainingApplicationDetailsArgs(
          application: TrainingApplicationEntityMapper.fromJson(
            Map<String, dynamic>.from(rawApplication),
          ),
        );
      }
    }
    return null;
  }
}
