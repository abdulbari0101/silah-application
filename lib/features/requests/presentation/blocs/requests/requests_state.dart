part of 'requests_bloc.dart';

abstract class RequestsState extends Equatable {
  const RequestsState();

  @override
  List<Object> get props => [];
}

class DataRequestInitial extends RequestsState {}

class DataRequestLoading extends RequestsState {}

class DataRequestLoaded extends RequestsState {
  final List<RequestItemEntity> data;

  const DataRequestLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class DataRequestError extends RequestsState {
  final String message;
  const DataRequestError({required this.message});
  @override
  List<Object> get props => [message];
}
