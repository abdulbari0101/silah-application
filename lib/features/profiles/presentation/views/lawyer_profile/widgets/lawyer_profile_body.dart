import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/presentation/ui/widget/headers/specialization_header.dart';
import 'package:silah_app/features/consultations/presentation/views/create_request/models/consultation_request_args.dart';
import 'package:silah_app/features/profiles/domain/entities/lawyer_profile_entity.dart';
import 'package:silah_app/features/profiles/presentation/views/lawyer_profile/widgets/lawyer_profile_details_card.dart';
import 'package:silah_app/features/profiles/presentation/views/lawyer_profile/widgets/lawyer_profile_summary_card.dart';
import 'package:silah_app/features/training/presentation/views/opportunities/models/training_opportunities_args.dart';

class LawyerProfileBody extends StatelessWidget {
  const LawyerProfileBody({
    super.key,
    required this.lawyer,
    this.specialization,
    this.specializationId,
  });

  final LawyerProfileEntity lawyer;
  final String? specialization;
  final String? specializationId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: UIConstants.screenHorizantalPadding,
          vertical: UIConstants.bigPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpecializationHeader(title: specialization),
            UIConstants.bigHeight,
            LawyerProfileSummaryCard(
              lawyer: lawyer,
              specialization: specialization,
            ),
            UIConstants.bigHeight,
            LawyerProfileDetailsCard(
              lawyer: lawyer,
              specialization: specialization,
              onRequestConsultation: specializationId == null && specialization == null
                  ? null
                  : () => _requestConsultation(context),
              onRequestTraining: lawyer.id == null
                  ? null
                  : () => _openTrainingOpportunities(context, lawyer.id!),
            ),
          ],
        ),
      ),
    );
  }

  void _requestConsultation(BuildContext context) {
    context.pushNamed(
      AppRoutes.requestConsultation.name,
      extra: ConsultationRequestArgs(
        lawyer: lawyer,
        specializationId: specializationId,
        specializationLabel: specialization,
      ),
    );
  }

  void _openTrainingOpportunities(BuildContext context, String lawyerUid) {
    context.pushNamed(
      AppRoutes.trainingOpportunities.name,
      extra: TrainingOpportunitiesArgs(lawyerUid: lawyerUid),
    );
  }
}
