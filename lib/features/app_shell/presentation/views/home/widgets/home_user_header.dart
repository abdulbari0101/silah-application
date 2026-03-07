import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/foundation/parsing/profile_field_reader.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/ui/widget/image/app_remote_avatar.dart';
import 'package:silah_app/features/app_shell/presentation/views/main/widget/navigation/nav_items_builder.dart';
import 'package:silah_app/features/notifications/domain/repositories/notification_repository.dart';

class HomeUserHeader extends StatefulWidget {
  const HomeUserHeader({super.key});

  @override
  State<HomeUserHeader> createState() => _HomeUserHeaderState();
}

class _HomeUserHeaderState extends State<HomeUserHeader> {
  late final NotificationsRepository _notificationsRepo;
  late Future<int> _unseenCountFuture;

  @override
  void initState() {
    super.initState();
    _notificationsRepo = locator<NotificationsRepository>();
    _unseenCountFuture = _fetchUnseenCount();
  }

  @override
  Widget build(BuildContext context) {
    final name = context.select<AppStateBloc, String?>(
      (bloc) => bloc.state.data.customer?.fullName?.trim(),
    );
    final email = context.select<AppStateBloc, String?>(
      (bloc) => bloc.state.data.customer?.email?.trim(),
    );
    final displayName =
        ProfileFieldReader.firstNonEmpty([name, email]) ?? Strings.user.tr();
    final avatarUrl = context.select<AppStateBloc, String?>(
      (bloc) =>
          ProfileFieldReader.readAvatarUrl(bloc.state.data.customer?.profile),
    );

    final greeting = Strings.home_greeting.tr(namedArgs: {'name': displayName});
    final role = context.select<AppStateBloc, AppUserRole>(
      (bloc) => resolveAppUserRole(bloc.state.data.customer),
    );
    final isVerifiedLawyer = context.select<AppStateBloc, bool>(
      (bloc) =>
          (bloc.state.data.customer?.profile?['verified'] as bool?) ?? false,
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
              _buildSubtitle(context, role, isVerifiedLawyer: isVerifiedLawyer),
            ],
          ),
        ),
        UIConstants.smallWidth,
        DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: context.colors.primary.withAlphaOpacity(0.25),
              width: 1,
            ),
          ),
          child: AppRemoteAvatar(
            radius: 20,
            imageUrl: avatarUrl,
            label: displayName,
            backgroundColor: context.colors.primaryContainer,
            foregroundColor: context.colors.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildSubtitle(
    BuildContext context,
    AppUserRole role, {
    required bool isVerifiedLawyer,
  }) {
    if (role == AppUserRole.lawyer) {
      return Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: isVerifiedLawyer
                  ? context.colors.primary
                  : context.colors.outline,
              shape: BoxShape.circle,
            ),
          ),
          UIConstants.xsmallWidth,
          Text(
            isVerifiedLawyer
                ? Strings.valid_license.tr()
                : Strings.verification_unverified.tr(),
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
    return FutureBuilder<int>(
      future: _unseenCountFuture,
      builder: (context, snapshot) {
        final count = snapshot.data ?? 0;
        final showBadge = count > 0;
        return IconButton(
          onPressed: () => _openNotifications(context),
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

  Future<void> _openNotifications(BuildContext context) async {
    await context.pushNamed(AppRoutes.notification.name);
    if (!mounted) return;
    setState(() {
      _unseenCountFuture = _fetchUnseenCount();
    });
  }

  Future<int> _fetchUnseenCount() async {
    final result = await _notificationsRepo.fetchNotifications();
    return result.fold((_) => 0, (value) => value.unSeenCount);
  }
}
