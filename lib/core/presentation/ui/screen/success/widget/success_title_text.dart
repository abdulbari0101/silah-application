import 'package:flutter/cupertino.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class SuccessTitleText extends StatelessWidget {
  final String title;

  const SuccessTitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: context.textTheme.titleLarge!
          .copyWith(fontWeight: FontWeight.w700)
          .copyWith(color: context.colors.primary.darker(30), fontSize: 24, height: 1.2),
    );
  }
}
