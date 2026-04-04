import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class AndroidProgress extends StatelessWidget {
  const AndroidProgress({super.key, this.color, this.strokeWidth});

  final Color? color;
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 4,
        color:
            color ??
            (context.themeValue(
              light: context.colors.primary,
              dark: Colors.white,
            )),
      ),
    );
  }
}
