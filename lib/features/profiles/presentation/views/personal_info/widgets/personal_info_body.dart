import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/account_type_localizer.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/cards/custom_card.dart';
import 'package:silah_app/core/presentation/ui/widget/text/labeled_value_row.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/features/profiles/domain/entities/profile_entity.dart';
import 'package:silah_app/features/profiles/presentation/cubits/profile/profile_cubit.dart';

class PersonalInfoBody extends StatelessWidget {
  const PersonalInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: ProgressStateWidget()),
          loading: () => const Center(child: ProgressStateWidget()),
          error: (message, profile) {
            if (profile == null) {
              return Center(
                child: CustomeErrorWidget(
                  message: message,
                  onRetry: () => context.read<ProfileCubit>().load(),
                ),
              );
            }
            return _buildContent(context, profile, errorMessage: message);
          },
          loaded: (profile, _) => _buildContent(context, profile),
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    ProfileEntity profile, {
    String? errorMessage,
  }) {
    final name = profile.name?.trim();
    final email = profile.email?.trim();
    final phone = profile.phone?.trim();
    final city = profile.city?.trim();
    final accountType = AccountTypeLocalizer.label(
      context,
      profile.accountType,
    );

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: UIConstants.screenHorizantalPadding,
          vertical: UIConstants.bigPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCard(
              innerWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabeledValueRow(
                    label: Strings.label_name.tr(),
                    value: name ?? Strings.not_available.tr(),
                    padding: const EdgeInsets.only(bottom: 12),
                    labelFlex: 2,
                    valueFlex: 3,
                  ),
                  LabeledValueRow(
                    label: Strings.email_address.tr(),
                    value: email ?? Strings.not_available.tr(),
                    padding: const EdgeInsets.only(bottom: 12),
                    labelFlex: 2,
                    valueFlex: 3,
                  ),
                  LabeledValueRow(
                    label: Strings.phone.tr(),
                    value: phone ?? Strings.not_available.tr(),
                    padding: const EdgeInsets.only(bottom: 12),
                    labelFlex: 2,
                    valueFlex: 3,
                  ),
                  LabeledValueRow(
                    label: Strings.label_city.tr(),
                    value: city ?? Strings.not_available.tr(),
                    padding: const EdgeInsets.only(bottom: 12),
                    labelFlex: 2,
                    valueFlex: 3,
                  ),
                  LabeledValueRow(
                    label: Strings.account_type.tr(),
                    value: accountType ?? Strings.not_available.tr(),
                    padding: const EdgeInsets.only(bottom: 12),
                    labelFlex: 2,
                    valueFlex: 3,
                  ),
                ],
              ),
            ),
            if (errorMessage != null) ...[
              UIConstants.mediumHeight,
              Text(
                errorMessage,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colors.error,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
