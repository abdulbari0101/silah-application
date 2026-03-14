import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:silah_app/core/config/extentions/string_validation.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/sesstion_bloc/sesstion_bloc.dart';

/// Utilities related to Bloc and error presentation.
class BlocUtils {
  static EventTransformer<T> debounce<T>(Duration duration) =>
      (events, mapper) => events.debounceTime(duration).flatMap(mapper);

  static State handleFailure<State>({
    required Failure failure,
    required State Function(String message) onError,
    Map<int, String> codeToMessageMap = const {},
    bool includeCodeLine = true,
  }) {
    if (failure is SessionFailure) {
      locator.get<SessionBloc>().expireSesstion(failure: failure);
    }

    return onError(
      mergeCodeWithMessage(
        failure,
        codeToMessageMap,
        includeCodeLine:
            includeCodeLine, // hide raw codes in toasts if you want
        fallbackMessage: Strings.unexpected_error
            .tr(), // ensure you have this key
      ),
    );
  }

  static String mergeCodeWithMessage(
    Failure failure,
    Map<int, String> codeToMessageMap, {
    String? fallbackMessage,
    bool includeCodeLine = true,
  }) {
    final int? code = failure.code;

    // 1) Resolve the best text for the code/message.
    final String message = _resolveMessage(
      code: code,
      failureMessage: failure.message,
      codeToMessageMap: codeToMessageMap,
      fallbackMessage: fallbackMessage ?? Strings.unexpected_error,
    );

    // 2) Compose final lines.
    final lines = <String>[];
    if (includeCodeLine && code != null) {
      lines.add('${Strings.status_code.tr()}: $code');
    }

    lines.add('${Strings.error.tr()}: ${_ensurePunctuation(message)}');

    return lines.join('\n');
  }

  /// Picks the best base message.
  static String _resolveMessage({
    required int? code,
    required String failureMessage,
    required Map<int, String> codeToMessageMap,
    required String fallbackMessage,
  }) {
    final String? mapped = codeToMessageMap[code]?.trim().tr();

    final String failureMsg = failureMessage.trim();

    AppLogger().networkDebug(
      tag: "execturor _resolveMessage",
      " mapped  = $mapped isTrue ${mapped.isNotNullOrEmpty} , failureMsg  = $failureMsg ,",
    );

    if (mapped.isNotNullOrEmpty) return mapped!;

    if (failureMsg.isNotNullOrEmpty) return failureMsg;

    return fallbackMessage.tr();
  }

  /// Ensures the message ends with a terminal punctuation mark.
  static String _ensurePunctuation(String s) {
    return RegExp(r'[.!?…]$').hasMatch(s) ? s : '$s.';
  }
}
