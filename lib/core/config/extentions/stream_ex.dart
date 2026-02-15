import 'dart:async';

extension StreamSubX<T> on StreamSubscription<T>? {
  bool get isActive   => this != null && this!.isPaused == false;
  bool get isInactive => this == null || this!.isPaused == true;
}
