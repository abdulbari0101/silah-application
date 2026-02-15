import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/theme/extentions/text_styling_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/gen/assets.gen.dart';

import '../widgets/account_type_card.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScreenWrapper(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: UIConstants.screenHorizantalPadding,
            vertical: UIConstants.bigPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: Assets.images.silahLogo1.image(width: 140, fit: BoxFit.contain)),
              UIConstants.bigHeight,
              Text(
                Strings.choose_account_type.tr(),
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge?.primary(context),
              ),
              UIConstants.mediumHeight,
              Text(
                Strings.choose_account_info.tr(),
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall?.onSurfaceVariant(context),
              ),
              UIConstants.xbigHeight,
              AccountTypeCard(
                title: Strings.individuals_law_graduates.tr(),
                subtitle: Strings.request_consultations_contact_lawyers_apply_training.tr(),
                icon: Icons.person_outline,
                onTap: () => context.pushNamed(AppRoutes.userSignUp.name),
              ),
              UIConstants.bigHeight,
              AccountTypeCard(
                title: Strings.licensed_lawyer.tr(),
                subtitle: Strings.provide_legal_services_and_training.tr(),
                icon: Icons.balance_outlined,
                onTap: () => context.pushNamed(AppRoutes.lawyerSignUp.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
