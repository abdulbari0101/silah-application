import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart';

import '../../../../infrastructure/errors/error_source.dart';
import '../../../../infrastructure/system/session_timeout_service.dart';

part 'sesstion_bloc.freezed.dart';
part 'sesstion_event.dart';
part 'sesstion_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc({required AppStateBloc appState, required this.timeOutService})
    : _appState = appState,
      super(const SessionState.initial()) {
    _timeoutSub = timeOutService.stream.listen((state) {
      AppLogger().blocInfo(tag: 'SessionBloc', "state = $state");

      if (state == SessionTimeoutState.userInactivityTimeout ||
          state == SessionTimeoutState.appFocusTimeout) {
        // Inactivity timeout navigation is disabled as requested by the user.
        // add(const InteractionTimedOutEvent());
      }
    });

    on<ResumeInteractionListener>(
      _onResumedInteractionListener,
      transformer: BlocUtils.debounce(const Duration(microseconds: 200)),
    );
    on<PauseInteractionListener>(
      _onPauseInteractionListener,
      transformer: BlocUtils.debounce(const Duration(microseconds: 200)),
    );
    on<InteractionTimedOutEvent>(
      _onInteractionTimedOutEvent,
      transformer: BlocUtils.debounce(const Duration(microseconds: 200)),
    );
    on<TokenExpiredEvent>(
      _onTokenExpiredEvent,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
  }

  final AppStateBloc _appState;
  final SessionTimeoutService timeOutService;

  StreamSubscription? _timeoutSub;

  void _onResumedInteractionListener(
    ResumeInteractionListener event,
    Emitter<SessionState> emit,
  ) {
    timeOutService.resume();
  }

  void _onPauseInteractionListener(
    PauseInteractionListener event,
    Emitter<SessionState> emit,
  ) {
    timeOutService.pause();
  }

  void _onInteractionTimedOutEvent(
    InteractionTimedOutEvent event,
    Emitter<SessionState> emit,
  ) {
    //_logout();
    emit(SessionState.idleTimedOut(randomId: Random().nextInt(1000000)));
  }

  void _onTokenExpiredEvent(
    TokenExpiredEvent event,
    Emitter<SessionState> emit,
  ) {
    //_logout();
    emit(SessionState.tokenExpired(source: event.source));
  }

  void _logout() {
    final isUserCurrentlyLoggedIn = _appState.state.data.isLoggedIn;

    if (isUserCurrentlyLoggedIn) {
      _appState.add(
        UpdateSession(
          isLoggedIn: false,
          userAuthStatus: UserAuthStatus.loggedOutReturningUser,
        ),
      );
    }
  }

  void expireSesstion({required SessionFailure failure}) =>
      add(TokenExpiredEvent(source: failure.source));

  @override
  Future<void> close() async {
    await _timeoutSub?.cancel();
    return super.close();
  }
}
