import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/presentation/ui/widget/headers/specialization_header.dart';
import 'package:silah_app/features/profiles/domain/entities/lawyer_profile_entity.dart';
import 'package:silah_app/features/profiles/presentation/views/lawyer_profile/widgets/lawyer_profile_details_card.dart';
import 'package:silah_app/features/profiles/presentation/views/lawyer_profile/widgets/lawyer_profile_summary_card.dart';

class LawyerProfileBody extends StatelessWidget {
  const LawyerProfileBody({
    super.key,
    required this.lawyer,
    this.specialization,
  });

  final LawyerProfileEntity lawyer;
  final String? specialization;

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
            ),
          ],
        ),
      ),
    );
  }
}
