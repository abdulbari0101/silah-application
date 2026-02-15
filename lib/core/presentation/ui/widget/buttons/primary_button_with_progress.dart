import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';

import 'primary_button.dart';
import 'progress_button.dart';

class PrimaryButtonWithProgress extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isLoading;
  final bool isDisabled;
  final FintureButtonStyle style;
  final LinearGradient? gradient;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final double? fontSize;
  final Color? color;

  const PrimaryButtonWithProgress({
    super.key,
    required this.text,
    required this.isLoading,
    this.onTap,
    this.isDisabled = false,
    this.style = FintureButtonStyle.primary,
    this.gradient,
    this.prefixWidget,
    this.suffixWidget,
    this.fontSize,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIConstants.buttonHeight,
      child: isLoading
          ? Center(child: ProgressButton(size: UIConstants.buttonHeight * 1.2))
          : PrimaryButton(
              text: text,
              onTap: onTap,
              isDisabled: isDisabled,
              isLoading: isLoading,
              style: style,
              prefixWidget: prefixWidget,
              suffixWidget: suffixWidget,
              fontSize: fontSize,
            ),
    );
  }
}
