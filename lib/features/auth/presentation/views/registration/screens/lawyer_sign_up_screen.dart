import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/cubits/form_cubit.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/empty_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/features/auth/presentation/cubits/lookups/registration_lookups_cubit.dart';

import '../widgets/auth_form_scaffold.dart';
import '../widgets/lawyer_sign_up_form.dart';

class LawyerSignUpScreen extends StatelessWidget {
  const LawyerSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => FormCubit()),
        BlocProvider(
          create: (_) => RegistrationLookupsCubit(
            lookupsRepository: locator(),
            discoveryRepository: locator(),
          )..loadGenders(),
        ),
      ],
      child: AuthFormScaffold(
        title: Strings.licensed_lawyer.tr(),
        subtitle: Strings.provide_legal_services_and_training.tr(),
        onBack: () => context.pop(),
        child: BlocBuilder<RegistrationLookupsCubit, RegistrationLookupsState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Center(child: ProgressStateWidget()),
              failure: (message) => Center(
                child: CustomeErrorWidget(
                  message: message,
                  onRetry: () =>
                      context.read<RegistrationLookupsCubit>().loadGenders(),
                ),
              ),
              ready: (genders, _, __, ___) {
                if (genders.isEmpty) {
                  return Center(
                    child: EmptyWidget(
                      title: Strings.no_data_to_display.tr(),
                      retryWidget: PrimaryButton(
                        text: Strings.try_again.tr(),
                        onTap: () => context
                            .read<RegistrationLookupsCubit>()
                            .loadGenders(),
                      ),
                    ),
                  );
                }
                return Column(
                  children: [
                    LawyerSignUpForm(
                      genders: genders,
                      onNext: (info) {
                        context.pushNamed(
                          AppRoutes.lawyerProfessionalInfo.name,
                          extra: info,
                        );
                      },
                    ),
                    UIConstants.bigHeight,
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
