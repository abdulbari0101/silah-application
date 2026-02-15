import 'package:bloc/bloc.dart' show Emitter; //
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';

extension FailureEmitter<S> on Emitter<S> {
  /// Emit a localized error state using your shared BlocUtils + codeToMessageMap.
  void emitFailure(Failure failure, {required S Function(String message) onError}) {
    final state = BlocUtils.handleFailure(
      failure: failure,
      onError: onError,
      codeToMessageMap: codeToMessageMap,
    );
    this(state);
  }
}
