import 'dart:ui';

class CallbackRegistry {
  static final Map<String, VoidCallback> _callbacks = {};

  static void register(String key, VoidCallback callback) {
    _callbacks[key] = callback;
  }

  static VoidCallback? retrieve(String key) => _callbacks[key];

  static void remove(String key) {
    _callbacks.remove(key);
  }

  /// Invoke VoidCallback by key
  static void invoke(String key) {
    final callback = _callbacks[key];
    if (callback != null) {
      callback();
      remove(key);
    }
  }


  static void clear() {
    _callbacks.clear();
  }
}
