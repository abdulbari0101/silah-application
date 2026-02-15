part of 'chats_bloc.dart';

abstract class ChatsState extends Equatable {
  const ChatsState();

  @override
  List<Object> get props => [];
}

class DataChatInitial extends ChatsState {}

class DataChatLoading extends ChatsState {}

class DataChatLoaded extends ChatsState {
  final List<ChatItemEntity> data;

  const DataChatLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class DataChatError extends ChatsState {
  final String message;
  const DataChatError({required this.message});
  @override
  List<Object> get props => [message];
}
