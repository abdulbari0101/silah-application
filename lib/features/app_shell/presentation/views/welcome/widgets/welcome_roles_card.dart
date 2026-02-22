import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

import 'welcome_role_tile.dart';

class WelcomeRolesCard extends StatelessWidget {
  const WelcomeRolesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: UIConstants.mediumPadding,
        vertical: UIConstants.bigPadding,
      ),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        borderRadius: context.shapes.brLg,
      ),
      child: Column(
        children: [
          WelcomeRoleTile(
            title: Strings.individuals_law_graduates.tr(),
            subtitle: Strings.user_role_info.tr(),
            icon: Icons.person_outline_rounded,
          ),
          UIConstants.bigHeight,
          WelcomeRoleTile(
            title: Strings.licensed_lawyer.tr(),
            subtitle: Strings.manage_consultations_clients_and_training.tr(),
            icon: Icons.balance_outlined,
          ),
        ],
      ),
    );
  }
}
