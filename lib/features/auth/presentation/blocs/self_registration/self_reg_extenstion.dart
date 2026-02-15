import 'package:silah_app/features/auth/presentation/blocs/self_registration/self_reg_operation_type.dart';
import 'package:silah_app/features/auth/presentation/blocs/self_registration/self_registration_bloc.dart';

extension SelfRegStateExtension on SelfRegState {
  bool get isInitial => this is SelfRegInitialState;
  bool get isLoading => this is SelfRegInProgress;
  bool get isResendPhoneOTPLoading =>
      this is SelfRegInProgress && operationType == SelfRegOperType.ReSendMobileRquest;

  bool get isResendEmailOTPLoading =>
      this is SelfRegInProgress && operationType == SelfRegOperType.ReSendEmailRquest;

  bool get isResendOTPLoading => isResendPhoneOTPLoading || isResendEmailOTPLoading;
  bool get isShowButtonLoading => isLoading && !isResendOTPLoading;

  bool get isSuccess => this is SelfRegStepSuccess;
  bool get isError => this is SelfRegError;

  SelfRegError? get asError => this is SelfRegError ? this as SelfRegError : null;

  String get errorTitle => operationType.errorTitleKey;

  String? get errorMessage => asError?.message;

  bool get isTokenStep => operationType == SelfRegOperType.Token;
  bool get isMobileRequest => operationType == SelfRegOperType.MobileRquest;
  bool get isResendMobileRequest => operationType == SelfRegOperType.ReSendMobileRquest;
  bool get isMobileConfirm => operationType == SelfRegOperType.MobileConfirm;
  bool get isEmailRequest => operationType == SelfRegOperType.EmailRquest;
  bool get isResendEmailRequest => operationType == SelfRegOperType.ReSendEmailRquest;
  bool get isEmailConfirm => operationType == SelfRegOperType.EmailConfirm;
  bool get isFillFormNoEmail => operationType == SelfRegOperType.FillFormWithoutEmail;
  bool get isCompleteStep => operationType == SelfRegOperType.SelfReqComplete;
}
