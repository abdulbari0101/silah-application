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
import 'package:silah_app/features/training/presentation/cubits/trainees/trainees_cubit.dart';
import 'package:silah_app/features/training/presentation/support/training_access_policy.dart';
import 'package:silah_app/features/training/presentation/views/shared/widgets/training_access_state.dart';
import 'package:silah_app/features/training/presentation/views/trainees/widgets/trainees_body.dart';

class TraineesScreen extends StatelessWidget {
  const TraineesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = context.select<AppStateBloc, AuthUserEntity?>(
      (bloc) => bloc.state.data.customer,
    );
    final acceptsTrainees = TrainingAccessPolicy.currentLawyerAcceptsTrainees(
      currentUser,
    );

    return PlatformScreenWrapper(
      title: Strings.trainees.tr(),
      body: acceptsTrainees
          ? BlocProvider(
              create: (_) => TraineesCubit(repository: locator())..load(),
              child: const TraineesBody(),
            )
          : TrainingAccessState(
              title: Strings.trainees_disabled_title.tr(),
              subtitle: Strings.trainees_disabled_subtitle.tr(),
              actionLabel: Strings.trainees_disabled_action.tr(),
              onAction: () => context.openRoute(AppRoutes.settings),
            ),
    );
  }
}
