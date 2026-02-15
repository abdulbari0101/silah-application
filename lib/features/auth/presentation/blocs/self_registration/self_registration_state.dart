part of 'self_registration_bloc.dart';

sealed class SelfRegState extends Equatable {
    final SelfRegOperType operationType;
  const SelfRegState({required this.operationType});
  @override
  List<Object?> get props => [operationType];

}

class SelfRegInitialState extends SelfRegState {
  SelfRegInitialState():super(operationType: SelfRegOperType.Token);
  @override
   List<Object?> get props => super.props;

}

class SelfRegInProgress extends SelfRegState {

  const SelfRegInProgress({required super.operationType});

   @override
   List<Object?> get props => super.props;

}

class SelfRegStepSuccess extends SelfRegState {

  final String? data; // optional: mobile number, email, etc.
  const SelfRegStepSuccess({required super.operationType, this.data});

    @override
   List<Object?> get props => [... super.props ,data];


}

class SelfRegError extends SelfRegState {
  final String message;
  const SelfRegError({required super.operationType, required this.message});




    @override
   List<Object?> get props => [... super.props ,message];
}
