import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

extension FText on TextStyle {
  // Weights
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  // Colors
  TextStyle colorOf(Color c) => copyWith(color: c);
  TextStyle onSurface(BuildContext c) => copyWith(color: c.colors.onSurface);
  TextStyle onSurfaceVariant(BuildContext c) => copyWith(color: c.colors.onSurfaceVariant);
  TextStyle primary(BuildContext c) => copyWith(color: c.colors.primary);
  TextStyle onPrimary(BuildContext c) => copyWith(color: c.colors.onPrimary);
  TextStyle onPrimaryContainer(BuildContext c) => copyWith(color: c.colors.onPrimaryContainer);
  TextStyle primaryDark(BuildContext c) => copyWith(color: c.brand.primaryDark);

  // Fine-tuning
  TextStyle size(double v) => copyWith(fontSize: v);
  TextStyle lh(double v) => copyWith(height: v); // line height multiple (e.g., 18/13 = 1.3846)
  TextStyle ls(double v) => copyWith(letterSpacing: v);

  // Spacing preset you had
  TextStyle get cardsLineSpace => copyWith(height: 1.5);
}
