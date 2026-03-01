import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/cards/custom_card.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/features/profiles/domain/entities/profile_entity.dart';
import 'package:silah_app/features/profiles/presentation/cubits/profile/profile_cubit.dart';

class MyAccountSection extends StatelessWidget {
  const MyAccountSection({super.key});

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
            return _buildProfileCard(
              context,
              profile,
              isSaving: false,
              errorMessage: message,
            );
          },
          loaded: (profile, isSaving) =>
              _buildProfileCard(context, profile, isSaving: isSaving ?? false),
        );
      },
    );
  }

  Widget _buildProfileCard(
    BuildContext context,
    ProfileEntity profile, {
    required bool isSaving,
    String? errorMessage,
  }) {
    final name = profile.name?.trim().isNotEmpty == true
        ? profile.name!.trim()
        : Strings.user.tr();
    final email = profile.email?.trim();
    final phone = profile.phone?.trim();
    final accountTypeLabel = _accountTypeLabel(context, profile.accountType);

    return CustomCard(
      innerWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: context.colors.primaryContainer,
                child: Icon(
                  Icons.person_outline,
                  color: context.colors.primary,
                  size: 22,
                ),
              ),
              UIConstants.mediumWidth,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: context.textTheme.titleSmall),
                    if (email != null && email.isNotEmpty)
                      Text(
                        email,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colors.onSurfaceVariant,
                        ),
                      ),
                    if ((phone ?? '').isNotEmpty)
                      Text(
                        phone!,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colors.onSurfaceVariant,
                        ),
                      ),
                    if (accountTypeLabel != null)
                      Text(
                        '${Strings.account_type.tr()}: $accountTypeLabel',
                        style: context.textTheme.labelSmall?.copyWith(
                          color: context.colors.onSurfaceVariant,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          UIConstants.mediumHeight,
          const Divider(height: 1),
          UIConstants.smallHeight,
          SwitchListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            title: Text(Strings.trainee_toggle_title.tr()),
            subtitle: Text(Strings.trainee_toggle_subtitle.tr()),
            value: profile.isTrainee,
            onChanged: isSaving
                ? null
                : (value) =>
                      context.read<ProfileCubit>().updateIsTrainee(value),
          ),
          if (isSaving)
            Padding(
              padding: const EdgeInsets.only(top: 4),
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
        ],
      ),
    );
  }

  String? _accountTypeLabel(BuildContext context, String? accountType) {
    switch (accountType?.toLowerCase()) {
      case 'admin':
        return Strings.account_type_admin.tr();
      case 'lawyer':
        return Strings.account_type_lawyer.tr();
      case 'user':
        return Strings.account_type_user.tr();
      default:
        return null;
    }
  }
}
