import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key, required this.innerWidget});

  final Widget innerWidget;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: UIConstants.defaultPadding12),
      child: Card(
        margin: EdgeInsets.all(0.0),
        elevation: 0,

        shape: context.shapes.roundedMd,

        child: Padding(
          padding: const EdgeInsets.all(UIConstants.mediumPadding),
          child: widget.innerWidget,
        ),
      ),
    );
  }
}
