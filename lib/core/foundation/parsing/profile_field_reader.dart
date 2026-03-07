class ProfileFieldReader {
  ProfileFieldReader._();

  static const List<String> displayNameKeys = <String>[
    'name',
    'fullName',
    'email',
  ];

  static const List<String> avatarKeys = <String>[
    'avatarUrl',
    'avatarURL',
    'photoUrl',
    'photoURL',
    'imageUrl',
    'imageURL',
    'profileImage',
    'profileImageUrl',
  ];

  static String? firstNonEmpty(Iterable<Object?> values) {
    for (final value in values) {
      final normalized = _normalize(value);
      if (normalized != null) {
        return normalized;
      }
    }
    return null;
  }

  static String? readDisplayName(
    Map<String, dynamic>? data, {
    Iterable<Object?> fallbackValues = const <Object?>[],
  }) {
    return readFirstByKeys(
      data,
      displayNameKeys,
      fallbackValues: fallbackValues,
    );
  }

  static String? readAvatarUrl(
    Map<String, dynamic>? data, {
    Iterable<Object?> fallbackValues = const <Object?>[],
  }) {
    return readFirstByKeys(data, avatarKeys, fallbackValues: fallbackValues);
  }

  static String? readFirstByKeys(
    Map<String, dynamic>? data,
    Iterable<String> keys, {
    Iterable<Object?> fallbackValues = const <Object?>[],
  }) {
    final candidates = <Object?>[];
    if (data != null) {
      for (final key in keys) {
        candidates.add(data[key]);
      }
    }
    candidates.addAll(fallbackValues);
    return firstNonEmpty(candidates);
  }

  static String? _normalize(Object? value) {
    if (value is! String) {
      return null;
    }
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}
