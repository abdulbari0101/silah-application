import 'package:silah_app/features/auth/presentation/blocs/login/login_bloc.dart';
import 'package:silah_app/features/auth/presentation/blocs/login/login_operation_type.dart';

extension LoginStateExtension on LoginState {
  bool get isInitial => this is LoginInitial;
  bool get isLoading => this is LoginLoading;

  bool get isSuccess => this is LoginOperationSuccess;
  bool get isError => this is LoginError;

  LoginError? get asError => this is LoginError ? this as LoginError : null;

  LoginOperationType? get operationType {
    final state = this;
    if (state is LoginLoading) return state.operationType;
    if (state is LoginOperationSuccess) return state.operationType;
    if (state is LoginError) return state.operationType;
    return null;
  }

  String get errorTitle => operationType?.errorTitleKey ?? '';

  String? get errorMessage => asError?.message;
  bool get isShowButtonLoading => isLoading;
}
