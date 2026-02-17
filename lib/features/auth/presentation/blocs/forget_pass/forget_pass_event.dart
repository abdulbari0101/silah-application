part of 'forget_pass_bloc.dart';

sealed class ForgetPassEvent extends Equatable {
  const ForgetPassEvent();

  @override
  List<Object?> get props => [];
}

class ForgetPassRequest extends ForgetPassEvent {
  final String email;

  const ForgetPassRequest({required this.email});

  @override
  List<Object?> get props => [email];
}
