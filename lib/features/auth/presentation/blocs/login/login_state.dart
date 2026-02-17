part of 'login_bloc.dart';



abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}


class LoginLoading extends LoginState {
  final LoginOperationType operationType;
  const LoginLoading({required this.operationType});

  @override
  List<Object> get props => [operationType];
}

class LoginOperationSuccess extends LoginState {
  final LoginOperationType operationType;
  const LoginOperationSuccess({required this.operationType});

  @override
  List<Object> get props => [operationType];
}


class LoginError extends LoginState {
  final String message;
  final LoginOperationType operationType;

  const LoginError( {required this.message,required this.operationType,});
  @override
  List<Object> get props => [message];
}
