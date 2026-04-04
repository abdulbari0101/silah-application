import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/text_styling_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class TitleSubtitleHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleSubtitleHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: UIConstants.xSmallPadding,
        bottom: UIConstants.smallPadding,
        left: UIConstants.smallPadding,
        right: UIConstants.smallPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  textAlign: TextAlign.start,
                  title,
                  style: context.textTheme.headlineMedium?.primaryDark(context),
                ),
              ),
            ],
          ),
          UIConstants.smallHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Expanded(
                child: Text(
                  subtitle,
                  style: context.textTheme.bodyMedium,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
