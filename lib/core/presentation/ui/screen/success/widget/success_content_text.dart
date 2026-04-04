import 'package:flutter/cupertino.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class SuccessContentText extends StatelessWidget {
  final String title;
  final String subtitle;

  const SuccessContentText({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.textTheme.titleMedium!
              .copyWith(fontWeight: FontWeight.w700)
              .copyWith(
                color: context.colors.primary,
                fontSize: 24,
                height: 1.2,
              ),
        ),
        UIConstants.bigHeight,
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: context.textTheme.bodySmall!.copyWith(
            color: context.colors.primary,
          ),
        ),
      ],
    );
  }
}
