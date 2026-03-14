import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/cubits/form_cubit.dart';

import 'primary_button.dart';
import 'primary_button_with_progress.dart';

class PrimaryButtonWithFormCubit extends StatelessWidget {
  final String text;
  final VoidCallback onValidSubmit;
  final bool isLoading;
  final bool isDisabled;
  final FintureButtonStyle style;
  final LinearGradient? gradient;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final double? fontSize;
  final Color? color;
  final bool extraBool;

  const PrimaryButtonWithFormCubit({
    super.key,
    required this.text,
    required this.onValidSubmit,
    required this.isLoading,
    this.isDisabled = false,
    this.extraBool = false,

    this.style = FintureButtonStyle.primary,
    this.gradient,
    this.prefixWidget,
    this.suffixWidget,
    this.fontSize,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormCubit, FormCubitState>(
      builder: (context, state) {
        final isFormValid = state.isValid;
        return PrimaryButtonWithProgress(
          text: text,
          onTap: !isDisabled || isFormValid && extraBool
              ? () {
                  onValidSubmit.call();
                  FocusScope.of(context).unfocus();
                }
              : null,

          isDisabled: isDisabled || !isFormValid && !extraBool,
          isLoading: isLoading,
          style: style,
          gradient: gradient,
          prefixWidget: prefixWidget,
          suffixWidget: suffixWidget,
          fontSize: fontSize,
          color: color,
        );
      },
    );
  }
}
