import 'dart:async';

class UiError {
  final String title;
  final String message;
  final Object error;
  final StackTrace stack;
  final DateTime time = DateTime.now();

  UiError({
    required this.title,
    required this.message,
    required this.error,
    required this.stack,
  });

  String get details => '$title\n$message\n$error\n\n$stack';
}

class UiErrorBus {
  UiErrorBus._();
  static final UiErrorBus i = UiErrorBus._();

  final _ctrl = StreamController<UiError>.broadcast();
  Stream<UiError> get stream => _ctrl.stream;

  void emit(UiError e) {
    print("trak the strema $e , isClosed= ${_ctrl.isClosed}");
    if (!_ctrl.isClosed) _ctrl.add(e);
  }

  void dispose() => _ctrl.close();
}
