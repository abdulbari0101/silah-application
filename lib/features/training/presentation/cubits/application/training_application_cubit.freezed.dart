// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_application_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainingApplicationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingApplicationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainingApplicationState()';
}


}

/// @nodoc
class $TrainingApplicationStateCopyWith<$Res>  {
$TrainingApplicationStateCopyWith(TrainingApplicationState _, $Res Function(TrainingApplicationState) __);
}


/// Adds pattern-matching-related methods to [TrainingApplicationState].
extension TrainingApplicationStatePatterns on TrainingApplicationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TrainingApplicationIdle value)?  idle,TResult Function( _TrainingApplicationSubmitting value)?  submitting,TResult Function( _TrainingApplicationSuccess value)?  success,TResult Function( _TrainingApplicationFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingApplicationIdle() when idle != null:
return idle(_that);case _TrainingApplicationSubmitting() when submitting != null:
return submitting(_that);case _TrainingApplicationSuccess() when success != null:
return success(_that);case _TrainingApplicationFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TrainingApplicationIdle value)  idle,required TResult Function( _TrainingApplicationSubmitting value)  submitting,required TResult Function( _TrainingApplicationSuccess value)  success,required TResult Function( _TrainingApplicationFailure value)  failure,}){
final _that = this;
switch (_that) {
case _TrainingApplicationIdle():
return idle(_that);case _TrainingApplicationSubmitting():
return submitting(_that);case _TrainingApplicationSuccess():
return success(_that);case _TrainingApplicationFailure():
return failure(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TrainingApplicationIdle value)?  idle,TResult? Function( _TrainingApplicationSubmitting value)?  submitting,TResult? Function( _TrainingApplicationSuccess value)?  success,TResult? Function( _TrainingApplicationFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _TrainingApplicationIdle() when idle != null:
return idle(_that);case _TrainingApplicationSubmitting() when submitting != null:
return submitting(_that);case _TrainingApplicationSuccess() when success != null:
return success(_that);case _TrainingApplicationFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  submitting,TResult Function( TrainingApplicationEntity application)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingApplicationIdle() when idle != null:
return idle();case _TrainingApplicationSubmitting() when submitting != null:
return submitting();case _TrainingApplicationSuccess() when success != null:
return success(_that.application);case _TrainingApplicationFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  submitting,required TResult Function( TrainingApplicationEntity application)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _TrainingApplicationIdle():
return idle();case _TrainingApplicationSubmitting():
return submitting();case _TrainingApplicationSuccess():
return success(_that.application);case _TrainingApplicationFailure():
return failure(_that.message);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  submitting,TResult? Function( TrainingApplicationEntity application)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _TrainingApplicationIdle() when idle != null:
return idle();case _TrainingApplicationSubmitting() when submitting != null:
return submitting();case _TrainingApplicationSuccess() when success != null:
return success(_that.application);case _TrainingApplicationFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _TrainingApplicationIdle implements TrainingApplicationState {
  const _TrainingApplicationIdle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingApplicationIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainingApplicationState.idle()';
}


}




/// @nodoc


class _TrainingApplicationSubmitting implements TrainingApplicationState {
  const _TrainingApplicationSubmitting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingApplicationSubmitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainingApplicationState.submitting()';
}


}




/// @nodoc


class _TrainingApplicationSuccess implements TrainingApplicationState {
  const _TrainingApplicationSuccess({required this.application});
  

 final  TrainingApplicationEntity application;

/// Create a copy of TrainingApplicationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingApplicationSuccessCopyWith<_TrainingApplicationSuccess> get copyWith => __$TrainingApplicationSuccessCopyWithImpl<_TrainingApplicationSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingApplicationSuccess&&(identical(other.application, application) || other.application == application));
}


@override
int get hashCode => Object.hash(runtimeType,application);

@override
String toString() {
  return 'TrainingApplicationState.success(application: $application)';
}


}

/// @nodoc
abstract mixin class _$TrainingApplicationSuccessCopyWith<$Res> implements $TrainingApplicationStateCopyWith<$Res> {
  factory _$TrainingApplicationSuccessCopyWith(_TrainingApplicationSuccess value, $Res Function(_TrainingApplicationSuccess) _then) = __$TrainingApplicationSuccessCopyWithImpl;
@useResult
$Res call({
 TrainingApplicationEntity application
});




}
/// @nodoc
class __$TrainingApplicationSuccessCopyWithImpl<$Res>
    implements _$TrainingApplicationSuccessCopyWith<$Res> {
  __$TrainingApplicationSuccessCopyWithImpl(this._self, this._then);

  final _TrainingApplicationSuccess _self;
  final $Res Function(_TrainingApplicationSuccess) _then;

/// Create a copy of TrainingApplicationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? application = null,}) {
  return _then(_TrainingApplicationSuccess(
application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as TrainingApplicationEntity,
  ));
}


}

/// @nodoc


class _TrainingApplicationFailure implements TrainingApplicationState {
  const _TrainingApplicationFailure({required this.message});
  

 final  String message;

/// Create a copy of TrainingApplicationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingApplicationFailureCopyWith<_TrainingApplicationFailure> get copyWith => __$TrainingApplicationFailureCopyWithImpl<_TrainingApplicationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingApplicationFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TrainingApplicationState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$TrainingApplicationFailureCopyWith<$Res> implements $TrainingApplicationStateCopyWith<$Res> {
  factory _$TrainingApplicationFailureCopyWith(_TrainingApplicationFailure value, $Res Function(_TrainingApplicationFailure) _then) = __$TrainingApplicationFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$TrainingApplicationFailureCopyWithImpl<$Res>
    implements _$TrainingApplicationFailureCopyWith<$Res> {
  __$TrainingApplicationFailureCopyWithImpl(this._self, this._then);

  final _TrainingApplicationFailure _self;
  final $Res Function(_TrainingApplicationFailure) _then;

/// Create a copy of TrainingApplicationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_TrainingApplicationFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
