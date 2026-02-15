import 'package:flutter/material.dart';

extension OTPControllerListExtensions on List<TextEditingController?> {
  /// Combines the text from each controller into a single OTP string.
  String extractOTPText() {
    return where((c) => c != null).map((c) => c!.text).join();
  }

  /// Validates that all OTP fields are filled.
  bool validateOTP() {
    return every((c) => c != null && c.text.isNotEmpty);
  }
}

extension StringNormExt on String {
  String normalized() => trim().toUpperCase();
}
