// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgotPasswordState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState()';
}


}

/// @nodoc
class $ForgotPasswordStateCopyWith<$Res>  {
$ForgotPasswordStateCopyWith(ForgotPasswordState _, $Res Function(ForgotPasswordState) __);
}


/// Adds pattern-matching-related methods to [ForgotPasswordState].
extension ForgotPasswordStatePatterns on ForgotPasswordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ForgotPasswordInitial value)?  initial,TResult Function( _ForgotPasswordSubmitting value)?  submitting,TResult Function( _ForgotPasswordSuccess value)?  success,TResult Function( _ForgotPasswordFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForgotPasswordInitial() when initial != null:
return initial(_that);case _ForgotPasswordSubmitting() when submitting != null:
return submitting(_that);case _ForgotPasswordSuccess() when success != null:
return success(_that);case _ForgotPasswordFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ForgotPasswordInitial value)  initial,required TResult Function( _ForgotPasswordSubmitting value)  submitting,required TResult Function( _ForgotPasswordSuccess value)  success,required TResult Function( _ForgotPasswordFailure value)  failure,}){
final _that = this;
switch (_that) {
case _ForgotPasswordInitial():
return initial(_that);case _ForgotPasswordSubmitting():
return submitting(_that);case _ForgotPasswordSuccess():
return success(_that);case _ForgotPasswordFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ForgotPasswordInitial value)?  initial,TResult? Function( _ForgotPasswordSubmitting value)?  submitting,TResult? Function( _ForgotPasswordSuccess value)?  success,TResult? Function( _ForgotPasswordFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _ForgotPasswordInitial() when initial != null:
return initial(_that);case _ForgotPasswordSubmitting() when submitting != null:
return submitting(_that);case _ForgotPasswordSuccess() when success != null:
return success(_that);case _ForgotPasswordFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  submitting,TResult Function()?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForgotPasswordInitial() when initial != null:
return initial();case _ForgotPasswordSubmitting() when submitting != null:
return submitting();case _ForgotPasswordSuccess() when success != null:
return success();case _ForgotPasswordFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  submitting,required TResult Function()  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _ForgotPasswordInitial():
return initial();case _ForgotPasswordSubmitting():
return submitting();case _ForgotPasswordSuccess():
return success();case _ForgotPasswordFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  submitting,TResult? Function()?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _ForgotPasswordInitial() when initial != null:
return initial();case _ForgotPasswordSubmitting() when submitting != null:
return submitting();case _ForgotPasswordSuccess() when success != null:
return success();case _ForgotPasswordFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _ForgotPasswordInitial implements ForgotPasswordState {
  const _ForgotPasswordInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgotPasswordInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState.initial()';
}


}




/// @nodoc


class _ForgotPasswordSubmitting implements ForgotPasswordState {
  const _ForgotPasswordSubmitting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgotPasswordSubmitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState.submitting()';
}


}




/// @nodoc


class _ForgotPasswordSuccess implements ForgotPasswordState {
  const _ForgotPasswordSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgotPasswordSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState.success()';
}


}




/// @nodoc


class _ForgotPasswordFailure implements ForgotPasswordState {
  const _ForgotPasswordFailure({required this.message});
  

 final  String message;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForgotPasswordFailureCopyWith<_ForgotPasswordFailure> get copyWith => __$ForgotPasswordFailureCopyWithImpl<_ForgotPasswordFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgotPasswordFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ForgotPasswordState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ForgotPasswordFailureCopyWith<$Res> implements $ForgotPasswordStateCopyWith<$Res> {
  factory _$ForgotPasswordFailureCopyWith(_ForgotPasswordFailure value, $Res Function(_ForgotPasswordFailure) _then) = __$ForgotPasswordFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ForgotPasswordFailureCopyWithImpl<$Res>
    implements _$ForgotPasswordFailureCopyWith<$Res> {
  __$ForgotPasswordFailureCopyWithImpl(this._self, this._then);

  final _ForgotPasswordFailure _self;
  final $Res Function(_ForgotPasswordFailure) _then;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ForgotPasswordFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
