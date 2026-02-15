import 'package:bloc/bloc.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/log_encode.dart';

class YBRDBlocObserver extends BlocObserver {
  final _log = AppLogger();

  String _typeOf(Object? o) => o.runtimeType.toString().split('<').first;

  @override
  void onEvent(Bloc bloc, Object? event) {
    // Header (types only)
    _log.blocInfo('${_typeOf(bloc)} ▶ ${_typeOf(event)}', tag: 'Event');

    // Payload (sanitized, single-line, truncated)
    if (event != null) {
      //_log.blocDebug(encodePayload(event), tag: 'EventPayload');
      _log.blocDebug(encodePayload(event), tag: 'EventPayload');
    }
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    // Cubit state header
    _log.blocDebug(
      '${_typeOf(bloc)} ${_typeOf(change.currentState)} ➜ ${_typeOf(change.nextState)}',
      tag: 'Change',
    );

    // Optional: state diff (only if your states are @MappableClass)
    final diff = encodeDiff(change.currentState, change.nextState);
    if (diff != '{}') {
      _log.blocDebug(diff, tag: 'StateDiff');
    } else {
      // or log the full nextState payload if you prefer
      // _log.blocDebug(encodePayload(change.nextState), tag: 'NextState');
    }
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    _log.blocDebug(
      '${_typeOf(bloc)} [${_typeOf(transition.event)}] '
      '${_typeOf(transition.currentState)} ➜ ${_typeOf(transition.nextState)}',
      tag: 'Transition',
    );

    // Event payload + state diff for full context
    _log.blocDebug(encodePayload(transition.event), tag: 'EventPayload');
    final diff = encodeDiff(transition.currentState, transition.nextState);
    if (diff != '{}') _log.blocDebug(diff, tag: 'StateDiff');

    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stack) {
    _log.blocError(error, tag: _typeOf(bloc), stack: stack);
    super.onError(bloc, error, stack);
  }
}
