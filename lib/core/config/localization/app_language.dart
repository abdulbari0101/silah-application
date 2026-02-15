import 'dart:ui';

import 'package:equatable/equatable.dart';

class AppLanguage extends Equatable {
  final String code; // e.g. "en", "ar", "tr"
  final String name; // Human-readable label
  final int number; // Server / DB id
  final bool isRTL;

  const AppLanguage({
    required this.code,
    required this.name,
    required this.number,
    this.isRTL = false,
  });

  static const _arabicNumber = 1, _englishNumber = 2;
  static const _arabicCode = 'ar', _englishCode = 'en';

  static const arabic = AppLanguage(
    name: 'عربي',
    code: _arabicCode,
    number: _arabicNumber,
    isRTL: true,
  );
  static const english = AppLanguage(
    name: 'English',
    code: _englishCode,
    number: _englishNumber,
    isRTL: false,
  );

  static const AppLanguage fallbackLanguage = arabic;
  static const int fallbackLanguageNumber = _arabicNumber;
  static const String fallbackLanguageCode = _arabicCode;

  static List<AppLanguage> get supportedLanguages => [arabic, english];

  // Helper
  static final _byCode = {for (var l in supportedLanguages) l.code: l};
  static final _byNumber = {for (var l in supportedLanguages) l.number: l};

  static AppLanguage fromCode(String code) => _byCode[code] ?? fallbackLanguage;
  static AppLanguage fromNumber(int? number) => _byNumber[number] ?? fallbackLanguage;
  Locale toLocale() => Locale(code);

  // ────────────────── misc ──────────────────
  static List<Locale> get supportedLocales => supportedLanguages.map((l) => l.toLocale()).toList();
  static Locale get fallbackLocale => fallbackLanguage.toLocale();
  static String get translationAssetsPath => 'assets/translations';

  Map<String, dynamic> toJson() => {'code': code, 'name': name, 'number': number, 'isRTL': isRTL};

  factory AppLanguage.fromJson(Map<String, dynamic> json) =>
      fromCode(json['code'] as String? ?? _arabicCode);

  @override
  List<Object?> get props => [code, number, isRTL, name];

  @override
  String toString() => 'AppLanguage(code: $code , number:$number)';
}
