import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/app_language.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/router/route_extensions.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/extensions/app_setting_context_extension.dart';
import 'package:silah_app/core/presentation/ui/responsive/dimensions.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/arrow_next_icon.dart';

class LanguageMenu extends StatefulWidget {
  const LanguageMenu({super.key});

  @override
  State<LanguageMenu> createState() => _LanguageMenuState();
}

class _LanguageMenuState extends State<LanguageMenu> {
  bool isLanguageArabic = true;

  @override
  void initState() {
    super.initState();
  }

  // refreshHomeScreenDataAccordingToNewLanguage(String language) {
  //   //    context.read<HomeBloc>().add(RefreshHomeEvent(language: language));
  // }

  @override
  Widget build(BuildContext context) {
    AppLanguage languge = context.appLnaguage;

    double iconSize = 22;
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: context.colors.primary,
        padding: EdgeInsets.symmetric(horizontal: UIConstants.mediumPadding).copyWith(top: 16),
      ),
      onPressed: () {
        context.pushTo(AppRoutes.language);
        // AdaptiveBottomSheet.show(context: context, builder: (context) => LanguageSheet(),)
      },
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.language,
                size: iconSize,
                color: context.themeValue(light: context.colors.primary, dark: Colors.white),
              ),
              // AppSvgIcon(
              //   assetName: Assets.icons.icLanguage,
              //   height: iconSize,
              //   width: iconSize,
              // ),
              SizedBox(width: AppDimension(context).width * 0.06),
              Expanded(
                child: Text(Strings.et_change_lang.tr(), style: context.textTheme.labelLarge),
              ),
              Text(languge.name, style: context.textTheme.bodyMedium),
              ArrowNextIcon(size: SizeIcon.SIZE_18),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            width: double.infinity,
            height: 0.1,
            color: context.colors.blackOrWhite.withAlphaOpacity(0.7),
          ),
        ],
      ),
    );
  }
}
