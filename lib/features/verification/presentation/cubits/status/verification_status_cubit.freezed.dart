// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_status_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerificationStatusState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationStatusState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerificationStatusState()';
}


}

/// @nodoc
class $VerificationStatusStateCopyWith<$Res>  {
$VerificationStatusStateCopyWith(VerificationStatusState _, $Res Function(VerificationStatusState) __);
}


/// Adds pattern-matching-related methods to [VerificationStatusState].
extension VerificationStatusStatePatterns on VerificationStatusState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _VerificationStatusLoading value)?  loading,TResult Function( _VerificationStatusReady value)?  ready,TResult Function( _VerificationStatusFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerificationStatusLoading() when loading != null:
return loading(_that);case _VerificationStatusReady() when ready != null:
return ready(_that);case _VerificationStatusFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _VerificationStatusLoading value)  loading,required TResult Function( _VerificationStatusReady value)  ready,required TResult Function( _VerificationStatusFailure value)  failure,}){
final _that = this;
switch (_that) {
case _VerificationStatusLoading():
return loading(_that);case _VerificationStatusReady():
return ready(_that);case _VerificationStatusFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _VerificationStatusLoading value)?  loading,TResult? Function( _VerificationStatusReady value)?  ready,TResult? Function( _VerificationStatusFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _VerificationStatusLoading() when loading != null:
return loading(_that);case _VerificationStatusReady() when ready != null:
return ready(_that);case _VerificationStatusFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( LicenseVerificationEntity verification,  bool isUnverified)?  ready,TResult Function( String message,  LicenseVerificationEntity? verification)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerificationStatusLoading() when loading != null:
return loading();case _VerificationStatusReady() when ready != null:
return ready(_that.verification,_that.isUnverified);case _VerificationStatusFailure() when failure != null:
return failure(_that.message,_that.verification);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( LicenseVerificationEntity verification,  bool isUnverified)  ready,required TResult Function( String message,  LicenseVerificationEntity? verification)  failure,}) {final _that = this;
switch (_that) {
case _VerificationStatusLoading():
return loading();case _VerificationStatusReady():
return ready(_that.verification,_that.isUnverified);case _VerificationStatusFailure():
return failure(_that.message,_that.verification);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( LicenseVerificationEntity verification,  bool isUnverified)?  ready,TResult? Function( String message,  LicenseVerificationEntity? verification)?  failure,}) {final _that = this;
switch (_that) {
case _VerificationStatusLoading() when loading != null:
return loading();case _VerificationStatusReady() when ready != null:
return ready(_that.verification,_that.isUnverified);case _VerificationStatusFailure() when failure != null:
return failure(_that.message,_that.verification);case _:
  return null;

}
}

}

/// @nodoc


class _VerificationStatusLoading implements VerificationStatusState {
  const _VerificationStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerificationStatusState.loading()';
}


}




/// @nodoc


class _VerificationStatusReady implements VerificationStatusState {
  const _VerificationStatusReady({required this.verification, required this.isUnverified});
  

 final  LicenseVerificationEntity verification;
 final  bool isUnverified;

/// Create a copy of VerificationStatusState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerificationStatusReadyCopyWith<_VerificationStatusReady> get copyWith => __$VerificationStatusReadyCopyWithImpl<_VerificationStatusReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationStatusReady&&(identical(other.verification, verification) || other.verification == verification)&&(identical(other.isUnverified, isUnverified) || other.isUnverified == isUnverified));
}


@override
int get hashCode => Object.hash(runtimeType,verification,isUnverified);

@override
String toString() {
  return 'VerificationStatusState.ready(verification: $verification, isUnverified: $isUnverified)';
}


}

/// @nodoc
abstract mixin class _$VerificationStatusReadyCopyWith<$Res> implements $VerificationStatusStateCopyWith<$Res> {
  factory _$VerificationStatusReadyCopyWith(_VerificationStatusReady value, $Res Function(_VerificationStatusReady) _then) = __$VerificationStatusReadyCopyWithImpl;
@useResult
$Res call({
 LicenseVerificationEntity verification, bool isUnverified
});




}
/// @nodoc
class __$VerificationStatusReadyCopyWithImpl<$Res>
    implements _$VerificationStatusReadyCopyWith<$Res> {
  __$VerificationStatusReadyCopyWithImpl(this._self, this._then);

  final _VerificationStatusReady _self;
  final $Res Function(_VerificationStatusReady) _then;

/// Create a copy of VerificationStatusState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? verification = null,Object? isUnverified = null,}) {
  return _then(_VerificationStatusReady(
verification: null == verification ? _self.verification : verification // ignore: cast_nullable_to_non_nullable
as LicenseVerificationEntity,isUnverified: null == isUnverified ? _self.isUnverified : isUnverified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _VerificationStatusFailure implements VerificationStatusState {
  const _VerificationStatusFailure({required this.message, this.verification});
  

 final  String message;
 final  LicenseVerificationEntity? verification;

/// Create a copy of VerificationStatusState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerificationStatusFailureCopyWith<_VerificationStatusFailure> get copyWith => __$VerificationStatusFailureCopyWithImpl<_VerificationStatusFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationStatusFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.verification, verification) || other.verification == verification));
}


@override
int get hashCode => Object.hash(runtimeType,message,verification);

@override
String toString() {
  return 'VerificationStatusState.failure(message: $message, verification: $verification)';
}


}

/// @nodoc
abstract mixin class _$VerificationStatusFailureCopyWith<$Res> implements $VerificationStatusStateCopyWith<$Res> {
  factory _$VerificationStatusFailureCopyWith(_VerificationStatusFailure value, $Res Function(_VerificationStatusFailure) _then) = __$VerificationStatusFailureCopyWithImpl;
@useResult
$Res call({
 String message, LicenseVerificationEntity? verification
});




}
/// @nodoc
class __$VerificationStatusFailureCopyWithImpl<$Res>
    implements _$VerificationStatusFailureCopyWith<$Res> {
  __$VerificationStatusFailureCopyWithImpl(this._self, this._then);

  final _VerificationStatusFailure _self;
  final $Res Function(_VerificationStatusFailure) _then;

/// Create a copy of VerificationStatusState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? verification = freezed,}) {
  return _then(_VerificationStatusFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,verification: freezed == verification ? _self.verification : verification // ignore: cast_nullable_to_non_nullable
as LicenseVerificationEntity?,
  ));
}


}

// dart format on
