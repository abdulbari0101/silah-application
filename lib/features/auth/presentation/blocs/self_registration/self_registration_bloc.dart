import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/domain/entities/api/request/post_request_entity.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart';
import 'package:silah_app/features/auth/domain/entities/auth_ex_data_entity.dart';
import 'package:silah_app/core/domain/entities/api/auth/customer_entity.dart';
import 'package:silah_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:silah_app/features/auth/domain/entities/self_registration_payload.dart';

import 'self_reg_operation_type.dart';

part 'self_registration_event.dart';
part 'self_registration_state.dart';

class SelfRegBloc extends Bloc<SelfRegEvent, SelfRegState> {
  final AuthRepo repository;
  final AppStateBloc appStateBloc;
  final AppLogger logger = locator.get<AppLogger>();
  String? phoneOTP;
  PostRequestEntity postRequest = PostRequestEntity();

  SelfRegBloc({
    required this.repository,
    required this.appStateBloc,
  }) : super(SelfRegInitialState()) {
    on<SelfRegToken>(
      _handleSelfRegWithToken,
    );

    on<SelfRegPhoneVerfiyRequest>(
      _handlePhoneVerifyRequest,
    );
    on<SelfRegReSendPhoneVerfiyRequest>(
      _handleResendPhoneVerify,
    );
    on<SelfRegPhoneVerfiyConfirm>(
      _handlePhoneVerifyConfirm,
    );
    on<SelfRegEmailVerfiyRequest>(
      _handleEmailVerifyRequest,
    );
    on<ReSendEmailVerfiyRequest>(
      _handleResendEmailVerify,
    );
    on<SelfRegEmailVerfiyConfirm>(
      _handleEmailVerifyConfirm,
    );
    on<SelfRegInfoFormSubmit>(
      _handleSelfRegInfoFormSubmit,
    );
    on<SelfRegComplete>(
      _handleCompleteRegistration,
    );
  }

  Future<void> _handleSelfRegWithToken(SelfRegToken event, Emitter<SelfRegState> emit) async {
    emit(SelfRegInProgress(operationType: SelfRegOperType.Token));
    postRequest = postRequest.copyWith(destinationMobile: event.mobile, refNo: event.refrenceCode);
    final result = await repository.selfRegToken();
    result.fold(
      (failure) => _emitFailure(failure: failure, emit: emit, operationType: SelfRegOperType.Token),
      (_) => add(SelfRegPhoneVerfiyRequest()),
    );
  }

  Future<void> _handlePhoneVerifyRequest(
    SelfRegPhoneVerfiyRequest event,
    Emitter<SelfRegState> emit,
  ) async {
    await _phoneVerifyRequest(emit: emit, operationType: SelfRegOperType.MobileRquest);
  }

  Future<void> _handleResendPhoneVerify(
    SelfRegReSendPhoneVerfiyRequest event,
    Emitter<SelfRegState> emit,
  ) async {
    await _phoneVerifyRequest(emit: emit, operationType: SelfRegOperType.ReSendMobileRquest);
  }

  Future<void> _phoneVerifyRequest({
    required Emitter<SelfRegState> emit,
    required SelfRegOperType operationType,
  }) async {
    emit(SelfRegInProgress(operationType: operationType));
    final result = await repository.selfRegMobileRequest(postRequest);
    result.fold(
      (failure) => _emitFailure(failure: failure, emit: emit, operationType: operationType),
      (_) => emit(SelfRegStepSuccess(operationType: operationType)),
    );
  }

  Future<void> _handlePhoneVerifyConfirm(
    SelfRegPhoneVerfiyConfirm event,
    Emitter<SelfRegState> emit,
  ) async {
    emit(SelfRegInProgress(operationType: SelfRegOperType.MobileConfirm));

    phoneOTP = event.otp;
    postRequest = postRequest.copyWith(otp: phoneOTP);
    final result = await repository.selfRegMobileComplete(postRequest);
    result.fold(
      (failure) =>
          _emitFailure(failure: failure, emit: emit, operationType: SelfRegOperType.MobileConfirm),
      (_) => emit(SelfRegStepSuccess(operationType: SelfRegOperType.MobileConfirm)),
    );
  }

  Future<void> _handleEmailVerifyRequest(
    SelfRegEmailVerfiyRequest event,
    Emitter<SelfRegState> emit,
  ) async {
    await _emailVerifyRequest(
      emit: emit,
      email: event.email,
      operationType: SelfRegOperType.EmailRquest,
    );
  }

  Future<void> _handleResendEmailVerify(
    ReSendEmailVerfiyRequest event,
    Emitter<SelfRegState> emit,
  ) async {
    await _emailVerifyRequest(
      emit: emit,
      email: postRequest.email!,
      operationType: SelfRegOperType.ReSendEmailRquest,
    );
  }

  Future<void> _emailVerifyRequest({
    required Emitter<SelfRegState> emit,
    required String email,
    required SelfRegOperType operationType,
  }) async {
    emit(SelfRegInProgress(operationType: operationType));
    postRequest = postRequest.copyWith(email: email);
    final result = await repository.selfRegEmailRequest(postRequest);
    result.fold(
      (failure) => _emitFailure(failure: failure, emit: emit, operationType: operationType),
      (_) => emit(SelfRegStepSuccess(operationType: operationType)),
    );
  }

  Future<void> _handleEmailVerifyConfirm(
    SelfRegEmailVerfiyConfirm event,
    Emitter<SelfRegState> emit,
  ) async {
    emit(SelfRegInProgress(operationType: SelfRegOperType.EmailConfirm));
    postRequest = postRequest.copyWith(otp: event.otp);
    final result = await repository.selfRegEmailComplete(postRequest);
    result.fold(
      (failure) =>
          _emitFailure(failure: failure, emit: emit, operationType: SelfRegOperType.EmailConfirm),
      (_) => emit(SelfRegStepSuccess(operationType: SelfRegOperType.EmailConfirm)),
    );
  }

  Future<void> _handleSelfRegInfoFormSubmit(
    SelfRegInfoFormSubmit event,
    Emitter<SelfRegState> emit,
  ) async {
    postRequest = postRequest.copyWith(
      firstName: event.firstName,
      lastName: event.lastName,
      email: event.email,
    );

    if (event.email != null && event.email!.trim().isNotEmpty) {
      add(SelfRegEmailVerfiyRequest(email: event.email!));
    } else {
      emit(SelfRegStepSuccess(operationType: SelfRegOperType.FillFormWithoutEmail));
    }
  }

  Future<void> _handleCompleteRegistration(
    SelfRegComplete event,
    Emitter<SelfRegState> emit,
  ) async {
    emit(SelfRegInProgress(operationType: SelfRegOperType.SelfReqComplete));
    final payload = event.payload;
    final result = await repository.selfRegComplete(payload);
    result.fold(
      (failure) => _emitFailure(
        failure: failure,
        emit: emit,
        operationType: SelfRegOperType.SelfReqComplete,
      ),
      (_) {
        emit(SelfRegStepSuccess(operationType: SelfRegOperType.SelfReqComplete));
        final fullName = payload.fullName;
        final customer = CustomerEntity(
          fullName: fullName.isEmpty ? null : fullName,
          firstName: payload.firstName,
          lastName: payload.lastName,
          email: payload.email,
          mobileNo: payload.phone,
        );

        appStateBloc.add(
          UserLoggedIn(
            authData: ExDataAuthEntity(customer: customer),
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
