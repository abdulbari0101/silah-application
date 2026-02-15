import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:local_session_timeout/local_session_timeout.dart';

class SessionTimeoutService {
  static final _i = SessionTimeoutService._();
  factory SessionTimeoutService() => _i;
  SessionTimeoutService._() {
    _timeoutStateCtrl = StreamController<SessionTimeoutState>.broadcast();
  }

  bool _isInit = false;
  // Expose only the stream
  late final StreamController<SessionTimeoutState> _timeoutStateCtrl;
  Stream<SessionTimeoutState> get stream => _timeoutStateCtrl.stream;

  late final StreamController<SessionState> _serviceController;

  bool _isListening = true;

  Widget wrapWithManager({required Widget child, required int idleSeconds}) {
    if (!_isInit) {
      _serviceController = StreamController<SessionState>();
      _isInit = true;
    }
    final config = SessionConfig(
      invalidateSessionForUserInactivity: Duration(seconds: idleSeconds),
      invalidateSessionForAppLostFocus: Duration(seconds: idleSeconds),
    );

    final manager = SessionTimeoutManager(
      sessionConfig: config,
      sessionStateStream: _serviceController.stream,
      child: Listener(
        // listens to every pointer event
        onPointerDown: (pointer) {
       //   AppLogger().i(tag: 'SessionTimeoutService', " pointer = $pointer");

          resume();
        },
        child: child,
      ),
    );

    config.stream.listen((state) {
     // AppLogger().i(tag: 'SessionTimeoutService', " SessionTimeoutState = $state");

      _timeoutStateCtrl.add(state);
    });

    return manager;
  }

  bool get isActive => _isListening;

  void pause() {
    _isListening = false;

    _serviceController.add(SessionState.stopListening);
  }

  void resume() {
    _isListening = true;

    _serviceController.add(SessionState.startListening);
  }
  Future<void> dispose() async {

    await _serviceController.close();

    await _timeoutStateCtrl.close();

    _isInit = false;
    _isListening = true;
  }

  Future<void> reset() async {
    await dispose();
  }
}
