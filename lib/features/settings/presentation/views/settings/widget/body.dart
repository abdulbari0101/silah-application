import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/app_setting_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/extensions/app_setting_context_extension.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart';
import 'package:silah_app/core/presentation/ui/overlays/dialogs/dialog_service.dart';
import 'package:silah_app/core/presentation/ui/overlays/sheets/image_picker_sheet.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';
import 'package:silah_app/core/presentation/ui/widget/cards/custom_card.dart';
import 'package:silah_app/core/presentation/ui/widget/headers/curved_header_container.dart';
import 'package:silah_app/core/presentation/ui/widget/image/app_remote_avatar.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:silah_app/core/domain/enums/app_theme_mode.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:silah_app/features/profiles/domain/entities/profile_entity.dart';
import 'package:silah_app/features/profiles/presentation/cubits/profile/profile_cubit.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: ProgressStateWidget()),
          loading: () => const Center(child: ProgressStateWidget()),
          error: (message, profile) {
            if (profile == null) {
              return CustomeErrorWidget(
                message: message,
                onRetry: () => context.read<ProfileCubit>().load(),
              );
            }
            return _buildContent(
              context,
              profile,
              isSaving: false,
              errorMessage: message,
            );
          },
          loaded: (profile, isSaving) =>
              _buildContent(context, profile, isSaving: isSaving ?? false),
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    ProfileEntity profile, {
    required bool isSaving,
    String? errorMessage,
  }) {
    final activeThemeMode = context
        .watch<AppSettingBloc>()
        .state
        .data
        .appAppThemeMode;
    final name = profile.name?.trim().isNotEmpty == true
        ? profile.name!.trim()
        : Strings.user.tr();
    final email = profile.email?.trim();
    final accountType = profile.accountType?.toLowerCase();
    final isAdmin = accountType == 'admin';
    final isLawyer = accountType == 'lawyer';
    final traineeToggleTitle = isLawyer
        ? Strings.training_opportunities.tr()
        : Strings.legal_trainee_profile.tr();

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CurvedHeaderContainer(
              padding: const EdgeInsetsDirectional.fromSTEB(
                UIConstants.screenHorizantalPadding,
                UIConstants.bigPadding,
                UIConstants.screenHorizantalPadding,
                UIConstants.bigPadding,
              ),
              child: _buildHeader(
                context,
                name: name,
                email: email,
                avatarUrl: profile.avatarUrl,
                onAvatarTap: isSaving ? null : () => _showAvatarPicker(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: UIConstants.screenHorizantalPadding,
                vertical: UIConstants.bigPadding,
              ),
              child: Column(
                children: [
                  CustomCard(
                    innerWidget: Column(
                      children: [
                        _buildTile(
                          context,
                          title: Strings.personal_information.tr(),
                          icon: Icons.person_outline,
                          onTap: () =>
                              context.pushNamed(AppRoutes.personalInfo.name),
                        ),
                        if (!isAdmin) ...[
                          _buildDivider(),
                          _buildToggleTile(
                            context,
                            title: traineeToggleTitle,
                            icon: Icons.school_outlined,
                            value: profile.isTrainee,
                            onChanged: isSaving
                                ? null
                                : (value) => context
                                      .read<ProfileCubit>()
                                      .updateIsTrainee(value),
                          ),
                        ],
                        _buildDivider(),
                        if (isLawyer) ...[
                          _buildTile(
                            context,
                            title: Strings.verification_status.tr(),
                            icon: Icons.verified_user_outlined,
                            onTap: () => context.pushNamed(
                              AppRoutes.verificationStatus.name,
                            ),
                          ),
                          _buildDivider(),
                        ],
                        if (!isAdmin) ...[
                          _buildTile(
                            context,
                            title: Strings.rate_us.tr(),
                            icon: Icons.star_outline,
                            onTap: () {},
                          ),
                          _buildDivider(),
                        ],
                        _buildTile(
                          context,
                          title: Strings.privacy_policy.tr(),
                          icon: Icons.shield_outlined,
                          onTap: () =>
                              context.pushNamed(AppRoutes.privacyPolicy.name),
                        ),
                        _buildDivider(),
                        _buildTile(
                          context,
                          title: Strings.contact_us.tr(),
                          icon: Icons.help_outline,
                          onTap: () => isAdmin
                              ? context.pushNamed(AppRoutes.supportTickets.name)
                              : _openReportScreen(context),
                        ),
                        if (isAdmin) ...[
                          _buildDivider(),
                          _buildTile(
                            context,
                            title: Strings.admin_tasks.tr(),
                            icon: Icons.admin_panel_settings_outlined,
                            onTap: () =>
                                context.pushNamed(AppRoutes.adminTasks.name),
                          ),
                        ],
                        _buildDivider(),
                        _ThemeModeTile(currentMode: activeThemeMode),
                        _buildDivider(),
                        _buildTile(
                          context,
                          title: Strings.log_out.tr(),
                          icon: Icons.logout,
                          titleColor: context.colors.error,
                          iconColor: context.colors.error,
                          onTap: () => _handleLogout(context),
                          showChevron: false,
                        ),
                      ],
                    ),
                  ),
                  if (isSaving)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: LinearProgressIndicator(
                        minHeight: 2,
                        color: context.colors.primary,
                        backgroundColor: context.colors.primaryContainer,
                      ),
                    ),
                  if (errorMessage != null) ...[
                    UIConstants.smallHeight,
                    Text(
                      errorMessage,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colors.error,
                      ),
                    ),
                  ],
                  UIConstants.xbigHeight,
                  Center(
                    child: Text(
                      'v${locator<PackageInfo>().version}',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colors.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context, {
    required String name,
    String? email,
    String? avatarUrl,
    VoidCallback? onAvatarTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onAvatarTap,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              AppRemoteAvatar(
                radius: 44,
                imageUrl: avatarUrl,
                label: name,
                backgroundColor: context.colors.primaryContainer,
                foregroundColor: context.colors.primary,
              ),
              PositionedDirectional(
                end: -2,
                bottom: -2,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: context.colors.surface,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: context.colors.primaryContainer,
                      width: 1.5,
                    ),
                  ),
                  child: Icon(
                    Icons.edit_outlined,
                    size: 16,
                    color: context.colors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        UIConstants.smallHeight,
        Text(
          name,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        if (email != null && email.isNotEmpty) ...[
          UIConstants.xsmallHeight,
          Text(
            email,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }

  Future<void> _showAvatarPicker(BuildContext context) async {
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) {
        return ImagePickerBottomSheet(
          onSelect: (source) {
            Navigator.of(sheetContext).pop();
            context.read<ProfileCubit>().pickAndUploadAvatar(source);
          },
        );
      },
    );
  }

  static Widget _buildTile(
    BuildContext context, {
    required String title,
    required IconData icon,
    VoidCallback? onTap,
    Color? titleColor,
    Color? iconColor,
    bool showChevron = true,
    Widget? trailing,
  }) {
    return ListTile(
      onTap: onTap,
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: iconColor ?? context.colors.onSurfaceVariant),
      ),
      title: Text(
        title,
        style: context.textTheme.bodyMedium?.copyWith(
          color: titleColor ?? context.colors.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing:
          trailing ??
          (showChevron
              ? Icon(
                  context.isRTL ? Icons.chevron_left : Icons.chevron_right,
                  color: context.colors.onSurfaceVariant,
                )
              : null),
    );
  }

  Widget _buildToggleTile(
    BuildContext context, {
    required String title,
    required IconData icon,
    required bool value,
    required ValueChanged<bool>? onChanged,
  }) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: context.colors.onSurfaceVariant),
      ),
      title: Text(
        title,
        style: context.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Switch.adaptive(value: value, onChanged: onChanged),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1);
  }

  Future<void> _handleLogout(BuildContext context) async {
    final result = await locator<AuthRepo>().signOut();
    result.fold(
      (failure) => Toasts.error(
        context,
        BlocUtils.mergeCodeWithMessage(
          failure,
          codeToMessageMap,
          includeCodeLine: false,
          fallbackMessage: Strings.unexpected_error,
        ),
      ),
      (_) {
        context.read<AppStateBloc>().add(
          UpdateSession(
            isLoggedIn: false,
            userAuthStatus: UserAuthStatus.loggedOutReturningUser,
          ),
        );
        context.goNamed(AppRoutes.login.name);
      },
    );
  }

  Future<void> _openReportScreen(BuildContext context) async {
    final didSubmitReport =
        await context.pushNamed<bool>(AppRoutes.supportReport.name) ?? false;

    if (!context.mounted || !didSubmitReport) return;

    Toasts.success(context, Strings.sent_successfully.tr());
  }
}

class _ThemeModeTile extends StatelessWidget {
  final AppThemeMode currentMode;

  const _ThemeModeTile({required this.currentMode});

  static const _modes = [
    AppThemeMode.system,
    AppThemeMode.light,
    AppThemeMode.dark,
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    IconData iconFor(AppThemeMode mode) => switch (mode) {
      AppThemeMode.system => Icons.brightness_auto_rounded,
      AppThemeMode.light => Icons.light_mode_rounded,
      AppThemeMode.dark => Icons.dark_mode_rounded,
    };

    String labelFor(AppThemeMode mode) => switch (mode) {
      AppThemeMode.system => Strings.system_mode.tr(),
      AppThemeMode.light => Strings.light_mode.tr(),
      AppThemeMode.dark => Strings.dark_mode.tr(),
    };

    return Body._buildTile(
      context,
      icon: iconFor(currentMode),
      title: Strings.theme.tr(),
      showChevron: false,
      trailing: Container(
        decoration: BoxDecoration(
          color: cs.surfaceContainerHighest.withValues(alpha: 0.72),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.45)),
        ),
        padding: const EdgeInsets.all(3),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: _modes.map((mode) {
            final isSelected = currentMode == mode;
            return Tooltip(
              message: labelFor(mode),
              child: GestureDetector(
                onTap: () {
                  if (!isSelected) {
                    context.read<AppSettingBloc>().add(
                      ChangeThemeEvent(
                        appAppThemeMode: mode,
                        fromWhere: 'AccountSettings',
                      ),
                    );
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? cs.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Icon(
                    iconFor(mode),
                    size: 16,
                    color: isSelected ? cs.onPrimary : cs.onSurfaceVariant,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
