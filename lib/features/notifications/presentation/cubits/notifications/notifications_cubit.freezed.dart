// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsState()';
}


}

/// @nodoc
class $NotificationsStateCopyWith<$Res>  {
$NotificationsStateCopyWith(NotificationsState _, $Res Function(NotificationsState) __);
}


/// Adds pattern-matching-related methods to [NotificationsState].
extension NotificationsStatePatterns on NotificationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NotificationsLoading value)?  loading,TResult Function( _NotificationsEmpty value)?  empty,TResult Function( _NotificationsReady value)?  ready,TResult Function( _NotificationsFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationsLoading() when loading != null:
return loading(_that);case _NotificationsEmpty() when empty != null:
return empty(_that);case _NotificationsReady() when ready != null:
return ready(_that);case _NotificationsFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NotificationsLoading value)  loading,required TResult Function( _NotificationsEmpty value)  empty,required TResult Function( _NotificationsReady value)  ready,required TResult Function( _NotificationsFailure value)  failure,}){
final _that = this;
switch (_that) {
case _NotificationsLoading():
return loading(_that);case _NotificationsEmpty():
return empty(_that);case _NotificationsReady():
return ready(_that);case _NotificationsFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NotificationsLoading value)?  loading,TResult? Function( _NotificationsEmpty value)?  empty,TResult? Function( _NotificationsReady value)?  ready,TResult? Function( _NotificationsFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _NotificationsLoading() when loading != null:
return loading(_that);case _NotificationsEmpty() when empty != null:
return empty(_that);case _NotificationsReady() when ready != null:
return ready(_that);case _NotificationsFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function()?  empty,TResult Function( NotificationResult result)?  ready,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationsLoading() when loading != null:
return loading();case _NotificationsEmpty() when empty != null:
return empty();case _NotificationsReady() when ready != null:
return ready(_that.result);case _NotificationsFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function()  empty,required TResult Function( NotificationResult result)  ready,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _NotificationsLoading():
return loading();case _NotificationsEmpty():
return empty();case _NotificationsReady():
return ready(_that.result);case _NotificationsFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function()?  empty,TResult? Function( NotificationResult result)?  ready,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _NotificationsLoading() when loading != null:
return loading();case _NotificationsEmpty() when empty != null:
return empty();case _NotificationsReady() when ready != null:
return ready(_that.result);case _NotificationsFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationsLoading implements NotificationsState {
  const _NotificationsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsState.loading()';
}


}




/// @nodoc


class _NotificationsEmpty implements NotificationsState {
  const _NotificationsEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationsEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsState.empty()';
}


}




/// @nodoc


class _NotificationsReady implements NotificationsState {
  const _NotificationsReady({required this.result});
  

 final  NotificationResult result;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationsReadyCopyWith<_NotificationsReady> get copyWith => __$NotificationsReadyCopyWithImpl<_NotificationsReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationsReady&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,result);

@override
String toString() {
  return 'NotificationsState.ready(result: $result)';
}


}

/// @nodoc
abstract mixin class _$NotificationsReadyCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$NotificationsReadyCopyWith(_NotificationsReady value, $Res Function(_NotificationsReady) _then) = __$NotificationsReadyCopyWithImpl;
@useResult
$Res call({
 NotificationResult result
});




}
/// @nodoc
class __$NotificationsReadyCopyWithImpl<$Res>
    implements _$NotificationsReadyCopyWith<$Res> {
  __$NotificationsReadyCopyWithImpl(this._self, this._then);

  final _NotificationsReady _self;
  final $Res Function(_NotificationsReady) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? result = null,}) {
  return _then(_NotificationsReady(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as NotificationResult,
  ));
}


}

/// @nodoc


class _NotificationsFailure implements NotificationsState {
  const _NotificationsFailure({required this.message});
  

 final  String message;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationsFailureCopyWith<_NotificationsFailure> get copyWith => __$NotificationsFailureCopyWithImpl<_NotificationsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationsFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'NotificationsState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$NotificationsFailureCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$NotificationsFailureCopyWith(_NotificationsFailure value, $Res Function(_NotificationsFailure) _then) = __$NotificationsFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$NotificationsFailureCopyWithImpl<$Res>
    implements _$NotificationsFailureCopyWith<$Res> {
  __$NotificationsFailureCopyWithImpl(this._self, this._then);

  final _NotificationsFailure _self;
  final $Res Function(_NotificationsFailure) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_NotificationsFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
