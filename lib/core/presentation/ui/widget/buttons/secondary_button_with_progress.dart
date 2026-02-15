import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';

import 'progress_button.dart';
import 'secondary_button.dart';

class SecondaryButtonWithProgress extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isLoading;
  final bool isDisabled;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final double? fontSize;
  final double backgroundRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? width;
  final double? height;

  const SecondaryButtonWithProgress({
    super.key,
    required this.text,
    required this.isLoading,
    this.onTap,
    this.isDisabled = false,
    this.prefixWidget,
    this.suffixWidget,
    this.fontSize,
    this.backgroundRadius = 16,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final buttonHeight = height ?? UIConstants.buttonHeight;
    return SizedBox(
      width: width ?? double.infinity,
      height: buttonHeight,
      child: isLoading
          ? Center(child: ProgressButton(size: buttonHeight))
          : SecondaryButton(
              text: text,
              onTap: isDisabled ? null : onTap,
              isDisabled: isDisabled,
              prefixWidget: prefixWidget,
              suffixWidget: suffixWidget,
              fontSize: fontSize,
              backgroundRadius: backgroundRadius,
              backgroundColor: backgroundColor,
              borderColor: borderColor,
              width: width,
              height: buttonHeight,
            ),
    );
  }
}
