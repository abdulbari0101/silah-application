import 'package:flutter/material.dart';

@immutable
class ShapeTokens {
  final double radiusXs;
  final double radiusSm;

  final double radiusMd;

  final double radiusLg;
  final double radiusXl;
  final double radiusXXl;

  const ShapeTokens({
    this.radiusXs = 8,
    this.radiusSm = 12,
    this.radiusMd = 16,
    this.radiusLg = 20,
    this.radiusXl = 24,
    this.radiusXXl = 28,
  });

  /// BorderRadius helpers (when only a radius is needed).
  BorderRadius get brXs => BorderRadius.circular(radiusXs);
  BorderRadius get brSm => BorderRadius.circular(radiusSm);
  BorderRadius get brMd => BorderRadius.circular(radiusMd);
  BorderRadius get brLg => BorderRadius.circular(radiusLg);
  BorderRadius get brXl => BorderRadius.circular(radiusXl);
  BorderRadius get brXXl => BorderRadius.circular(radiusXXl);

  /// Common RoundedRectangleBorder helpers for ThemeData component shapes.
  RoundedRectangleBorder get roundedXs => RoundedRectangleBorder(borderRadius: brXs);
  RoundedRectangleBorder get roundedSm => RoundedRectangleBorder(borderRadius: brSm);
  RoundedRectangleBorder get roundedMd => RoundedRectangleBorder(borderRadius: brMd);
  RoundedRectangleBorder get roundedLg => RoundedRectangleBorder(borderRadius: brLg);
  RoundedRectangleBorder get roundedXl => RoundedRectangleBorder(borderRadius: brXl);
  RoundedRectangleBorder get roundedXXl => RoundedRectangleBorder(borderRadius: brXXl);

  static const StadiumBorder pill = StadiumBorder();

  ShapeTokens copyWith({
    double? radiusXs,
    double? radiusSm,
    double? radiusMd,
    double? radiusLg,
    double? radiusXl,
    double? radiusXXl,
  }) => ShapeTokens(
    radiusXs: radiusSm ?? this.radiusXs,
    radiusSm: radiusSm ?? this.radiusSm,
    radiusMd: radiusMd ?? this.radiusMd,
    radiusLg: radiusLg ?? this.radiusLg,
    radiusXl: radiusXl ?? this.radiusXl,
    radiusXXl: radiusXXl ?? this.radiusXXl,
  );
}

/// Optional: ThemeExtension variant for runtime/brand overrides.
/// Add to ThemeData.extensions in your theme factory if/when needed:
///
///   extensions: [
///     const ShapeScale(), // default
///   ]
///
/// Then read it in widgets:
///   final shapes = Theme.of(context).extension<ShapeScale>() ?? const ShapeScale();
///   shape: shapes.rMd;
@immutable
class ShapeScale extends ThemeExtension<ShapeScale> {
  final double radiusXs;
  final double radiusSm;

  final double radiusMd;

  final double radiusLg;
  final double radiusXl;
  final double radiusXXl;

  const ShapeScale({
    this.radiusXs = 8,
    this.radiusSm = 12,
    this.radiusMd = 16,
    this.radiusLg = 20,
    this.radiusXl = 24,
    this.radiusXXl = 28,
  });

  BorderRadius get brXs => BorderRadius.circular(radiusXs);
  BorderRadius get brSm => BorderRadius.circular(radiusSm);
  BorderRadius get brMd => BorderRadius.circular(radiusMd);
  BorderRadius get brLg => BorderRadius.circular(radiusLg);
  BorderRadius get brXl => BorderRadius.circular(radiusXl);
  BorderRadius get brXXl => BorderRadius.circular(radiusXXl);

  RoundedRectangleBorder get roundedXs => RoundedRectangleBorder(borderRadius: brXs);
  RoundedRectangleBorder get roundedSm => RoundedRectangleBorder(borderRadius: brSm);
  RoundedRectangleBorder get roundedMd => RoundedRectangleBorder(borderRadius: brMd);
  RoundedRectangleBorder get roundedLg => RoundedRectangleBorder(borderRadius: brLg);
  RoundedRectangleBorder get roundedXl => RoundedRectangleBorder(borderRadius: brXl);
  RoundedRectangleBorder get roundedXXl => RoundedRectangleBorder(borderRadius: brXXl);

  static const StadiumBorder pill = StadiumBorder();

  @override
  ShapeScale copyWith({
    double? radiusXs,
    double? radiusSm,
    double? radiusMd,
    double? radiusLg,
    double? radiusXl,
    double? radiusXXl,
  }) => ShapeScale(
    radiusXs: radiusSm ?? this.radiusXs,
    radiusSm: radiusSm ?? this.radiusSm,
    radiusMd: radiusMd ?? this.radiusMd,
    radiusLg: radiusLg ?? this.radiusLg,
    radiusXl: radiusXl ?? this.radiusXl,
    radiusXXl: radiusXXl ?? this.radiusXXl,
  );

  @override
  ThemeExtension<ShapeScale> lerp(ThemeExtension<ShapeScale>? other, double t) {
    if (other is! ShapeScale) return this;
    return ShapeScale(
      radiusXs: lerpDouble(radiusXs, other.radiusXs, t),
      radiusSm: lerpDouble(radiusSm, other.radiusSm, t),
      radiusMd: lerpDouble(radiusMd, other.radiusMd, t),
      radiusLg: lerpDouble(radiusLg, other.radiusLg, t),
      radiusXl: lerpDouble(radiusXl, other.radiusXl, t),
      radiusXXl: lerpDouble(radiusXXl, other.radiusXXl, t),
    );
  }

  static double lerpDouble(double a, double b, double t) => a + (b - a) * t;
}
