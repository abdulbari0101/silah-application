class OnceRunner {
  final Map<String, bool> _done = {};
  final Map<String, Future<void>> _pending = {};

  Future<void> run(String key, Future<void> Function() action) {
    if (_done[key] == true) return Future.value();
    final p = _pending[key];
    if (p != null) return p;
    final fut = _exec(key, action);
    _pending[key] = fut;
    return fut;
  }

  Future<void> _exec(String key, Future<void> Function() action) async {
    try {
      await action();
      _done[key] = true;
    } finally {
      _pending.remove(key);
    }
  }

  void reset(String key) { _done.remove(key); }
  void resetAll() { _done.clear(); _pending.clear(); }
}
