import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/text_styling_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class MainHeadLine extends StatelessWidget {
  final String title;

  const MainHeadLine({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: UIConstants.defaultPadding,
      ),
      child: Text(
        title,
        style: context.textTheme.headlineMedium!.onPrimaryContainer(context),
      ),
    );
  }
}
