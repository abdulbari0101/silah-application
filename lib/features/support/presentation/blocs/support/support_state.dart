part of 'support_bloc.dart';

abstract class SupportState extends Equatable {
  const SupportState();

  @override
  List<Object> get props => [];
}

class DataPaymentInitial extends SupportState {}

class DataPaymentLoading extends SupportState {}

class DataPaymentLoaded extends SupportState {
  final List<SupportItemEntity> data;

  const DataPaymentLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class DataPaymentError extends SupportState {
  final String message;
  const DataPaymentError({required this.message});
  @override
  List<Object> get props => [message];
}
