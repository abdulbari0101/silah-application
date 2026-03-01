// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_application_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainingApplicationDetailsState {

 TrainingApplicationEntity? get application;
/// Create a copy of TrainingApplicationDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingApplicationDetailsStateCopyWith<TrainingApplicationDetailsState> get copyWith => _$TrainingApplicationDetailsStateCopyWithImpl<TrainingApplicationDetailsState>(this as TrainingApplicationDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingApplicationDetailsState&&(identical(other.application, application) || other.application == application));
}


@override
int get hashCode => Object.hash(runtimeType,application);

@override
String toString() {
  return 'TrainingApplicationDetailsState(application: $application)';
}


}

/// @nodoc
abstract mixin class $TrainingApplicationDetailsStateCopyWith<$Res>  {
  factory $TrainingApplicationDetailsStateCopyWith(TrainingApplicationDetailsState value, $Res Function(TrainingApplicationDetailsState) _then) = _$TrainingApplicationDetailsStateCopyWithImpl;
@useResult
$Res call({
 TrainingApplicationEntity application
});




}
/// @nodoc
class _$TrainingApplicationDetailsStateCopyWithImpl<$Res>
    implements $TrainingApplicationDetailsStateCopyWith<$Res> {
  _$TrainingApplicationDetailsStateCopyWithImpl(this._self, this._then);

  final TrainingApplicationDetailsState _self;
  final $Res Function(TrainingApplicationDetailsState) _then;

/// Create a copy of TrainingApplicationDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? application = null,}) {
  return _then(_self.copyWith(
application: null == application ? _self.application! : application // ignore: cast_nullable_to_non_nullable
as TrainingApplicationEntity,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainingApplicationDetailsState].
extension TrainingApplicationDetailsStatePatterns on TrainingApplicationDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TrainingApplicationDetailsReady value)?  ready,TResult Function( _TrainingApplicationDetailsFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingApplicationDetailsReady() when ready != null:
return ready(_that);case _TrainingApplicationDetailsFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TrainingApplicationDetailsReady value)  ready,required TResult Function( _TrainingApplicationDetailsFailure value)  failure,}){
final _that = this;
switch (_that) {
case _TrainingApplicationDetailsReady():
return ready(_that);case _TrainingApplicationDetailsFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TrainingApplicationDetailsReady value)?  ready,TResult? Function( _TrainingApplicationDetailsFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _TrainingApplicationDetailsReady() when ready != null:
return ready(_that);case _TrainingApplicationDetailsFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( TrainingApplicationEntity application,  bool isUpdating)?  ready,TResult Function( String message,  TrainingApplicationEntity? application)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingApplicationDetailsReady() when ready != null:
return ready(_that.application,_that.isUpdating);case _TrainingApplicationDetailsFailure() when failure != null:
return failure(_that.message,_that.application);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( TrainingApplicationEntity application,  bool isUpdating)  ready,required TResult Function( String message,  TrainingApplicationEntity? application)  failure,}) {final _that = this;
switch (_that) {
case _TrainingApplicationDetailsReady():
return ready(_that.application,_that.isUpdating);case _TrainingApplicationDetailsFailure():
return failure(_that.message,_that.application);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( TrainingApplicationEntity application,  bool isUpdating)?  ready,TResult? Function( String message,  TrainingApplicationEntity? application)?  failure,}) {final _that = this;
switch (_that) {
case _TrainingApplicationDetailsReady() when ready != null:
return ready(_that.application,_that.isUpdating);case _TrainingApplicationDetailsFailure() when failure != null:
return failure(_that.message,_that.application);case _:
  return null;

}
}

}

/// @nodoc


class _TrainingApplicationDetailsReady implements TrainingApplicationDetailsState {
  const _TrainingApplicationDetailsReady({required this.application, this.isUpdating = false});
  

@override final  TrainingApplicationEntity application;
@JsonKey() final  bool isUpdating;

/// Create a copy of TrainingApplicationDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingApplicationDetailsReadyCopyWith<_TrainingApplicationDetailsReady> get copyWith => __$TrainingApplicationDetailsReadyCopyWithImpl<_TrainingApplicationDetailsReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingApplicationDetailsReady&&(identical(other.application, application) || other.application == application)&&(identical(other.isUpdating, isUpdating) || other.isUpdating == isUpdating));
}


@override
int get hashCode => Object.hash(runtimeType,application,isUpdating);

@override
String toString() {
  return 'TrainingApplicationDetailsState.ready(application: $application, isUpdating: $isUpdating)';
}


}

/// @nodoc
abstract mixin class _$TrainingApplicationDetailsReadyCopyWith<$Res> implements $TrainingApplicationDetailsStateCopyWith<$Res> {
  factory _$TrainingApplicationDetailsReadyCopyWith(_TrainingApplicationDetailsReady value, $Res Function(_TrainingApplicationDetailsReady) _then) = __$TrainingApplicationDetailsReadyCopyWithImpl;
@override @useResult
$Res call({
 TrainingApplicationEntity application, bool isUpdating
});




}
/// @nodoc
class __$TrainingApplicationDetailsReadyCopyWithImpl<$Res>
    implements _$TrainingApplicationDetailsReadyCopyWith<$Res> {
  __$TrainingApplicationDetailsReadyCopyWithImpl(this._self, this._then);

  final _TrainingApplicationDetailsReady _self;
  final $Res Function(_TrainingApplicationDetailsReady) _then;

/// Create a copy of TrainingApplicationDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? application = null,Object? isUpdating = null,}) {
  return _then(_TrainingApplicationDetailsReady(
application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as TrainingApplicationEntity,isUpdating: null == isUpdating ? _self.isUpdating : isUpdating // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _TrainingApplicationDetailsFailure implements TrainingApplicationDetailsState {
  const _TrainingApplicationDetailsFailure({required this.message, this.application});
  

 final  String message;
@override final  TrainingApplicationEntity? application;

/// Create a copy of TrainingApplicationDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingApplicationDetailsFailureCopyWith<_TrainingApplicationDetailsFailure> get copyWith => __$TrainingApplicationDetailsFailureCopyWithImpl<_TrainingApplicationDetailsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingApplicationDetailsFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.application, application) || other.application == application));
}


@override
int get hashCode => Object.hash(runtimeType,message,application);

@override
String toString() {
  return 'TrainingApplicationDetailsState.failure(message: $message, application: $application)';
}


}

/// @nodoc
abstract mixin class _$TrainingApplicationDetailsFailureCopyWith<$Res> implements $TrainingApplicationDetailsStateCopyWith<$Res> {
  factory _$TrainingApplicationDetailsFailureCopyWith(_TrainingApplicationDetailsFailure value, $Res Function(_TrainingApplicationDetailsFailure) _then) = __$TrainingApplicationDetailsFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, TrainingApplicationEntity? application
});




}
/// @nodoc
class __$TrainingApplicationDetailsFailureCopyWithImpl<$Res>
    implements _$TrainingApplicationDetailsFailureCopyWith<$Res> {
  __$TrainingApplicationDetailsFailureCopyWithImpl(this._self, this._then);

  final _TrainingApplicationDetailsFailure _self;
  final $Res Function(_TrainingApplicationDetailsFailure) _then;

/// Create a copy of TrainingApplicationDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? application = freezed,}) {
  return _then(_TrainingApplicationDetailsFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,application: freezed == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as TrainingApplicationEntity?,
  ));
}


}

// dart format on
