import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/presentation/ui/widget/text_fields/f_area_code_field.dart';
import 'package:silah_app/core/presentation/ui/widget/text_fields/mobile_field.dart';

class PhoneNumberWithCode extends StatelessWidget {
  final TextEditingController mobileNoController;
  final Function(String countryCode)? onCountryCodeChanged;

  final List<String? Function(String?)>? mobilevalidators;
  final String? mobileHintText;
  final Widget? mobilePrefixIcon;
  final bool showMobileLabel;

  const PhoneNumberWithCode({
    super.key,
    required this.mobileNoController,
    this.onCountryCodeChanged,
    this.mobilevalidators,
    this.mobileHintText,
    this.mobilePrefixIcon,
    this.showMobileLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FAreaCodeField(),
        UIConstants.bigWidth,
        Expanded(
          child: FMobileField(
            mobileNoController: mobileNoController,
            validators: mobilevalidators,
            hintText: mobileHintText,
            prefixIcon: mobilePrefixIcon,
            showLabel: showMobileLabel,
          ),
        ),
      ],
    );
  }
}
