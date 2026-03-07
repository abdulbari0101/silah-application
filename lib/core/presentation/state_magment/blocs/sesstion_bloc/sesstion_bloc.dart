import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:local_session_timeout/local_session_timeout.dart';

import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart';

import '../../../../infrastructure/errors/error_source.dart';
import '../../../../infrastructure/system/session_timeout_service.dart';

part 'sesstion_event.dart';
part 'sesstion_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final AppStateBloc _appState;
  final SessionTimeoutService timeOutService;

  StreamSubscription? _timeoutSub;

  SessionBloc({required AppStateBloc appState, required this.timeOutService})
    : _appState = appState,
      super(SessionInitial()) {
    _timeoutSub = timeOutService.stream.listen((state) {
      AppLogger().blocInfo(tag: 'SessionBloc', "state = $state");

      if (state == SessionTimeoutState.userInactivityTimeout ||
          state == SessionTimeoutState.appFocusTimeout) {
        add(InteractionTimedOutEvent());
      }
    });

    on<ResumeInteractionListener>(
      _onResumedInteractionListener,
      transformer: BlocUtils.debounce(Duration(microseconds: 200)),
    );
    on<PauseInteractionListener>(
      _onPauseInteractionListener,
      transformer: BlocUtils.debounce(Duration(microseconds: 200)),
    );
    on<InteractionTimedOutEvent>(
      _onInteractionTimedOutEvent,
      transformer: BlocUtils.debounce(Duration(microseconds: 200)),
    );

    on<TokenExpiredEvent>(
      _onTokenExpiredEvent,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );

  }

  /*──────── event handlers ────────*/
  void _onResumedInteractionListener(ResumeInteractionListener event, Emitter<SessionState> emit) {
    timeOutService.resume();
  }

  void _onPauseInteractionListener(PauseInteractionListener event, Emitter<SessionState> emit) {
    timeOutService.pause();
  }

  void _onInteractionTimedOutEvent(InteractionTimedOutEvent event, Emitter<SessionState> emit) {
    _logout();
    emit(SessionIdleTimedOut());
  }

  void _onTokenExpiredEvent(TokenExpiredEvent evt, Emitter<SessionState> emit) {
    _logout();
    emit(SessionTokenExpired(evt.source));
  }


  void _logout() {
    bool isUserCurrentlyLoggedIn = _appState.state.data.isLoggedIn;

    if (isUserCurrentlyLoggedIn) {
      _appState.add(
        UpdateSession(isLoggedIn: false, userAuthStatus: UserAuthStatus.loggedOutReturningUser),
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
