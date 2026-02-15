
class UrlParser {
  static final _url = RegExp(
    r'((https?:\/\/|ftp:\/\/)?([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,}(?::\d+)?(\/[^\s]*)?)',
    caseSensitive: false,
  );

  static bool containsUrl(String? input) => input != null && _url.hasMatch(input);

  static String? firstUrl(String? input) {
    if (input == null) return null;
    final m = _url.firstMatch(input);
    return m?.group(0);
  }

  static bool isUrl(String? s) {
    if (s == null || s.trim().isEmpty) return false;
    final uri = Uri.tryParse(s.trim());
    return uri != null && (uri.hasScheme || s.startsWith('www.')) && uri.host.isNotEmpty;
  }
}
