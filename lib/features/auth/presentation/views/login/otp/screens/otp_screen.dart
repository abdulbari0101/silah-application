import 'package:flutter/material.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';

import '../widget/body.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScreenWrapper(body: const LoginOtpBody());
  }
}
