part of 'login_bloc.dart';

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;
  const factory LoginState.loading({
    required LoginOperationType operationType,
  }) = LoginLoading;
  const factory LoginState.success({
    required LoginOperationType operationType,
  }) = LoginOperationSuccess;
  const factory LoginState.error({
    required String message,
    required LoginOperationType operationType,
  }) = LoginError;
}
