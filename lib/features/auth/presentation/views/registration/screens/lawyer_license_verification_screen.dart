import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/cubits/form_cubit.dart';
import 'package:silah_app/core/presentation/ui/overlays/dialogs/dialog_service.dart';
import 'package:silah_app/features/auth/presentation/blocs/self_registration/self_reg_operation_type.dart';
import 'package:silah_app/features/auth/presentation/blocs/self_registration/self_registration_bloc.dart';
import '../models/lawyer_registration_data.dart';
import '../widgets/auth_form_scaffold.dart';
import '../widgets/lawyer_license_verification_form.dart';

class LawyerLicenseVerificationScreen extends StatelessWidget {
  final LawyerProfessionalInfo professionalInfo;

  const LawyerLicenseVerificationScreen({super.key, required this.professionalInfo});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<SelfRegBloc>()),
        BlocProvider(create: (_) => FormCubit()),
      ],
      child: BlocListener<SelfRegBloc, SelfRegState>(
        listener: (context, state) {
          if (state is SelfRegError) {
            DialogService.showErrorDialog(
              context,
              title: Strings.error.tr(),
              desc: state.message,
            );
          }
          if (state is SelfRegStepSuccess &&
              state.operationType == SelfRegOperType.SelfReqComplete) {
            context.goNamed(AppRoutes.home.name);
          }
        },
        child: AuthFormScaffold(
          title: Strings.license_number.tr(),
          subtitle: Strings.verify_subtitle.tr(),
          onBack: () => context.pop(),
          child: BlocBuilder<SelfRegBloc, SelfRegState>(
            builder: (context, state) {
              final isLoading = state is SelfRegInProgress;
              return LawyerLicenseVerificationForm(
                professionalInfo: professionalInfo,
                isLoading: isLoading,
                onSubmit: (payload) {
                  context.read<SelfRegBloc>().add(SelfRegComplete(payload: payload));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
