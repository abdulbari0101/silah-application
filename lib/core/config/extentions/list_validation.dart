extension NullableIterableX<T> on Iterable<T>? {
  bool get isNullOrEmpty   => this?.isEmpty ?? true;
  bool get isNotNullOrEmpty => this?.isNotEmpty ?? false;
}
