import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/features/app_shell/presentation/views/main/widget/navigation/nav_items_builder.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_result.dart';
import 'package:silah_app/features/notifications/domain/repositories/notification_repository.dart';

class HomeUserHeader extends StatelessWidget {
  const HomeUserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final name = context.select<AppStateBloc, String?>(
      (bloc) => bloc.state.data.customer?.fullName?.trim(),
    );
    final email = context.select<AppStateBloc, String?>(
      (bloc) => bloc.state.data.customer?.email?.trim(),
    );
    final displayName = (name != null && name.isNotEmpty)
        ? name
        : (email != null && email.isNotEmpty)
        ? email
        : Strings.user.tr();

    final greeting = Strings.home_greeting.tr(namedArgs: {'name': displayName});
    final role = context.select<AppStateBloc, AppUserRole>(
      (bloc) => resolveAppUserRole(bloc.state.data.customer),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildNotificationsButton(context),
        UIConstants.smallWidth,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greeting,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              UIConstants.xsmallHeight,
              _buildSubtitle(context, role),
            ],
          ),
        ),
        UIConstants.smallWidth,
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: context.colors.primaryContainer,
            shape: BoxShape.circle,
            border: Border.all(
              color: context.colors.primary.withAlphaOpacity(0.25),
              width: 1,
            ),
          ),
          child: Icon(
            Icons.person_outline_rounded,
            color: context.colors.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildSubtitle(BuildContext context, AppUserRole role) {
    if (role == AppUserRole.lawyer) {
      return Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: context.colors.primary,
              shape: BoxShape.circle,
            ),
          ),
          UIConstants.xsmallWidth,
          Text(
            Strings.valid_license.tr(),
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colors.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );
    }

    return Text(
      Strings.home_subtitle_user.tr(),
      style: context.textTheme.bodySmall?.copyWith(
        color: context.colors.onSurfaceVariant,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildNotificationsButton(BuildContext context) {
    final repo = locator<NotifyRepo>();
    return StreamBuilder<NotificationResult>(
      stream: repo.observeAllNotifications(),
      builder: (context, snapshot) {
        final count = snapshot.data?.unSeenCount ?? 0;
        final showBadge = count > 0;
        return IconButton(
          onPressed: () => context.pushNamed(AppRoutes.notification.name),
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(
                Icons.notifications_none_rounded,
                color: context.colors.onSurfaceVariant,
              ),
              if (showBadge)
                PositionedDirectional(
                  top: -2,
                  end: -2,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: context.colors.error,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
