import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart';
import 'package:silah_app/features/auth/domain/entities/self_registration_payload.dart';
import 'package:silah_app/features/auth/domain/repositories/auth_repository.dart';

import 'self_reg_operation_type.dart';

part 'self_registration_event.dart';
part 'self_registration_state.dart';

class SelfRegBloc extends Bloc<SelfRegEvent, SelfRegState> {
  final AuthRepo repository;
  final AppStateBloc appStateBloc;
  SelfRegBloc({
    required this.repository,
    required this.appStateBloc,
  }) : super(SelfRegInitialState()) {
    on<SelfRegComplete>(_handleCompleteRegistration);
  }

  Future<void> _handleCompleteRegistration(
    SelfRegComplete event,
    Emitter<SelfRegState> emit,
  ) async {
    emit(const SelfRegInProgress(operationType: SelfRegOperType.SelfReqComplete));

    final result = await repository.register(event.payload);
    result.fold(
      (failure) => _emitFailure(
        failure: failure,
        emit: emit,
        operationType: SelfRegOperType.SelfReqComplete,
      ),
      (authData) {
        emit(const SelfRegStepSuccess(operationType: SelfRegOperType.SelfReqComplete));
        appStateBloc.add(
          UserLoggedIn(
            authData: authData,
            userAuthStatus: UserAuthStatus.loggedInUnverifiedAccount,
          ),
        );
      },
    );
  }

  Future<void> _emitFailure({
    required Failure failure,
    required Emitter<SelfRegState> emit,
    required SelfRegOperType operationType,
  }) async {
    emit(
      BlocUtils.handleFailure(
        includeCodeLine: false,
        failure: failure,
        onError: (msg) => SelfRegError(operationType: operationType, message: msg),
        codeToMessageMap: codeToMessageMap,
      ),
    );
  }
}
