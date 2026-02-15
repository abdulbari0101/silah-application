abstract class KeyValueStore<K> {
  Future<bool> write({required K key, required String value, String? userId});
  Future<String?> read({required K key, String? userId});
  Future<bool> delete({required K key, String? userId});
  Future<void> tryDeleteSilently({required K key, String? userId});
  Future<bool> containsKey({required K key, String? userId});
  Stream<String?> watch({required K key, String? userId});

  Future<T> guard<T>({
    required K key,
    required String? userId,
    required String op,
    required bool deleteOnError,
    required Future<T> Function() body,
  });

  // helpers
}
