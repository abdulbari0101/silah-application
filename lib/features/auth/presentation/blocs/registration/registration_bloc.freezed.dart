// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegistrationEvent {

 RegistrationPayload get payload;
/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationEventCopyWith<RegistrationEvent> get copyWith => _$RegistrationEventCopyWithImpl<RegistrationEvent>(this as RegistrationEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationEvent&&(identical(other.payload, payload) || other.payload == payload));
}


@override
int get hashCode => Object.hash(runtimeType,payload);

@override
String toString() {
  return 'RegistrationEvent(payload: $payload)';
}


}

/// @nodoc
abstract mixin class $RegistrationEventCopyWith<$Res>  {
  factory $RegistrationEventCopyWith(RegistrationEvent value, $Res Function(RegistrationEvent) _then) = _$RegistrationEventCopyWithImpl;
@useResult
$Res call({
 RegistrationPayload payload
});




}
/// @nodoc
class _$RegistrationEventCopyWithImpl<$Res>
    implements $RegistrationEventCopyWith<$Res> {
  _$RegistrationEventCopyWithImpl(this._self, this._then);

  final RegistrationEvent _self;
  final $Res Function(RegistrationEvent) _then;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? payload = null,}) {
  return _then(_self.copyWith(
payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as RegistrationPayload,
  ));
}

}


/// Adds pattern-matching-related methods to [RegistrationEvent].
extension RegistrationEventPatterns on RegistrationEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RegisterUser value)?  registerUser,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RegisterUser() when registerUser != null:
return registerUser(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RegisterUser value)  registerUser,}){
final _that = this;
switch (_that) {
case RegisterUser():
return registerUser(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RegisterUser value)?  registerUser,}){
final _that = this;
switch (_that) {
case RegisterUser() when registerUser != null:
return registerUser(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( RegistrationPayload payload)?  registerUser,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RegisterUser() when registerUser != null:
return registerUser(_that.payload);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( RegistrationPayload payload)  registerUser,}) {final _that = this;
switch (_that) {
case RegisterUser():
return registerUser(_that.payload);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( RegistrationPayload payload)?  registerUser,}) {final _that = this;
switch (_that) {
case RegisterUser() when registerUser != null:
return registerUser(_that.payload);case _:
  return null;

}
}

}

/// @nodoc


class RegisterUser implements RegistrationEvent {
  const RegisterUser({required this.payload});
  

@override final  RegistrationPayload payload;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterUserCopyWith<RegisterUser> get copyWith => _$RegisterUserCopyWithImpl<RegisterUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterUser&&(identical(other.payload, payload) || other.payload == payload));
}


@override
int get hashCode => Object.hash(runtimeType,payload);

@override
String toString() {
  return 'RegistrationEvent.registerUser(payload: $payload)';
}


}

/// @nodoc
abstract mixin class $RegisterUserCopyWith<$Res> implements $RegistrationEventCopyWith<$Res> {
  factory $RegisterUserCopyWith(RegisterUser value, $Res Function(RegisterUser) _then) = _$RegisterUserCopyWithImpl;
@override @useResult
$Res call({
 RegistrationPayload payload
});




}
/// @nodoc
class _$RegisterUserCopyWithImpl<$Res>
    implements $RegisterUserCopyWith<$Res> {
  _$RegisterUserCopyWithImpl(this._self, this._then);

  final RegisterUser _self;
  final $Res Function(RegisterUser) _then;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(RegisterUser(
payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as RegistrationPayload,
  ));
}


}

/// @nodoc
mixin _$RegistrationState {

 RegistrationOperType get operationType;
/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationStateCopyWith<RegistrationState> get copyWith => _$RegistrationStateCopyWithImpl<RegistrationState>(this as RegistrationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationState&&(identical(other.operationType, operationType) || other.operationType == operationType));
}


@override
int get hashCode => Object.hash(runtimeType,operationType);

@override
String toString() {
  return 'RegistrationState(operationType: $operationType)';
}


}

/// @nodoc
abstract mixin class $RegistrationStateCopyWith<$Res>  {
  factory $RegistrationStateCopyWith(RegistrationState value, $Res Function(RegistrationState) _then) = _$RegistrationStateCopyWithImpl;
@useResult
$Res call({
 RegistrationOperType operationType
});




}
/// @nodoc
class _$RegistrationStateCopyWithImpl<$Res>
    implements $RegistrationStateCopyWith<$Res> {
  _$RegistrationStateCopyWithImpl(this._self, this._then);

  final RegistrationState _self;
  final $Res Function(RegistrationState) _then;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? operationType = null,}) {
  return _then(_self.copyWith(
operationType: null == operationType ? _self.operationType : operationType // ignore: cast_nullable_to_non_nullable
as RegistrationOperType,
  ));
}

}


