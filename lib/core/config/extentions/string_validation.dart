extension StringValidation on String? {
  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;

  String? get capitalizeFirstWithNull {
    if (isNullOrEmpty) return this;
    return this![0].toUpperCase() + (this?.substring(1) ?? "");
  }
}

extension StringWithNullValidation on String {
  String get capitalizeFirst {
    if (isEmpty) return this;
    return this[0].toUpperCase() + (substring(1));
  }
}
