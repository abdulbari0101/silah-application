import 'package:flutter/material.dart';

@immutable
class FInputFillColors extends ThemeExtension<FInputFillColors> {
  final Color empty;
  final Color filled;

  const FInputFillColors({required this.empty, required this.filled});

  @override
  FInputFillColors copyWith({Color? empty, Color? filled}) =>
      FInputFillColors(empty: empty ?? this.empty, filled: filled ?? this.filled);

  @override
  FInputFillColors lerp(ThemeExtension<FInputFillColors>? other, double t) {
    if (other is! FInputFillColors) return this;
    return FInputFillColors(
      empty: Color.lerp(empty, other.empty, t)!,
      filled: Color.lerp(filled, other.filled, t)!,
    );
  }
}
