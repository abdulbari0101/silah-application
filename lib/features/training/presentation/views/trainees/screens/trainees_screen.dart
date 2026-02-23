import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';

class TraineesScreen extends StatelessWidget {
  const TraineesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScreenWrapper(title: Strings.trainees.tr(), body: Container());
  }
}
