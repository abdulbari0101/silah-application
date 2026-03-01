import 'package:phone_numbers_parser/phone_numbers_parser.dart';

extension StringPhoneUtils on String {
  String normalizePhone() => PhoneUtils.normalizeToLocalNsn(this);

  /// Replaces Arabic-Indic digits (٠١٢٣٤٥٦٧٨٩) with Western digits (0-9).
  String replaceArabicDigits() => _arabicToWestern[this] ?? _replaceArabic(this);

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
  static const IsoCode localIso = IsoCode.SA;
  static const String _ksaCountryCode = '966';
  static const int _ksaMobileNsnLength = 9;

  static final List<String> _ksaPrefixes = ['05', '5', '+9665'];
  static final RegExp _ksaMobileRegExp = RegExp(r'^5');

  /// Returns the correct RegExp based on the active server.
  static RegExp get localPrefixRegExp => _ksaMobileRegExp;

  /// List of valid prefixes for the active server.
  static List<String> get localPrefixes => _ksaPrefixes;

  /// Comma separated prefixes for error messages.
  static String get localPrefixesString => localPrefixes.join(', ');

  static String normalizeToLocalNsn(String phone) {
    final western = phone.replaceArabicDigits();
    final digits = western.replaceAll(RegExp(r'\D'), '');
    if (digits.isEmpty) return digits;

    var normalized = digits;
    if (normalized.startsWith('00')) {
      normalized = normalized.substring(2);
    }
    if (normalized.startsWith(_ksaCountryCode)) {
      normalized = normalized.substring(_ksaCountryCode.length);
    }
    if (normalized.startsWith('0')) {
      normalized = normalized.substring(1);
    }
    return normalized;
  }

  static bool hasValidPrefix(String phone) =>
      localPrefixRegExp.hasMatch(normalizeToLocalNsn(phone));

  static bool hasValidLength(String phone) =>
      normalizeToLocalNsn(phone).length == _ksaMobileNsnLength;

  static bool isValidMobile(String phone) {
    final parsed = _tryParse(phone);
    return parsed?.isValid(type: PhoneNumberType.mobile) ?? false;
  }

  static PhoneNumber? _tryParse(String phone) {
    final normalized = phone.replaceArabicDigits().trim();
    if (normalized.isEmpty) return null;
    try {
      return PhoneNumber.parse(
        normalized,
        callerCountry: localIso,
        destinationCountry: localIso,
      );
    } catch (_) {
      return null;
    }
  }
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
