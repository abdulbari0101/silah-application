import 'package:flutter/material.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/profiles/domain/entities/lawyer_profile_entity.dart';
import 'package:silah_app/features/profiles/presentation/views/lawyer_profile/widgets/lawyer_profile_body.dart';

class LawyerProfileScreen extends StatelessWidget {
  const LawyerProfileScreen({super.key, required this.lawyer, this.specialization});

  final LawyerProfileEntity lawyer;
  final String? specialization;

  @override
  Widget build(BuildContext context) {
    return PlatformScreenWrapper(
      body: LawyerProfileBody(lawyer: lawyer, specialization: specialization),
    );
  }
}
