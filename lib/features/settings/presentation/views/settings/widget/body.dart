import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/presentation/ui/widget/text/section_title.dart';
import 'package:silah_app/features/settings/presentation/views/settings/widget/app_settings.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(UIConstants.defaultPadding),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UIConstants.bigHeight,

            SectionTitle(title: Strings.personal_settings.tr()),

            UIConstants.bigHeight,
            //MainHeadLine(title: Strings.settings.tr()),
            SectionTitle(title: Strings.app_settings.tr()),
            UIConstants.bigHeight,
            AppSettings(),

            // ThemeMenu(),
          ],
        ),
      ),
    );
  }
}
