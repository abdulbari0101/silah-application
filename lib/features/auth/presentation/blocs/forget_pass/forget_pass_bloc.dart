import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:silah_app/core/foundation/formatting/phone_utils.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/features/auth/domain/repositories/auth_repository.dart';

import '../../../../../core/domain/entities/api/request/post_request_entity.dart';
import 'forget_pass_state_type.dart';

part 'forget_pass_event.dart';
part 'forget_pass_state.dart';

class ForgetPassBloc extends Bloc<ForgetPassEvent, ForgetPassState> {
  final AuthRepo repository;

  PostRequestEntity postRequest = PostRequestEntity();

  ForgetPassBloc({required this.repository}) : super(ForgetPassInitial()) {
    on<ForgetPassRequest>(
      _onForgetPass,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
    on<ReSendForgetPassRequest>(
      _onReSendForgetPassRequest,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
    on<ConfirmForgetPass>(
      _onConfirmForgetPass,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
  }

  Future<void> _onForgetPass(ForgetPassRequest event, Emitter<ForgetPassState> emit) async {
    emit(ForgetPasswordInProgress(operationType: ForgetPassStateType.RestPassword));

   
    postRequest = postRequest.copyWith(custMobile: event.mobile);
    final result = await repository.resetPass(event.mobile);
    result.fold(
      (failure) => _emitFailure(
        failure: failure,
        emit: emit,
        operationType: ForgetPassStateType.RestPassword,
      ),
      (_) => emit(ForgetPassSuccess(operationType: ForgetPassStateType.RestPassword)),
    );
  }

  Future<void> _onReSendForgetPassRequest(
    ReSendForgetPassRequest event,
    Emitter<ForgetPassState> emit,
  ) async {
    emit(ForgetPasswordInProgress(operationType: ForgetPassStateType.ReSendMobile));

    final result = await repository.resetPass(postRequest.custMobile?.normalizePhone() ?? "");

    result.fold(
      (failure) => _emitFailure(
        failure: failure,
        emit: emit,
        operationType: ForgetPassStateType.ReSendMobile,
      ),
      (_) => emit(ForgetPassSuccess(operationType: ForgetPassStateType.ReSendMobile)),
    );
  }

  Future<void> _onConfirmForgetPass(ConfirmForgetPass event, Emitter<ForgetPassState> emit) async {
    emit(ForgetPasswordInProgress(operationType: ForgetPassStateType.ResetConfirm));
    postRequest = postRequest.copyWith(
      otp: event.otp,
      custMobile: event.mobile,
      newPass: event.newPassword,
    );

    final result = await repository.resetPassComplete(postRequest);

    result.fold(
      (failure) => _emitFailure(
        failure: failure,
        emit: emit,
        operationType: ForgetPassStateType.ResetConfirm,
      ),
      (_) => emit(ForgetPassSuccess(operationType: ForgetPassStateType.ResetConfirm)),
    );
  }

  Future<void> _emitFailure({
    required Failure failure,
    required Emitter<ForgetPassState> emit,
    required ForgetPassStateType operationType,
  }) async {
    if (failure is AuthFailure) {
      emit(
        ForgetPassError(operationType: operationType, message: failure.message, code: failure.code),
      );
    } else {
      emit(
        BlocUtils.handleFailure(
          failure: failure,
          includeCodeLine: false,
          onError: (msg) => ForgetPassError(message: msg, operationType: operationType),
          codeToMessageMap: codeToMessageMap,
        ),
      );
    }
  }
}
