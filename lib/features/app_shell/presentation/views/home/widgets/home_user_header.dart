import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';

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

    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_none_rounded,
            color: context.colors.onSurfaceVariant,
          ),
        ),
        UIConstants.smallWidth,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greeting,
                style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              UIConstants.xsmallHeight,
              Text(
                Strings.home_subtitle_user.tr(),
                style: context.textTheme.bodySmall?.copyWith(color: context.colors.onSurfaceVariant),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        UIConstants.smallWidth,
        CircleAvatar(
          radius: 20,
          backgroundColor: context.colors.primaryContainer,
          child: Icon(
            Icons.person_outline_rounded,
            color: context.colors.primary,
          ),
        ),
      ],
    );
  }
}
