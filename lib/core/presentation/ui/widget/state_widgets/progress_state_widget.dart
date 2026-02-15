import 'package:flutter/material.dart';
import 'package:silah_app/core/infrastructure/platform/app_platform.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/android_progress.dart';

import 'ios_progress.dart';

class ProgressStateWidget extends StatelessWidget {
  const ProgressStateWidget({super.key, this.size = 20, this.color});

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppPlatform(
      android: AndroidProgress(color: color),
      ios: IOSProgress(size: size, color: color),
    );
  }
}
