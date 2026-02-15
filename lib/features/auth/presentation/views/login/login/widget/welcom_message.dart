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
          // height: 110,
        ),
        UIConstants.bigHeight,
        Text(Strings.welcome.tr(), style: context.textTheme.titleMedium?.primary(context)),
        UIConstants.xsmallHeight,
        Text(
          Strings.enter_password_to_login.tr(),
          style: context.textTheme.labelSmall?.onSurfaceVariant(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