/// Adds pattern-matching-related methods to [RegistrationState].
extension RegistrationStatePatterns on RegistrationState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RegistrationInitialState value)?  initial,TResult Function( RegistrationInProgress value)?  inProgress,TResult Function( RegistrationStepSuccess value)?  stepSuccess,TResult Function( RegistrationError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RegistrationInitialState() when initial != null:
return initial(_that);case RegistrationInProgress() when inProgress != null:
return inProgress(_that);case RegistrationStepSuccess() when stepSuccess != null:
return stepSuccess(_that);case RegistrationError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RegistrationInitialState value)  initial,required TResult Function( RegistrationInProgress value)  inProgress,required TResult Function( RegistrationStepSuccess value)  stepSuccess,required TResult Function( RegistrationError value)  error,}){
final _that = this;
switch (_that) {
case RegistrationInitialState():
return initial(_that);case RegistrationInProgress():
return inProgress(_that);case RegistrationStepSuccess():
return stepSuccess(_that);case RegistrationError():
return error(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RegistrationInitialState value)?  initial,TResult? Function( RegistrationInProgress value)?  inProgress,TResult? Function( RegistrationStepSuccess value)?  stepSuccess,TResult? Function( RegistrationError value)?  error,}){
final _that = this;
switch (_that) {
case RegistrationInitialState() when initial != null:
return initial(_that);case RegistrationInProgress() when inProgress != null:
return inProgress(_that);case RegistrationStepSuccess() when stepSuccess != null:
return stepSuccess(_that);case RegistrationError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( RegistrationOperType operationType)?  initial,TResult Function( RegistrationOperType operationType)?  inProgress,TResult Function( RegistrationOperType operationType,  String? data)?  stepSuccess,TResult Function( RegistrationOperType operationType,  String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RegistrationInitialState() when initial != null:
return initial(_that.operationType);case RegistrationInProgress() when inProgress != null:
return inProgress(_that.operationType);case RegistrationStepSuccess() when stepSuccess != null:
return stepSuccess(_that.operationType,_that.data);case RegistrationError() when error != null:
return error(_that.operationType,_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( RegistrationOperType operationType)  initial,required TResult Function( RegistrationOperType operationType)  inProgress,required TResult Function( RegistrationOperType operationType,  String? data)  stepSuccess,required TResult Function( RegistrationOperType operationType,  String message)  error,}) {final _that = this;
switch (_that) {
case RegistrationInitialState():
return initial(_that.operationType);case RegistrationInProgress():
return inProgress(_that.operationType);case RegistrationStepSuccess():
return stepSuccess(_that.operationType,_that.data);case RegistrationError():
return error(_that.operationType,_that.message);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( RegistrationOperType operationType)?  initial,TResult? Function( RegistrationOperType operationType)?  inProgress,TResult? Function( RegistrationOperType operationType,  String? data)?  stepSuccess,TResult? Function( RegistrationOperType operationType,  String message)?  error,}) {final _that = this;
switch (_that) {
case RegistrationInitialState() when initial != null:
return initial(_that.operationType);case RegistrationInProgress() when inProgress != null:
return inProgress(_that.operationType);case RegistrationStepSuccess() when stepSuccess != null:
return stepSuccess(_that.operationType,_that.data);case RegistrationError() when error != null:
return error(_that.operationType,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class RegistrationInitialState implements RegistrationState {
  const RegistrationInitialState({this.operationType = RegistrationOperType.reqComplete});
  

@override@JsonKey() final  RegistrationOperType operationType;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationInitialStateCopyWith<RegistrationInitialState> get copyWith => _$RegistrationInitialStateCopyWithImpl<RegistrationInitialState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationInitialState&&(identical(other.operationType, operationType) || other.operationType == operationType));
}


@override
int get hashCode => Object.hash(runtimeType,operationType);

@override
String toString() {
  return 'RegistrationState.initial(operationType: $operationType)';
}


}

/// @nodoc
abstract mixin class $RegistrationInitialStateCopyWith<$Res> implements $RegistrationStateCopyWith<$Res> {
  factory $RegistrationInitialStateCopyWith(RegistrationInitialState value, $Res Function(RegistrationInitialState) _then) = _$RegistrationInitialStateCopyWithImpl;
@override @useResult
$Res call({
 RegistrationOperType operationType
});




}
/// @nodoc
class _$RegistrationInitialStateCopyWithImpl<$Res>
    implements $RegistrationInitialStateCopyWith<$Res> {
  _$RegistrationInitialStateCopyWithImpl(this._self, this._then);

  final RegistrationInitialState _self;
  final $Res Function(RegistrationInitialState) _then;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? operationType = null,}) {
  return _then(RegistrationInitialState(
operationType: null == operationType ? _self.operationType : operationType // ignore: cast_nullable_to_non_nullable
as RegistrationOperType,
  ));
}


}

/// @nodoc


class RegistrationInProgress implements RegistrationState {
  const RegistrationInProgress({required this.operationType});
  

@override final  RegistrationOperType operationType;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationInProgressCopyWith<RegistrationInProgress> get copyWith => _$RegistrationInProgressCopyWithImpl<RegistrationInProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationInProgress&&(identical(other.operationType, operationType) || other.operationType == operationType));
}


