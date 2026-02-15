part of 'forget_pass_bloc.dart';

sealed class ForgetPassState extends Equatable {
  const ForgetPassState();

  @override
  List<Object> get props => [];
}


class ForgetPassInitial extends ForgetPassState {}


class ForgetPasswordInProgress extends ForgetPassState {
  final ForgetPassStateType operationType;
  const ForgetPasswordInProgress( {required this.operationType});

}

class ForgetPassSuccess extends ForgetPassState {

  final ForgetPassStateType operationType;
  const ForgetPassSuccess( {required this.operationType});

}

class ForgetPassError extends ForgetPassState {
  final String message;
  final int? code;

  final ForgetPassStateType operationType;
  const ForgetPassError( {required this.message,this.code,required this.operationType});
  @override
  List<Object> get props => [message];
}


// confirm
