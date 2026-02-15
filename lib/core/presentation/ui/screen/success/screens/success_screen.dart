import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/screen/success/widget/body.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = context.colors.surface;
    return PlatformScreenWrapper(
      iosBackgroundColor: backgroundColor,
      androidBackgroundColor: backgroundColor,
      body: const Body(),
    );
  }
}
