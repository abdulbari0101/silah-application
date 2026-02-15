import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/features/settings/presentation/views/settings/widget/app_settings/theme_menu.dart';

import 'app_settings/language_menu.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      surfaceTintColor: Colors.white,

      shape: context.shapes.roundedLg,
      child: Column(children: [LanguageMenu(), ThemeMenu()]),
    );
  }
}
