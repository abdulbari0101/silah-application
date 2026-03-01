import 'package:flutter/material.dart';
import 'package:silah_app/core/presentation/ui/widget/text/title_subtitle_header.dart';

class PasswordScreensTextTital extends StatelessWidget {
  final String tital;
  final String subTital;

  const PasswordScreensTextTital({
    super.key,
    required this.tital,
    required this.subTital,
  });

  @override
  Widget build(BuildContext context) {
    return TitleSubtitleHeader(title: tital, subtitle: subTital);
  }
}
