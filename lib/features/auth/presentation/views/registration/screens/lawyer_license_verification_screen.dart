import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/cubits/form_cubit.dart';
import 'package:silah_app/core/presentation/ui/overlays/dialogs/dialog_service.dart';
import 'package:silah_app/features/auth/presentation/blocs/registration/registration_bloc.dart';
import 'package:silah_app/features/auth/presentation/blocs/registration/registration_operation_type.dart';

import '../models/lawyer_registration_data.dart';
import '../widgets/auth_form_scaffold.dart';
import '../widgets/lawyer_license_verification_form.dart';

class LawyerLicenseVerificationScreen extends StatelessWidget {
  final LawyerProfessionalInfo professionalInfo;

  const LawyerLicenseVerificationScreen({
    super.key,
    required this.professionalInfo,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<RegistrationBloc>()),
        BlocProvider(create: (_) => FormCubit()),
      ],
      child: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationError) {
            DialogService.showErrorDialog(
              context,
              title: Strings.error.tr(),
              desc: state.message,
            );
          }
          if (state is RegistrationStepSuccess &&
              state.operationType == RegistrationOperType.reqComplete) {
            context.goNamed(AppRoutes.home.name);
          }
        },
        child: AuthFormScaffold(
          title: Strings.license_number.tr(),
          subtitle: Strings.verify_subtitle.tr(),
          onBack: () => context.pop(),
          child: BlocBuilder<RegistrationBloc, RegistrationState>(
            builder: (context, state) {
              final isLoading = state is RegistrationInProgress;
              return LawyerLicenseVerificationForm(
                professionalInfo: professionalInfo,
                isLoading: isLoading,
                onSubmit: (payload) {
                  context.read<RegistrationBloc>().add(
                    RegisterUser(payload: payload),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
