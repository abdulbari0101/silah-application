import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/router/route_extensions.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';
import 'package:silah_app/features/training/presentation/cubits/application/training_application_cubit.dart';
import 'package:silah_app/features/training/presentation/cubits/lookups/training_lookups_cubit.dart';
import 'package:silah_app/features/training/presentation/support/training_access_policy.dart';
import 'package:silah_app/features/training/presentation/views/application/models/training_application_args.dart';
import 'package:silah_app/features/training/presentation/views/application/widgets/training_application_form_body.dart';
import 'package:silah_app/features/training/presentation/views/shared/widgets/training_access_state.dart';

class TrainingApplicationFormScreen extends StatelessWidget {
  const TrainingApplicationFormScreen({super.key, required this.args});

  final TrainingApplicationArgs args;

  @override
  Widget build(BuildContext context) {
    final currentUser = context.select<AppStateBloc, AuthUserEntity?>(
      (bloc) => bloc.state.data.customer,
    );
    final canRequestTraining = TrainingAccessPolicy.isTraineeUser(currentUser);

    return PlatformScreenWrapper(
      title: Strings.request_training.tr(),
      body: canRequestTraining
          ? MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) =>
                      TrainingApplicationCubit(repository: locator()),
                ),
                BlocProvider(
                  create: (_) =>
                      TrainingLookupsCubit(repository: locator())..load(),
                ),
              ],
              child: TrainingApplicationFormBody(opportunity: args.opportunity),
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
