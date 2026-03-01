// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_request_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConsultationRequestDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsultationRequestDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConsultationRequestDetailsState()';
}


}

/// @nodoc
class $ConsultationRequestDetailsStateCopyWith<$Res>  {
$ConsultationRequestDetailsStateCopyWith(ConsultationRequestDetailsState _, $Res Function(ConsultationRequestDetailsState) __);
}


/// Adds pattern-matching-related methods to [ConsultationRequestDetailsState].
extension ConsultationRequestDetailsStatePatterns on ConsultationRequestDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ConsultationRequestDetailsLoading value)?  loading,TResult Function( _ConsultationRequestDetailsReady value)?  ready,TResult Function( _ConsultationRequestDetailsFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsultationRequestDetailsLoading() when loading != null:
return loading(_that);case _ConsultationRequestDetailsReady() when ready != null:
return ready(_that);case _ConsultationRequestDetailsFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ConsultationRequestDetailsLoading value)  loading,required TResult Function( _ConsultationRequestDetailsReady value)  ready,required TResult Function( _ConsultationRequestDetailsFailure value)  failure,}){
final _that = this;
switch (_that) {
case _ConsultationRequestDetailsLoading():
return loading(_that);case _ConsultationRequestDetailsReady():
return ready(_that);case _ConsultationRequestDetailsFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ConsultationRequestDetailsLoading value)?  loading,TResult? Function( _ConsultationRequestDetailsReady value)?  ready,TResult? Function( _ConsultationRequestDetailsFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _ConsultationRequestDetailsLoading() when loading != null:
return loading(_that);case _ConsultationRequestDetailsReady() when ready != null:
return ready(_that);case _ConsultationRequestDetailsFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( ConsultationRequestEntity request,  bool isUpdating)?  ready,TResult Function( String message,  ConsultationRequestEntity? request)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsultationRequestDetailsLoading() when loading != null:
return loading();case _ConsultationRequestDetailsReady() when ready != null:
return ready(_that.request,_that.isUpdating);case _ConsultationRequestDetailsFailure() when failure != null:
return failure(_that.message,_that.request);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( ConsultationRequestEntity request,  bool isUpdating)  ready,required TResult Function( String message,  ConsultationRequestEntity? request)  failure,}) {final _that = this;
switch (_that) {
case _ConsultationRequestDetailsLoading():
return loading();case _ConsultationRequestDetailsReady():
return ready(_that.request,_that.isUpdating);case _ConsultationRequestDetailsFailure():
return failure(_that.message,_that.request);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( ConsultationRequestEntity request,  bool isUpdating)?  ready,TResult? Function( String message,  ConsultationRequestEntity? request)?  failure,}) {final _that = this;
switch (_that) {
case _ConsultationRequestDetailsLoading() when loading != null:
return loading();case _ConsultationRequestDetailsReady() when ready != null:
return ready(_that.request,_that.isUpdating);case _ConsultationRequestDetailsFailure() when failure != null:
return failure(_that.message,_that.request);case _:
  return null;

}
}

}

/// @nodoc


class _ConsultationRequestDetailsLoading implements ConsultationRequestDetailsState {
  const _ConsultationRequestDetailsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationRequestDetailsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConsultationRequestDetailsState.loading()';
}


}




/// @nodoc


class _ConsultationRequestDetailsReady implements ConsultationRequestDetailsState {
  const _ConsultationRequestDetailsReady({required this.request, this.isUpdating = false});
  

 final  ConsultationRequestEntity request;
@JsonKey() final  bool isUpdating;

/// Create a copy of ConsultationRequestDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationRequestDetailsReadyCopyWith<_ConsultationRequestDetailsReady> get copyWith => __$ConsultationRequestDetailsReadyCopyWithImpl<_ConsultationRequestDetailsReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationRequestDetailsReady&&(identical(other.request, request) || other.request == request)&&(identical(other.isUpdating, isUpdating) || other.isUpdating == isUpdating));
}


@override
int get hashCode => Object.hash(runtimeType,request,isUpdating);

@override
String toString() {
  return 'ConsultationRequestDetailsState.ready(request: $request, isUpdating: $isUpdating)';
}


}

/// @nodoc
abstract mixin class _$ConsultationRequestDetailsReadyCopyWith<$Res> implements $ConsultationRequestDetailsStateCopyWith<$Res> {
  factory _$ConsultationRequestDetailsReadyCopyWith(_ConsultationRequestDetailsReady value, $Res Function(_ConsultationRequestDetailsReady) _then) = __$ConsultationRequestDetailsReadyCopyWithImpl;
@useResult
$Res call({
 ConsultationRequestEntity request, bool isUpdating
});




}
/// @nodoc
class __$ConsultationRequestDetailsReadyCopyWithImpl<$Res>
    implements _$ConsultationRequestDetailsReadyCopyWith<$Res> {
  __$ConsultationRequestDetailsReadyCopyWithImpl(this._self, this._then);

  final _ConsultationRequestDetailsReady _self;
  final $Res Function(_ConsultationRequestDetailsReady) _then;

/// Create a copy of ConsultationRequestDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,Object? isUpdating = null,}) {
  return _then(_ConsultationRequestDetailsReady(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as ConsultationRequestEntity,isUpdating: null == isUpdating ? _self.isUpdating : isUpdating // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _ConsultationRequestDetailsFailure implements ConsultationRequestDetailsState {
  const _ConsultationRequestDetailsFailure({required this.message, this.request});
  

 final  String message;
 final  ConsultationRequestEntity? request;

/// Create a copy of ConsultationRequestDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationRequestDetailsFailureCopyWith<_ConsultationRequestDetailsFailure> get copyWith => __$ConsultationRequestDetailsFailureCopyWithImpl<_ConsultationRequestDetailsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationRequestDetailsFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,message,request);

@override
String toString() {
  return 'ConsultationRequestDetailsState.failure(message: $message, request: $request)';
}


}

/// @nodoc
abstract mixin class _$ConsultationRequestDetailsFailureCopyWith<$Res> implements $ConsultationRequestDetailsStateCopyWith<$Res> {
  factory _$ConsultationRequestDetailsFailureCopyWith(_ConsultationRequestDetailsFailure value, $Res Function(_ConsultationRequestDetailsFailure) _then) = __$ConsultationRequestDetailsFailureCopyWithImpl;
@useResult
$Res call({
 String message, ConsultationRequestEntity? request
});




}
/// @nodoc
class __$ConsultationRequestDetailsFailureCopyWithImpl<$Res>
    implements _$ConsultationRequestDetailsFailureCopyWith<$Res> {
  __$ConsultationRequestDetailsFailureCopyWithImpl(this._self, this._then);

  final _ConsultationRequestDetailsFailure _self;
  final $Res Function(_ConsultationRequestDetailsFailure) _then;

/// Create a copy of ConsultationRequestDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? request = freezed,}) {
  return _then(_ConsultationRequestDetailsFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,request: freezed == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as ConsultationRequestEntity?,
  ));
}


}

// dart format on
