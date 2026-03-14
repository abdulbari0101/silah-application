import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/features/auth/domain/entities/registration_payload.dart';
import 'package:silah_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:silah_app/features/auth/presentation/support/auth_user_auth_status_resolver.dart';

import 'registration_operation_type.dart';

part 'registration_bloc.freezed.dart';
part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc({required this.repository, required this.appStateBloc})
    : super(const RegistrationState.initial()) {
    on<RegisterUser>(_handleRegisterUser);
  }

  final AuthRepo repository;
  final AppStateBloc appStateBloc;

  Future<void> _handleRegisterUser(
    RegisterUser event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(
      const RegistrationState.inProgress(
        operationType: RegistrationOperType.reqComplete,
      ),
    );

    final result = await repository.register(event.payload);
    result.fold(
      (failure) => _emitFailure(
        failure: failure,
        emit: emit,
        operationType: RegistrationOperType.reqComplete,
      ),
      (authData) {
        emit(
          const RegistrationState.stepSuccess(
            operationType: RegistrationOperType.reqComplete,
          ),
        );
        appStateBloc.add(
          UserLoggedIn(
            authData: authData,
            userAuthStatus: resolveUserAuthStatus(authData),
          ),
        );
      },
    );
  }

  Future<void> _emitFailure({
    required Failure failure,
    required Emitter<RegistrationState> emit,
    required RegistrationOperType operationType,
  }) async {
    emit(
      BlocUtils.handleFailure(
        includeCodeLine: false,
        failure: failure,
        onError: (msg) =>
            RegistrationState.error(operationType: operationType, message: msg),
        codeToMessageMap: codeToMessageMap,
      ),
    );
  }
}