@override
int get hashCode => Object.hash(runtimeType,operationType);

@override
String toString() {
  return 'RegistrationState.inProgress(operationType: $operationType)';
}


}

/// @nodoc
abstract mixin class $RegistrationInProgressCopyWith<$Res> implements $RegistrationStateCopyWith<$Res> {
  factory $RegistrationInProgressCopyWith(RegistrationInProgress value, $Res Function(RegistrationInProgress) _then) = _$RegistrationInProgressCopyWithImpl;
@override @useResult
$Res call({
 RegistrationOperType operationType
});




}
/// @nodoc
class _$RegistrationInProgressCopyWithImpl<$Res>
    implements $RegistrationInProgressCopyWith<$Res> {
  _$RegistrationInProgressCopyWithImpl(this._self, this._then);

  final RegistrationInProgress _self;
  final $Res Function(RegistrationInProgress) _then;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? operationType = null,}) {
  return _then(RegistrationInProgress(
operationType: null == operationType ? _self.operationType : operationType // ignore: cast_nullable_to_non_nullable
as RegistrationOperType,
  ));
}


}

/// @nodoc


class RegistrationStepSuccess implements RegistrationState {
  const RegistrationStepSuccess({required this.operationType, this.data});
  

@override final  RegistrationOperType operationType;
 final  String? data;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationStepSuccessCopyWith<RegistrationStepSuccess> get copyWith => _$RegistrationStepSuccessCopyWithImpl<RegistrationStepSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationStepSuccess&&(identical(other.operationType, operationType) || other.operationType == operationType)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,operationType,data);

@override
String toString() {
  return 'RegistrationState.stepSuccess(operationType: $operationType, data: $data)';
}


}

/// @nodoc
abstract mixin class $RegistrationStepSuccessCopyWith<$Res> implements $RegistrationStateCopyWith<$Res> {
  factory $RegistrationStepSuccessCopyWith(RegistrationStepSuccess value, $Res Function(RegistrationStepSuccess) _then) = _$RegistrationStepSuccessCopyWithImpl;
@override @useResult
$Res call({
 RegistrationOperType operationType, String? data
});




}
/// @nodoc
class _$RegistrationStepSuccessCopyWithImpl<$Res>
    implements $RegistrationStepSuccessCopyWith<$Res> {
  _$RegistrationStepSuccessCopyWithImpl(this._self, this._then);

  final RegistrationStepSuccess _self;
  final $Res Function(RegistrationStepSuccess) _then;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? operationType = null,Object? data = freezed,}) {
  return _then(RegistrationStepSuccess(
operationType: null == operationType ? _self.operationType : operationType // ignore: cast_nullable_to_non_nullable
as RegistrationOperType,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class RegistrationError implements RegistrationState {
  const RegistrationError({required this.operationType, required this.message});
  

@override final  RegistrationOperType operationType;
 final  String message;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationErrorCopyWith<RegistrationError> get copyWith => _$RegistrationErrorCopyWithImpl<RegistrationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationError&&(identical(other.operationType, operationType) || other.operationType == operationType)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,operationType,message);

@override
String toString() {
  return 'RegistrationState.error(operationType: $operationType, message: $message)';
}


}

/// @nodoc
abstract mixin class $RegistrationErrorCopyWith<$Res> implements $RegistrationStateCopyWith<$Res> {
  factory $RegistrationErrorCopyWith(RegistrationError value, $Res Function(RegistrationError) _then) = _$RegistrationErrorCopyWithImpl;
@override @useResult
$Res call({
 RegistrationOperType operationType, String message
});




}
/// @nodoc
class _$RegistrationErrorCopyWithImpl<$Res>
    implements $RegistrationErrorCopyWith<$Res> {
  _$RegistrationErrorCopyWithImpl(this._self, this._then);

  final RegistrationError _self;
  final $Res Function(RegistrationError) _then;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? operationType = null,Object? message = null,}) {
  return _then(RegistrationError(
operationType: null == operationType ? _self.operationType : operationType // ignore: cast_nullable_to_non_nullable
as RegistrationOperType,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
