// brand_tokens.dart
import 'package:flutter/material.dart';


/// Inputs you vary per-client.
/// Keep neutrals explicit so you don't hard-code them later.
class BrandTokens {

  // Brand accent
  final Color seed; // used to derive full M3 scheme

  // Neutrals
  final Color pageBg; // screen & app bar background
  final Color card; // cards/dialogs
  final Color bottomSheetBg; // modal sheets
  final Color bottomNavBg; // nav bar background
  final Color fieldFill; // search / filled fields
  final Color outline; // borders
  final Color onSurface; // main text
  final Color onSurfaceVariant; // secondary text

  const BrandTokens({
    required this.seed,
    required this.pageBg,
    required this.card,
    required this.bottomSheetBg,
    required this.bottomNavBg,
    required this.fieldFill,
    required this.outline,
    required this.onSurface,
    required this.onSurfaceVariant,
  });
}
