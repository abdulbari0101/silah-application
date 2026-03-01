import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/router/route_info.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/extensions/app_setting_context_extension.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/features/app_shell/presentation/views/main/widget/navigation/nav_items_builder.dart';
import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';

class HomeQuickActions extends StatelessWidget {
  const HomeQuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select<AppStateBloc, AuthUserEntity?>((bloc) => bloc.state.data.customer);
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
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colors.primary,
                fontWeight: FontWeight.w700,
              ),
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
            icon: Icons.layers_outlined,
            route: AppRoutes.specifications,
          ),
          _HomeAction(
            title: Strings.messages.tr(),
            icon: Icons.chat_bubble_outline,
            route: AppRoutes.messages,
          ),
        ];
      case AppUserRole.lawyer:
        return [
          _HomeAction(
            title: Strings.new_consultations.tr(),
            icon: Icons.assignment_outlined,
            route: AppRoutes.requests,
          ),
          _HomeAction(
            title: Strings.training_requests.tr(),
            icon: Icons.school_outlined,
            route: AppRoutes.trainees,
          ),
        ];
      case AppUserRole.user:
        return [
          _HomeAction(
            title: Strings.my_requests.tr(),
            icon: Icons.assignment_outlined,
            route: AppRoutes.requests,
          ),
          _HomeAction(
            title: Strings.specializations.tr(),
            icon: Icons.search_outlined,
            route: AppRoutes.searchFilter,
          ),
          _HomeAction(
            title: Strings.messages.tr(),
            icon: Icons.chat_bubble_outline,
            route: AppRoutes.messages,
          ),
        ];
    }
  }
}

class _HomeAction {
  final String title;
  final IconData icon;
  final RouteInfo route;
  final String? count;

  _HomeAction({required this.title, required this.icon, required this.route});
}

class _HomeActionCard extends StatelessWidget {
  const _HomeActionCard({required this.action});

  final _HomeAction action;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: context.shapes.brLg,
      onTap: () => context.pushNamed(action.route.name),
      child: Container(
        padding: const EdgeInsets.all(UIConstants.mediumPadding),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerLow,
          borderRadius: context.shapes.brLg,
        ),
        child: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(color: context.colors.primary, shape: BoxShape.circle),
              child: Icon(
                context.isRTL ? Icons.arrow_back : Icons.arrow_forward,
                color: context.colors.onPrimary,
                size: 16,
              ),
            ),
            UIConstants.smallWidth,
            Expanded(
              child: Text(
                action.title,
                style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (action.count != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: context.colors.primary,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  action.count!,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colors.onPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
