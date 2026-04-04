import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/presentation/ui/widget/text/section_title.dart';

/// A reusable card widget used for sections on the Home screen.
/// It displays a title, an optional "more" action, and a content widget.
class HomeCard extends StatelessWidget {
  final String? title;
  final Widget child;
  final String? moreText;
  final GestureTapCallback? moreTap;
  final double? height;

  const HomeCard({
    super.key,
    required this.child,
    this.title,
    this.moreText,
    this.moreTap,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SectionTitle(
                title: title!,
                moreText: moreText,
                moreTap: moreTap,
              ),
            ),
          if (title != null) UIConstants.bigHeight,
          SizedBox(width: double.infinity, height: height, child: child),
        ],
      ),
    );
  }
}
