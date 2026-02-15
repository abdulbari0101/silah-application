import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/responsive/dimensions.dart';

class OTPField extends StatelessWidget {
  const OTPField({super.key, required this.onSubmit, this.onChanged});

  final void Function(String) onSubmit;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: OtpTextField(
        numberOfFields: 6,
        borderRadius: context.shapes.brXs,
        borderWidth: 2,
        filled: true,
        fillColor: context.themeValue(light: context.colors.surface, dark: Colors.black),
        keyboardType: TextInputType.number,
        fieldWidth: AppDimension(context).width * 0.125,
        textStyle: context.textTheme.labelLarge!.copyWith(color: context.colors.greyDark()),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        borderColor: context.colors.primary,
        showFieldAsBox: true,
        focusedBorderColor: context.colors.primary,
        cursorColor: context.colors.primary,
        autoFocus: true,
        onCodeChanged: onChanged,
        onSubmit: onSubmit,
      ),
    );
  }
}
