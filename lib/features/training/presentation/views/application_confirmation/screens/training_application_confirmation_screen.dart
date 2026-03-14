import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/router/route_extensions.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';
import 'package:silah_app/core/presentation/ui/screen/success/helper/success_screen_keys.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';
import 'package:silah_app/features/training/presentation/cubits/application/training_application_cubit.dart';
import 'package:silah_app/features/training/presentation/support/training_access_policy.dart';
import 'package:silah_app/features/training/presentation/views/application_confirmation/models/training_application_confirmation_args.dart';
import 'package:silah_app/features/training/presentation/views/application_confirmation/widgets/training_application_confirmation_body.dart';
import 'package:silah_app/features/training/presentation/views/shared/widgets/training_access_state.dart';

class TrainingApplicationConfirmationScreen extends StatelessWidget {
  const TrainingApplicationConfirmationScreen({super.key, required this.args});

  final TrainingApplicationConfirmationArgs args;

  @override
  Widget build(BuildContext context) {
    final currentUser = context.select<AppStateBloc, AuthUserEntity?>(
      (bloc) => bloc.state.data.customer,
    );
    final canRequestTraining = TrainingAccessPolicy.isTraineeUser(currentUser);

    return PlatformScreenWrapper(
      title: Strings.confirm_sending_training_request.tr(),
      body: canRequestTraining
          ? BlocProvider(
              create: (_) => TrainingApplicationCubit(repository: locator()),
              child:
                  BlocListener<
                    TrainingApplicationCubit,
                    TrainingApplicationState
                  >(
                    listener: (context, state) {
                      state.whenOrNull(
                        success: (_) {
                          context.goNamed(
                            AppRoutes.success.name,
                            extra: {
                              SuccessScreenKeys.title: Strings
                                  .training_request_sent_title
                                  .tr(),
                              SuccessScreenKeys.subtitle: Strings
                                  .training_request_sent_subtitle
                                  .tr(),
                              SuccessScreenKeys.primaryButtonLabel: Strings
                                  .start_now
                                  .tr(),
                              SuccessScreenKeys.onPrimaryRoute:
                                  AppRoutes.home.name,
                            },
                          );
                        },
                        failure: (message) => Toasts.error(context, message),
                      );
                    },
                    child: TrainingApplicationConfirmationBody(args: args),
                  ),
            )
          : TrainingAccessState(
              title: Strings.trainee_prompt_title.tr(),
              subtitle: Strings.trainee_prompt_description.tr(),
              actionLabel: Strings.trainee_prompt_action.tr(),
              onAction: () => context.openRoute(AppRoutes.settings),
            ),
    );
  }
}
