extension ExtraParams on Map<String, dynamic> {
  T? safe<T>(String key) {
    final value = this[key];
    return value is T ? value : null;
  }
}
