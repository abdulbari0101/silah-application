import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';

import '../../../state_magment/cubits/form_cubit.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isDisabled;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final double? fontSize;

  final double backgroundRadius;
  final Color? backgroundColor;
  final Color? borderColor;

  final double? width;
  final double? height;

  const SecondaryButton({
    super.key,
    required this.text,
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
    final tt = Theme.of(context).textTheme;

    final child = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (prefixWidget != null) ...[prefixWidget!, UIConstants.smallWidth],
        Flexible(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: (fontSize != null)
                ? tt.labelLarge?.copyWith(fontSize: fontSize)
                : null,
          ),
        ),
        if (suffixWidget != null) ...[UIConstants.smallWidth, suffixWidget!],
      ],
    );

    final bool hasLocalOverrides =
        backgroundColor != null ||
        borderColor != null ||
        backgroundRadius != 16;

    final ButtonStyle? localStyle = hasLocalOverrides
        ? OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(backgroundRadius),
            ),
            backgroundColor: backgroundColor,
            side: borderColor != null
                ? BorderSide(color: borderColor!, width: 1.5)
                : null,
          )
        : null;

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? UIConstants.buttonHeight,
      child: OutlinedButton(
        onPressed: isDisabled ? null : onTap,
        style: localStyle,
        child: child,
      ),
    );
  }
}

class SecondaryButtonWithFormCubit extends StatelessWidget {
  final String text;
  final VoidCallback onValidSubmit;
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
  const SecondaryButtonWithFormCubit({
    super.key,
    required this.text,
    required this.onValidSubmit,
    this.isLoading = false,
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
    return BlocBuilder<FormCubit, FormCubitState>(
      builder: (context, state) {
        final isFormValid = state.isValid;
        return Stack(
          alignment: Alignment.center,
          children: [
            SecondaryButton(
              height: height,
              width: width,
              text: text,
              onTap: isFormValid && !isLoading
                  ? () {
                      onValidSubmit.call();
                      FocusScope.of(context).unfocus();
                    }
                  : null,
              isDisabled: isDisabled || !isFormValid || isLoading,
              prefixWidget: prefixWidget,
              suffixWidget: suffixWidget,
              fontSize: fontSize,
              backgroundRadius: backgroundRadius,
              backgroundColor: backgroundColor,
              borderColor: borderColor,
            ),
            if (isLoading)
              const Positioned.fill(
                child: Center(
                  child: SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
