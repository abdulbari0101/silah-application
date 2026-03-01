// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_request_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConsultationRequestState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsultationRequestState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConsultationRequestState()';
}


}

/// @nodoc
class $ConsultationRequestStateCopyWith<$Res>  {
$ConsultationRequestStateCopyWith(ConsultationRequestState _, $Res Function(ConsultationRequestState) __);
}


/// Adds pattern-matching-related methods to [ConsultationRequestState].
extension ConsultationRequestStatePatterns on ConsultationRequestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ConsultationRequestIdle value)?  idle,TResult Function( _ConsultationRequestSubmitting value)?  submitting,TResult Function( _ConsultationRequestSuccess value)?  success,TResult Function( _ConsultationRequestFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsultationRequestIdle() when idle != null:
return idle(_that);case _ConsultationRequestSubmitting() when submitting != null:
return submitting(_that);case _ConsultationRequestSuccess() when success != null:
return success(_that);case _ConsultationRequestFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ConsultationRequestIdle value)  idle,required TResult Function( _ConsultationRequestSubmitting value)  submitting,required TResult Function( _ConsultationRequestSuccess value)  success,required TResult Function( _ConsultationRequestFailure value)  failure,}){
final _that = this;
switch (_that) {
case _ConsultationRequestIdle():
return idle(_that);case _ConsultationRequestSubmitting():
return submitting(_that);case _ConsultationRequestSuccess():
return success(_that);case _ConsultationRequestFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ConsultationRequestIdle value)?  idle,TResult? Function( _ConsultationRequestSubmitting value)?  submitting,TResult? Function( _ConsultationRequestSuccess value)?  success,TResult? Function( _ConsultationRequestFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _ConsultationRequestIdle() when idle != null:
return idle(_that);case _ConsultationRequestSubmitting() when submitting != null:
return submitting(_that);case _ConsultationRequestSuccess() when success != null:
return success(_that);case _ConsultationRequestFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  submitting,TResult Function( ConsultationRequestEntity request)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsultationRequestIdle() when idle != null:
return idle();case _ConsultationRequestSubmitting() when submitting != null:
return submitting();case _ConsultationRequestSuccess() when success != null:
return success(_that.request);case _ConsultationRequestFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  submitting,required TResult Function( ConsultationRequestEntity request)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _ConsultationRequestIdle():
return idle();case _ConsultationRequestSubmitting():
return submitting();case _ConsultationRequestSuccess():
return success(_that.request);case _ConsultationRequestFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  submitting,TResult? Function( ConsultationRequestEntity request)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _ConsultationRequestIdle() when idle != null:
return idle();case _ConsultationRequestSubmitting() when submitting != null:
return submitting();case _ConsultationRequestSuccess() when success != null:
return success(_that.request);case _ConsultationRequestFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _ConsultationRequestIdle implements ConsultationRequestState {
  const _ConsultationRequestIdle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationRequestIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConsultationRequestState.idle()';
}


}




/// @nodoc


class _ConsultationRequestSubmitting implements ConsultationRequestState {
  const _ConsultationRequestSubmitting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationRequestSubmitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConsultationRequestState.submitting()';
}


}




/// @nodoc


class _ConsultationRequestSuccess implements ConsultationRequestState {
  const _ConsultationRequestSuccess({required this.request});
  

 final  ConsultationRequestEntity request;

/// Create a copy of ConsultationRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationRequestSuccessCopyWith<_ConsultationRequestSuccess> get copyWith => __$ConsultationRequestSuccessCopyWithImpl<_ConsultationRequestSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationRequestSuccess&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,request);

@override
String toString() {
  return 'ConsultationRequestState.success(request: $request)';
}


}

/// @nodoc
abstract mixin class _$ConsultationRequestSuccessCopyWith<$Res> implements $ConsultationRequestStateCopyWith<$Res> {
  factory _$ConsultationRequestSuccessCopyWith(_ConsultationRequestSuccess value, $Res Function(_ConsultationRequestSuccess) _then) = __$ConsultationRequestSuccessCopyWithImpl;
@useResult
$Res call({
 ConsultationRequestEntity request
});




}
/// @nodoc
class __$ConsultationRequestSuccessCopyWithImpl<$Res>
    implements _$ConsultationRequestSuccessCopyWith<$Res> {
  __$ConsultationRequestSuccessCopyWithImpl(this._self, this._then);

  final _ConsultationRequestSuccess _self;
  final $Res Function(_ConsultationRequestSuccess) _then;

/// Create a copy of ConsultationRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(_ConsultationRequestSuccess(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as ConsultationRequestEntity,
  ));
}


}

/// @nodoc


class _ConsultationRequestFailure implements ConsultationRequestState {
  const _ConsultationRequestFailure({required this.message});
  

 final  String message;

/// Create a copy of ConsultationRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationRequestFailureCopyWith<_ConsultationRequestFailure> get copyWith => __$ConsultationRequestFailureCopyWithImpl<_ConsultationRequestFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationRequestFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ConsultationRequestState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ConsultationRequestFailureCopyWith<$Res> implements $ConsultationRequestStateCopyWith<$Res> {
  factory _$ConsultationRequestFailureCopyWith(_ConsultationRequestFailure value, $Res Function(_ConsultationRequestFailure) _then) = __$ConsultationRequestFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ConsultationRequestFailureCopyWithImpl<$Res>
    implements _$ConsultationRequestFailureCopyWith<$Res> {
  __$ConsultationRequestFailureCopyWithImpl(this._self, this._then);

  final _ConsultationRequestFailure _self;
  final $Res Function(_ConsultationRequestFailure) _then;

/// Create a copy of ConsultationRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ConsultationRequestFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
