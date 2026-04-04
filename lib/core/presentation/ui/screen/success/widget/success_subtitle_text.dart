import 'package:flutter/cupertino.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class SuccessSubtitleText extends StatelessWidget {
  final String subtitle;

  const SuccessSubtitleText({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      textAlign: TextAlign.center,
      style: context.textTheme.bodyMedium!.copyWith(
        color: context.colors.primary.darker(20),
      ),
    );
  }
}
