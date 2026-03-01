import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/auth/domain/repositories/auth_repository.dart';

part 'forget_pass_event.dart';
part 'forget_pass_state.dart';

class ForgetPassBloc extends Bloc<ForgetPassEvent, ForgetPassState> {
  final AuthRepo repository;

  ForgetPassBloc({required this.repository}) : super(ForgetPassInitial()) {
    on<ForgetPassRequest>(
      _onForgetPass,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
  }

  Future<void> _onForgetPass(
    ForgetPassRequest event,
    Emitter<ForgetPassState> emit,
  ) async {
    emit(ForgetPassLoading());

    final result = await repository.sendPasswordReset(email: event.email);
    result.fold(
      (failure) => _emitFailure(failure: failure, emit: emit),
      (_) => emit(ForgetPassSuccess()),
    );
  }

  Future<void> _emitFailure({
    required Failure failure,
    required Emitter<ForgetPassState> emit,
  }) async {
    if (failure is AuthFailure) {
      emit(ForgetPassError(message: failure.message, code: failure.code));
    } else {
      emit(
        BlocUtils.handleFailure(
          failure: failure,
          includeCodeLine: false,
          onError: (msg) => ForgetPassError(message: msg),
          codeToMessageMap: codeToMessageMap,
        ),
      );
    }
  }
}
