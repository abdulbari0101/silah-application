import 'package:flutter/cupertino.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';

import '../widgets/body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScreenWrapper(body: const Body(), androidResizeToAvoidBottomInset: false);
  }
}
