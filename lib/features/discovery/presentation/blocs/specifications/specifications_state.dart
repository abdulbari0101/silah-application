part of 'specifications_bloc.dart';

abstract class SpecificationsState extends Equatable {
  const SpecificationsState();

  @override
  List<Object> get props => [];
}

class DataPaymentInitial extends SpecificationsState {}

class DataPaymentLoading extends SpecificationsState {}

class DataPaymentLoaded extends SpecificationsState {
  final List<LegalSpecializationEntity> data;

  const DataPaymentLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class DataPaymentError extends SpecificationsState {
  final String message;
  const DataPaymentError({required this.message});
  @override
  List<Object> get props => [message];
}
