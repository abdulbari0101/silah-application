part of 'forget_pass_bloc.dart';

sealed class ForgetPassState extends Equatable {
  const ForgetPassState();

  @override
  List<Object?> get props => [];
}

class ForgetPassInitial extends ForgetPassState {}

class ForgetPassLoading extends ForgetPassState {}

class ForgetPassSuccess extends ForgetPassState {}

class ForgetPassError extends ForgetPassState {
  final String message;
  final int? code;

  const ForgetPassError({required this.message, this.code});

  @override
  List<Object?> get props => [message, code];
}
