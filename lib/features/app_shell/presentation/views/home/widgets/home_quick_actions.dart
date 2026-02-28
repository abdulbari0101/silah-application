import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/router/route_info.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/features/app_shell/presentation/views/main/widget/navigation/nav_items_builder.dart';
import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';

class HomeQuickActions extends StatelessWidget {
  const HomeQuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select<AppStateBloc, AuthUserEntity?>(
      (bloc) => bloc.state.data.customer,
    );
    final role = resolveAppUserRole(user);

    final actions = _buildActions(role);

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = (constraints.maxWidth - UIConstants.smallPadding) / 2;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.today_summary.tr(),
              style: context.textTheme.titleMedium,
            ),
            UIConstants.smallHeight,
            Wrap(
              spacing: UIConstants.smallPadding,
              runSpacing: UIConstants.smallPadding,
              children: actions
                  .map(
                    (action) => SizedBox(
                      width: cardWidth,
                      child: _HomeActionCard(action: action),
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      },
    );
  }

  List<_HomeAction> _buildActions(AppUserRole role) {
    switch (role) {
      case AppUserRole.admin:
        return [
          _HomeAction(
            title: Strings.specializations.tr(),
            subtitle: Strings.manage_consultations_clients_and_training.tr(),
            icon: Icons.layers_outlined,
            route: AppRoutes.specifications,
          ),
          _HomeAction(
            title: Strings.messages.tr(),
            subtitle: Strings.incoming_requests.tr(),
            icon: Icons.chat_bubble_outline,
            route: AppRoutes.messages,
          ),
        ];
      case AppUserRole.lawyer:
        return [
          _HomeAction(
            title: Strings.my_requests.tr(),
            subtitle: Strings.new_consultations.tr(),
            icon: Icons.assignment_outlined,
            route: AppRoutes.requests,
          ),
          _HomeAction(
            title: Strings.training_requests.tr(),
            subtitle: Strings.incoming_requests.tr(),
            icon: Icons.school_outlined,
            route: AppRoutes.trainees,
          ),
          _HomeAction(
            title: Strings.messages.tr(),
            subtitle: Strings.incoming_requests.tr(),
            icon: Icons.chat_bubble_outline,
            route: AppRoutes.messages,
          ),
        ];
      case AppUserRole.user:
        return [
          _HomeAction(
            title: Strings.my_requests.tr(),
            subtitle: Strings.current_requests.tr(),
            icon: Icons.assignment_outlined,
            route: AppRoutes.requests,
          ),
          _HomeAction(
            title: Strings.messages.tr(),
            subtitle: Strings.incoming_requests.tr(),
            icon: Icons.chat_bubble_outline,
            route: AppRoutes.messages,
          ),
        ];
    }
  }
}

class _HomeAction {
  final String title;
  final String subtitle;
  final IconData icon;
  final RouteInfo route;

  _HomeAction({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.route,
  });
}

class _HomeActionCard extends StatelessWidget {
  const _HomeActionCard({required this.action});

  final _HomeAction action;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: context.shapes.brMd,
      onTap: () => context.pushNamed(action.route.name),
      child: Container(
        padding: const EdgeInsets.all(UIConstants.mediumPadding),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerHighest,
          borderRadius: context.shapes.brMd,
          border: Border.all(color: context.colors.outlineVariant.withAlphaOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: context.colors.primaryContainer,
                borderRadius: context.shapes.brSm,
              ),
              child: Icon(action.icon, color: context.colors.primary, size: 20),
            ),
            UIConstants.smallHeight,
            Text(
              action.title,
              style: context.textTheme.titleSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            UIConstants.xsmallHeight,
            Text(
              action.subtitle,
              style: context.textTheme.labelSmall?.copyWith(color: context.colors.onSurfaceVariant),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
