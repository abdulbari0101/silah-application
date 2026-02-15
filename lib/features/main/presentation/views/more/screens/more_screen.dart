import 'package:flutter/material.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';

import '../widgets/more_body.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScreenWrapper(body: MoreBody());
  }
}
