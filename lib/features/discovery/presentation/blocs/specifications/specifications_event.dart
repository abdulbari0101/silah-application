part of 'specifications_bloc.dart';

abstract class SpecificationsEvent extends Equatable {
  const SpecificationsEvent();

  @override
  List<Object> get props => [];
}

class LoadSpecifications extends SpecificationsEvent {}
