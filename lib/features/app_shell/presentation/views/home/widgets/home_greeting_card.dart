import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/text_styling_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';

class HomeGreetingCard extends StatelessWidget {
  const HomeGreetingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final customer = context.select<AppStateBloc, String?>(
      (bloc) => bloc.state.data.customer?.fullName?.trim(),
    );
    final email = context.select<AppStateBloc, String?>(
      (bloc) => bloc.state.data.customer?.email?.trim(),
    );

    final displayName = (customer != null && customer.isNotEmpty)
        ? customer
        : (email != null && email.isNotEmpty)
            ? email
            : Strings.user.tr();

    final showEmail = email != null && email.isNotEmpty && email != displayName;

    return Card(
      elevation: 0,
      color: context.colors.surface,
      shape: context.shapes.roundedLg,
      child: Padding(
        padding: const EdgeInsets.all(UIConstants.bigPadding),
        child: Column(
          children: [
            CircleAvatar(
              radius: 34,
              backgroundColor: context.colors.primaryContainer,
              child: Icon(
                Icons.person_outline_rounded,
                color: context.colors.primary,
                size: 36,
              ),
            ),
            UIConstants.mediumHeight,
            Text(
              Strings.welcome_back.tr(),
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium?.primary(context),
            ),
            UIConstants.smallHeight,
            Text(
              displayName,
              textAlign: TextAlign.center,
              style: context.textTheme.titleSmall?.onSurface(context),
            ),
            if (showEmail) ...[
              UIConstants.xsmallHeight,
              Text(
                email,
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall?.onSurfaceVariant(context),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
