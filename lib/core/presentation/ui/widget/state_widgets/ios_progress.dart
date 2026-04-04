import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class IOSProgress extends StatelessWidget {
  const IOSProgress({super.key, this.size = 20, this.color});

  final double size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color:
            color ??
            (context.themeValue(
              light: context.colors.primary,
              dark: Colors.white,
            )),
        radius: size,
      ),
    );
  }
}
