import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/domain/entities/api/request/post_request_entity.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/error_codes.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/app_setting_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart';
import 'package:silah_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:silah_app/features/auth/presentation/blocs/login/login_operation_type.dart';
import 'package:silah_app/features/auth/presentation/blocs/login/verfication_reason.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo repository;
  final AppStateBloc appStateBloc;
  final AppSettingBloc settingBloc;
  final AppLogger logger = locator.get<AppLogger>();
  PostRequestEntity postRequest = PostRequestEntity();

  LoginBloc({required this.repository, required this.appStateBloc, required this.settingBloc})
    : super(LoginInitial()) {
    /// login
    on<LoginToken>(
      _handleLoginWithToken,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
    on<Login>(_handleLogin, transformer: BlocUtils.debounce(const Duration(milliseconds: 200)));

    on<ConfrimtLogInInNewDevice>(
      _handleConfrimtLogInInNewDevice,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );

    /// otp methods

    on<RequestPhoneOTP>(
      _onRequestPhoneOTP,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
    on<ReSendPhoneOTP>(
      _onResendPhoneOTP,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
    on<ConfirmPhoneOTP>(
      _onConfirmPhoneOTP,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );

    /// Change Password

    on<ChangeFirstPassword>(
      _handleChangeFirstPassword,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
    on<ChangeFirstPin>(
      _handleChangeFirstPin,
      transformer: BlocUtils.debounce(const Duration(milliseconds: 200)),
    );
  }

  /// /// /// /// ///

  /// login
  Future<void> _handleLoginWithToken(LoginToken event, Emitter<LoginState> emit) async {
    emit(LoginLoading(operationType: LoginOperationType.LoginToken));
    postRequest = postRequest.copyWith(email: event.mobile);

    // right value is bool
    // true = user logged using new device so he need device verfication
    // false = user already logged from the same device
    final result = await repository.loginToken(mobile: event.mobile, password: event.password);
    result.fold(
      (failure) =>
          _emitFailure(failure: failure, emit: emit, operationType: LoginOperationType.LoginToken),
      (isNewDeviceLogin) {
        if (isNewDeviceLogin) {
          requestPhoneVerfication(emit: emit, reason: VerificationReason.firstTimeLogin);
        } else {
          add(Login());
        }
      },
    );
  }

  Future<void> _handleLogin(Login event, Emitter<LoginState> emit) async {
    emit(LoginLoading(operationType: LoginOperationType.Login));

    final result = await repository.login(postRequest);

    result.fold(
      (failure) =>
          _emitFailure(failure: failure, emit: emit, operationType: LoginOperationType.Login),
      (authExData) {
        logger.blocDebug("authExData.customer = ${authExData.customer}");
        // update the app state so can user root to the home screen

        UserAuthStatus? userAuthStatus;
        userAuthStatus = UserAuthStatus.loggedInUnverifiedAccount;

        appStateBloc.add(UserLoggedIn(authData: authExData, userAuthStatus: userAuthStatus));

        // this state just stop the progress in the botton
        emit(LoginOperationSuccess(operationType: LoginOperationType.Login));
      },
    );
  }

  Future<void> _handleConfrimtLogInInNewDevice(
    ConfrimtLogInInNewDevice event,
    Emitter<LoginState> emit,
  ) async {
    requestPhoneVerfication(emit: emit, reason: VerificationReason.loginConfirmedOnNewDevice);
  }

  /// OTP METHODS

  Future<void> _onRequestPhoneOTP(RequestPhoneOTP event, Emitter<LoginState> emit) async {
    final result = await repository.reqDeviceRegistration(postRequest);

    result.fold(
      (failure) => _emitFailure(
        failure: failure,
        emit: emit,
        operationType: LoginOperationType.RequestPhoneOTP,
      ),
      (_) => emit(LoginOperationSuccess(operationType: LoginOperationType.RequestPhoneOTP)),
    );
  }

  Future<void> _onResendPhoneOTP(ReSendPhoneOTP event, Emitter<LoginState> emit) async {
    emit(LoginLoading(operationType: LoginOperationType.ReSendPhoneOTP));

    final result = await repository.reqDeviceRegistration(postRequest);

    result.fold(
      (failure) => _emitFailure(
        failure: failure,
        emit: emit,
        operationType: LoginOperationType.ReSendPhoneOTP,
      ),
      (_) => emit(LoginOperationSuccess(operationType: LoginOperationType.ReSendPhoneOTP)),
    );
  }

  Future<void> _onConfirmPhoneOTP(ConfirmPhoneOTP event, Emitter<LoginState> emit) async {
    emit(LoginLoading(operationType: LoginOperationType.ConfirmPhoneOTP));
    postRequest = postRequest.copyWith(otp: event.otp);

    final result = await repository.comDeviceRegistration(postRequest);

    result.fold(
      (failure) => _emitFailure(
        failure: failure,
        emit: emit,
        operationType: LoginOperationType.ConfirmPhoneOTP,
      ),
      (_) {
        emit(LoginOperationSuccess(operationType: LoginOperationType.ConfirmPhoneOTP));
        add(Login());
      },
    );
  }

  /// ChangePassword

  Future<void> _handleChangeFirstPassword(
    ChangeFirstPassword event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading(operationType: LoginOperationType.ChangePassword));

    postRequest = postRequest.copyWith(custPass: event.currentPassword, newPass: event.newPassword);
    final result = await repository.changeFirstPassword(postRequest);

    result.fold(
      (failure) => _emitFailure(
        failure: failure,
        emit: emit,
        operationType: LoginOperationType.ChangePassword,
      ),
      (_) {
        emit(LoginOperationSuccess(operationType: LoginOperationType.ChangePassword));

        appStateBloc.add(
          UpdateSession(isLoggedIn: true, userAuthStatus: UserAuthStatus.loggedInUnverifiedAccount),
        );
        // update the appStateBloc (has all the data in the app)
      },
    );
  }

  /// Change PIN

  Future<void> _handleChangeFirstPin(ChangeFirstPin event, Emitter<LoginState> emit) async {
    emit(LoginLoading(operationType: LoginOperationType.ChangePin));

    postRequest = postRequest.copyWith(pin: event.currentPin, newPin: event.newPin);
    final result = await repository.changeFirstPin(postRequest);

    result.fold(
      (failure) =>
          _emitFailure(failure: failure, emit: emit, operationType: LoginOperationType.ChangePin),
      (_) {
        emit(LoginOperationSuccess(operationType: LoginOperationType.ChangePin));
        appStateBloc.add(
          UpdateSession(isLoggedIn: true, userAuthStatus: UserAuthStatus.loggedInUnverifiedAccount),
        );
      },
    );
  }

  /// helper Methods

  requestPhoneVerfication({required Emitter<LoginState> emit, required VerificationReason reason}) {
    appStateBloc.add(
      UpdateSession(isLoggedIn: false, userAuthStatus: UserAuthStatus.loggedInUnverifiedDevice),
    );

    final mobile = postRequest.custMobile;

    if (mobile != null) {
      add(RequestPhoneOTP());
    }

    emit(PhoneNumberVerficationRequired(reason: reason));
  }

  void _emitFailure({
    required Failure failure,
    required Emitter<LoginState> emit,
    required LoginOperationType operationType,
  }) {
    if (failure is AuthFailure && failure.code == ErrorCodes.deviceRegRequired4008) {
      emit(PhoneNumberVerficationRequired(reason: VerificationReason.deviceChanged));
    } else {
      emit(
        BlocUtils.handleFailure(
          includeCodeLine: false,
          failure: failure,
          onError: (msg) => LoginError(message: msg, operationType: operationType),
          codeToMessageMap: codeToMessageMap,
        ),
      );
    }
  }
}
