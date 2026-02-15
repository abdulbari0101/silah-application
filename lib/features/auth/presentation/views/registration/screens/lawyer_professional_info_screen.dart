import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/presentation/state_magment/cubits/form_cubit.dart';

import '../models/lawyer_registration_data.dart';
import '../widgets/auth_form_scaffold.dart';
import '../widgets/lawyer_professional_info_form.dart';

class LawyerProfessionalInfoScreen extends StatelessWidget {
  final LawyerPersonalInfo personalInfo;

  const LawyerProfessionalInfoScreen({super.key, required this.personalInfo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FormCubit(),
      child: AuthFormScaffold(
        title: Strings.specializations.tr(),
        subtitle: Strings.manage_consultations_clients_and_training.tr(),
        onBack: () => context.pop(),
        child: LawyerProfessionalInfoForm(
          personalInfo: personalInfo,
          onNext: (info) {
            context.pushNamed(AppRoutes.lawyerLicenseVerification.name, extra: info);
          },
        ),
      ),
    );
  }
}
