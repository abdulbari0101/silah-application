import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:silah_app/core/config/theme/extentions/color_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class ProgressButton extends StatelessWidget {
  final double size;
  final Color? primaryColor;
  final Color? waveColor;

  const ProgressButton({super.key, this.size = 30.0, this.primaryColor, this.waveColor});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Center(
      child: SpinKitWaveSpinner(
        color: primaryColor ?? cs.primary.withAlphaOpacity(0.7),
        waveColor: waveColor ?? cs.primary.withAlphaOpacity(0.7),
        size: size,
      ),
    );
  }
}
