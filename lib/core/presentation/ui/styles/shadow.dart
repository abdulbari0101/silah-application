import 'package:flutter/material.dart';

/// Theme-controlled shadow tokens.
@immutable
class AppShadows extends ThemeExtension<AppShadows> {
  final List<BoxShadow> soft;
  final List<BoxShadow> medium;
  final List<BoxShadow> hard;

  const AppShadows({required this.soft, required this.medium, required this.hard});

  @override
  AppShadows copyWith({List<BoxShadow>? soft, List<BoxShadow>? medium, List<BoxShadow>? hard}) =>
      AppShadows(soft: soft ?? this.soft, medium: medium ?? this.medium, hard: hard ?? this.hard);

  @override
  AppShadows lerp(ThemeExtension<AppShadows>? other, double t) {
    if (other is! AppShadows) return this;
    List<BoxShadow> _lerpList(List<BoxShadow> a, List<BoxShadow> b) {
      final len = (a.length > b.length) ? a.length : b.length;
      return List.generate(len, (i) {
        final ai = i < a.length ? a[i] : const BoxShadow();
        final bi = i < b.length ? b[i] : const BoxShadow();
        return BoxShadow.lerp(ai, bi, t)!;
      });
    }

    return AppShadows(
      soft: _lerpList(soft, other.soft),
      medium: _lerpList(medium, other.medium),
      hard: _lerpList(hard, other.hard),
    );
  }

  // Light defaults
  static AppShadows light = AppShadows(
    soft: [
      const BoxShadow(
        color: Color(0x1A000000), // 10% black
        blurRadius: 6,
        offset: Offset(0, 2),
      ),
    ],
    medium: [
      const BoxShadow(
        color: Color(0x26000000), // 15%
        blurRadius: 12,
        spreadRadius: 0.5,
        offset: Offset(0, 6),
      ),
    ],
    hard: [
      const BoxShadow(
        color: Color(0x33000000), // 20%
        blurRadius: 18,
        spreadRadius: 1,
        offset: Offset(0, 10),
      ),
    ],
  );

  // Dark defaults — softer/lower alpha to avoid heavy glows.
  static AppShadows dark = AppShadows(
    soft: [const BoxShadow(color: Color(0x14000000), blurRadius: 4, offset: Offset(0, 2))],
    medium: [const BoxShadow(color: Color(0x1F000000), blurRadius: 10, offset: Offset(0, 6))],
    hard: [const BoxShadow(color: Color(0x26000000), blurRadius: 14, offset: Offset(0, 10))],
  );
}
