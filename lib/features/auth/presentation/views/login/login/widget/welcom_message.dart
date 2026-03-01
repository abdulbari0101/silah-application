import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/text_styling_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';

import '../../../../../../../gen/assets.gen.dart';

class LoginWelcomText extends StatelessWidget {
  const LoginWelcomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSvgIcon(
          matchTextDirection: false,
          darkDynamicColor: false,
          assetName: Assets.icons.logo.logoSvg,
          height: 80,
          width: 80,
        ),
        UIConstants.mediumHeight,
        Text(
          Strings.welcome_back.tr(),
          style: context.textTheme.titleLarge?.bold.primary(context),
          textAlign: TextAlign.center,
        ),
        UIConstants.xsmallHeight,
        Text(
          Strings.enter_data_to_access_account.tr(),
          style: context.textTheme.bodySmall?.onSurfaceVariant(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
