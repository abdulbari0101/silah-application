// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_request_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerificationRequestState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationRequestState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerificationRequestState()';
}


}

/// @nodoc
class $VerificationRequestStateCopyWith<$Res>  {
$VerificationRequestStateCopyWith(VerificationRequestState _, $Res Function(VerificationRequestState) __);
}


/// Adds pattern-matching-related methods to [VerificationRequestState].
extension VerificationRequestStatePatterns on VerificationRequestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _VerificationRequestInitial value)?  initial,TResult Function( _VerificationRequestSubmitting value)?  submitting,TResult Function( _VerificationRequestSuccess value)?  success,TResult Function( _VerificationRequestFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerificationRequestInitial() when initial != null:
return initial(_that);case _VerificationRequestSubmitting() when submitting != null:
return submitting(_that);case _VerificationRequestSuccess() when success != null:
return success(_that);case _VerificationRequestFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _VerificationRequestInitial value)  initial,required TResult Function( _VerificationRequestSubmitting value)  submitting,required TResult Function( _VerificationRequestSuccess value)  success,required TResult Function( _VerificationRequestFailure value)  failure,}){
final _that = this;
switch (_that) {
case _VerificationRequestInitial():
return initial(_that);case _VerificationRequestSubmitting():
return submitting(_that);case _VerificationRequestSuccess():
return success(_that);case _VerificationRequestFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _VerificationRequestInitial value)?  initial,TResult? Function( _VerificationRequestSubmitting value)?  submitting,TResult? Function( _VerificationRequestSuccess value)?  success,TResult? Function( _VerificationRequestFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _VerificationRequestInitial() when initial != null:
return initial(_that);case _VerificationRequestSubmitting() when submitting != null:
return submitting(_that);case _VerificationRequestSuccess() when success != null:
return success(_that);case _VerificationRequestFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  submitting,TResult Function( LicenseVerificationEntity verification)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerificationRequestInitial() when initial != null:
return initial();case _VerificationRequestSubmitting() when submitting != null:
return submitting();case _VerificationRequestSuccess() when success != null:
return success(_that.verification);case _VerificationRequestFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  submitting,required TResult Function( LicenseVerificationEntity verification)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _VerificationRequestInitial():
return initial();case _VerificationRequestSubmitting():
return submitting();case _VerificationRequestSuccess():
return success(_that.verification);case _VerificationRequestFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  submitting,TResult? Function( LicenseVerificationEntity verification)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _VerificationRequestInitial() when initial != null:
return initial();case _VerificationRequestSubmitting() when submitting != null:
return submitting();case _VerificationRequestSuccess() when success != null:
return success(_that.verification);case _VerificationRequestFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _VerificationRequestInitial implements VerificationRequestState {
  const _VerificationRequestInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationRequestInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerificationRequestState.initial()';
}


}




/// @nodoc


class _VerificationRequestSubmitting implements VerificationRequestState {
  const _VerificationRequestSubmitting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationRequestSubmitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerificationRequestState.submitting()';
}


}




/// @nodoc


class _VerificationRequestSuccess implements VerificationRequestState {
  const _VerificationRequestSuccess({required this.verification});
  

 final  LicenseVerificationEntity verification;

/// Create a copy of VerificationRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerificationRequestSuccessCopyWith<_VerificationRequestSuccess> get copyWith => __$VerificationRequestSuccessCopyWithImpl<_VerificationRequestSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationRequestSuccess&&(identical(other.verification, verification) || other.verification == verification));
}


@override
int get hashCode => Object.hash(runtimeType,verification);

@override
String toString() {
  return 'VerificationRequestState.success(verification: $verification)';
}


}

/// @nodoc
abstract mixin class _$VerificationRequestSuccessCopyWith<$Res> implements $VerificationRequestStateCopyWith<$Res> {
  factory _$VerificationRequestSuccessCopyWith(_VerificationRequestSuccess value, $Res Function(_VerificationRequestSuccess) _then) = __$VerificationRequestSuccessCopyWithImpl;
@useResult
$Res call({
 LicenseVerificationEntity verification
});




}
/// @nodoc
class __$VerificationRequestSuccessCopyWithImpl<$Res>
    implements _$VerificationRequestSuccessCopyWith<$Res> {
  __$VerificationRequestSuccessCopyWithImpl(this._self, this._then);

  final _VerificationRequestSuccess _self;
  final $Res Function(_VerificationRequestSuccess) _then;

/// Create a copy of VerificationRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? verification = null,}) {
  return _then(_VerificationRequestSuccess(
verification: null == verification ? _self.verification : verification // ignore: cast_nullable_to_non_nullable
as LicenseVerificationEntity,
  ));
}


}

/// @nodoc


class _VerificationRequestFailure implements VerificationRequestState {
  const _VerificationRequestFailure({required this.message});
  

 final  String message;

/// Create a copy of VerificationRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerificationRequestFailureCopyWith<_VerificationRequestFailure> get copyWith => __$VerificationRequestFailureCopyWithImpl<_VerificationRequestFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationRequestFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VerificationRequestState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$VerificationRequestFailureCopyWith<$Res> implements $VerificationRequestStateCopyWith<$Res> {
  factory _$VerificationRequestFailureCopyWith(_VerificationRequestFailure value, $Res Function(_VerificationRequestFailure) _then) = __$VerificationRequestFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$VerificationRequestFailureCopyWithImpl<$Res>
    implements _$VerificationRequestFailureCopyWith<$Res> {
  __$VerificationRequestFailureCopyWithImpl(this._self, this._then);

  final _VerificationRequestFailure _self;
  final $Res Function(_VerificationRequestFailure) _then;

/// Create a copy of VerificationRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_VerificationRequestFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
