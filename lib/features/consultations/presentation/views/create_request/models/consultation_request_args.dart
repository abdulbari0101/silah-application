import 'package:silah_app/features/profiles/domain/entities/lawyer_profile_entity.dart';

class ConsultationRequestArgs {
  final LawyerProfileEntity lawyer;
  final String? specializationId;
  final String? specializationLabel;

  const ConsultationRequestArgs({
    required this.lawyer,
    this.specializationId,
    this.specializationLabel,
  });
}
