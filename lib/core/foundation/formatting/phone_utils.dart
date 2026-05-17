import 'package:phone_numbers_parser/phone_numbers_parser.dart';

extension StringPhoneUtils on String {
  String normalizePhone() {
    final western = replaceArabicDigits();
    final trimmed = western.trim();
    return trimmed.startsWith('0') ? trimmed.substring(1) : trimmed;
  }

  /// Replaces Arabic-Indic digits (٠١٢٣٤٥٦٧٨٩) with Western digits (0-9).
  String replaceArabicDigits() =>
      _arabicToWestern[this] ?? _replaceArabic(this);

  String toPrettyPhone({IsoCode? country, bool intl = true}) =>
      formatPhoneNumber(this, country: country, international: intl);
}

final Map<String, String> _arabicToWestern = {
  '٠': '0',
  '١': '1',
  '٢': '2',
  '٣': '3',
  '٤': '4',
  '٥': '5',
  '٦': '6',
  '٧': '7',
  '٨': '8',
  '٩': '9',
};

String _replaceArabic(String input) => input
    .replaceAll('٠', '0')
    .replaceAll('١', '1')
    .replaceAll('٢', '2')
    .replaceAll('٣', '3')
    .replaceAll('٤', '4')
    .replaceAll('٥', '5')
    .replaceAll('٦', '6')
    .replaceAll('٧', '7')
    .replaceAll('٨', '8')
    .replaceAll('٩', '9');

class PhoneUtils {
  static final List<String> _turkeyPrefixes = ['5 , 05']; // +90
  static final List<String> _yemenPrefixes = [
    '77',
    '78',
    '71',
    '73',
    '70',
  ]; // +967
  static final List<String> _saudiPrefixes = ['5', '05']; // +966

  static final RegExp _turkeyRegExp = RegExp(r'^0?5'); // 5… or 05…
  static final RegExp _yemenRegExp = RegExp(r'^0?(77|78|71|73|70)');
  static final RegExp _saudiRegExp = RegExp(r'^0?5'); // 5… or 05…

  /// Combined regex: matches Yemen OR Saudi prefixes.
  static final RegExp _combinedRegExp = RegExp(r'^0?(77|78|71|73|70|5)');

  /// Returns the correct RegExp based on the active server.
  static RegExp get localPrefixRegExp => _combinedRegExp;

  /// List of valid prefixes for the active server.
  static List<String> get localPrefixes => [
    ..._yemenPrefixes,
    ..._saudiPrefixes,
  ];

  /// Comma separated prefixes for error messages.
  static String get localPrefixesString => localPrefixes.join(', ');

  static bool hasValidPrefix(String phone) =>
      localPrefixRegExp.hasMatch(phone.normalizePhone());
}

String formatPhoneNumber(
  String raw, {
  IsoCode? country,
  bool international = true,
  String fallbackSep = ' ',
}) {
  if (raw.trim().isEmpty) return raw;

  try {
    final phone = PhoneNumber.parse(
      raw,
      callerCountry: country, // help resolve local prefixes
      destinationCountry: country,
    );

    return international
        ? phone
              .international // “+90 123 …”
        : phone.formatNsn(format: NsnFormat.national); // “0 123 …”
  } catch (_) {
    // ── naive grouping fallback ─────────────────────────────
    final hasPlus = raw.startsWith('+');
    final digits = raw.replaceAll(RegExp(r'\\D'), '');
    final buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      if (i != 0 && i % 3 == 0) buffer.write(fallbackSep);
      buffer.write(digits[digits.length - 1 - i]);
    }
    return (hasPlus ? '+' : '') + buffer.toString().split('').reversed.join();
  }
}
