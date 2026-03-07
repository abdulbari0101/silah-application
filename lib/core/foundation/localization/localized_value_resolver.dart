class LocalizedValueResolver {
  LocalizedValueResolver._();

  static String? resolve({
    required String localeCode,
    String? arabic,
    String? english,
    String? fallback,
  }) {
    final normalizedLocale = localeCode.trim().toLowerCase();
    if (normalizedLocale == 'ar') {
      return _firstNonEmpty([arabic, english, fallback]);
    }
    return _firstNonEmpty([english, arabic, fallback]);
  }

  static String? resolveFromMap(
    Map<String, dynamic>? data, {
    required String localeCode,
    String arabicKey = 'nameAr',
    String englishKey = 'nameEn',
    String fallbackKey = 'name',
  }) {
    if (data == null) {
      return null;
    }
    return resolve(
      localeCode: localeCode,
      arabic: data[arabicKey]?.toString(),
      english: data[englishKey]?.toString(),
      fallback: data[fallbackKey]?.toString(),
    );
  }

  static String? _firstNonEmpty(Iterable<String?> values) {
    for (final value in values) {
      final trimmed = value?.trim();
      if (trimmed != null && trimmed.isNotEmpty) {
        return trimmed;
      }
    }
    return null;
  }
}
