import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart';
import 'package:silah_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:silah_app/features/auth/presentation/blocs/login/login_operation_type.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.repository, required this.appStateBloc})
    : super(const LoginState.initial()) {
    on<LoginRequested>(
      _handleLogin,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
  }

  final AuthRepo repository;
  final AppStateBloc appStateBloc;
  final AppLogger logger = locator.get<AppLogger>();

  Future<void> _handleLogin(
    LoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginState.loading(operationType: LoginOperationType.signIn));

    final result = await repository.signIn(
      email: event.email,
      password: event.password,
    );
    result.fold(
      (failure) => _emitFailure(
        failure: failure,
        emit: emit,
        operationType: LoginOperationType.signIn,
      ),
      (authUser) {
        logger.blocDebug("authUser = $authUser");

        appStateBloc.add(
          UserLoggedIn(
            authData: authUser,
            userAuthStatus: UserAuthStatus.loggedInUnverifiedAccount,
          ),
        );

        emit(
          const LoginState.success(operationType: LoginOperationType.signIn),
        );
      },
    );
  }

  void _emitFailure({
    required Failure failure,
    required Emitter<LoginState> emit,
    required LoginOperationType operationType,
  }) {
    emit(
      BlocUtils.handleFailure(
        includeCodeLine: false,
        failure: failure,
        onError: (msg) =>
            LoginState.error(message: msg, operationType: operationType),
        codeToMessageMap: codeToMessageMap,
      ),
    );
  }
}
