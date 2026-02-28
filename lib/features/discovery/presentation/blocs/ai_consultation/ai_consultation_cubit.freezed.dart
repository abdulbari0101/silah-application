// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_consultation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AiConsultationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiConsultationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AiConsultationState()';
}


}

/// @nodoc
class $AiConsultationStateCopyWith<$Res>  {
$AiConsultationStateCopyWith(AiConsultationState _, $Res Function(AiConsultationState) __);
}


/// Adds pattern-matching-related methods to [AiConsultationState].
extension AiConsultationStatePatterns on AiConsultationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AiConsultationIdle value)?  idle,TResult Function( _AiConsultationLoading value)?  loading,TResult Function( _AiConsultationSuccess value)?  success,TResult Function( _AiConsultationFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiConsultationIdle() when idle != null:
return idle(_that);case _AiConsultationLoading() when loading != null:
return loading(_that);case _AiConsultationSuccess() when success != null:
return success(_that);case _AiConsultationFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AiConsultationIdle value)  idle,required TResult Function( _AiConsultationLoading value)  loading,required TResult Function( _AiConsultationSuccess value)  success,required TResult Function( _AiConsultationFailure value)  failure,}){
final _that = this;
switch (_that) {
case _AiConsultationIdle():
return idle(_that);case _AiConsultationLoading():
return loading(_that);case _AiConsultationSuccess():
return success(_that);case _AiConsultationFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AiConsultationIdle value)?  idle,TResult? Function( _AiConsultationLoading value)?  loading,TResult? Function( _AiConsultationSuccess value)?  success,TResult? Function( _AiConsultationFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _AiConsultationIdle() when idle != null:
return idle(_that);case _AiConsultationLoading() when loading != null:
return loading(_that);case _AiConsultationSuccess() when success != null:
return success(_that);case _AiConsultationFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  loading,TResult Function( AiClassificationResultEntity classification,  AiRecommendationEntity recommendation)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiConsultationIdle() when idle != null:
return idle();case _AiConsultationLoading() when loading != null:
return loading();case _AiConsultationSuccess() when success != null:
return success(_that.classification,_that.recommendation);case _AiConsultationFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  loading,required TResult Function( AiClassificationResultEntity classification,  AiRecommendationEntity recommendation)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _AiConsultationIdle():
return idle();case _AiConsultationLoading():
return loading();case _AiConsultationSuccess():
return success(_that.classification,_that.recommendation);case _AiConsultationFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  loading,TResult? Function( AiClassificationResultEntity classification,  AiRecommendationEntity recommendation)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _AiConsultationIdle() when idle != null:
return idle();case _AiConsultationLoading() when loading != null:
return loading();case _AiConsultationSuccess() when success != null:
return success(_that.classification,_that.recommendation);case _AiConsultationFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _AiConsultationIdle implements AiConsultationState {
  const _AiConsultationIdle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiConsultationIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AiConsultationState.idle()';
}


}




/// @nodoc


class _AiConsultationLoading implements AiConsultationState {
  const _AiConsultationLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiConsultationLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AiConsultationState.loading()';
}


}




/// @nodoc


class _AiConsultationSuccess implements AiConsultationState {
  const _AiConsultationSuccess({required this.classification, required this.recommendation});
  

 final  AiClassificationResultEntity classification;
 final  AiRecommendationEntity recommendation;

/// Create a copy of AiConsultationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiConsultationSuccessCopyWith<_AiConsultationSuccess> get copyWith => __$AiConsultationSuccessCopyWithImpl<_AiConsultationSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiConsultationSuccess&&(identical(other.classification, classification) || other.classification == classification)&&(identical(other.recommendation, recommendation) || other.recommendation == recommendation));
}


@override
int get hashCode => Object.hash(runtimeType,classification,recommendation);

@override
String toString() {
  return 'AiConsultationState.success(classification: $classification, recommendation: $recommendation)';
}


}

/// @nodoc
abstract mixin class _$AiConsultationSuccessCopyWith<$Res> implements $AiConsultationStateCopyWith<$Res> {
  factory _$AiConsultationSuccessCopyWith(_AiConsultationSuccess value, $Res Function(_AiConsultationSuccess) _then) = __$AiConsultationSuccessCopyWithImpl;
@useResult
$Res call({
 AiClassificationResultEntity classification, AiRecommendationEntity recommendation
});




}
/// @nodoc
class __$AiConsultationSuccessCopyWithImpl<$Res>
    implements _$AiConsultationSuccessCopyWith<$Res> {
  __$AiConsultationSuccessCopyWithImpl(this._self, this._then);

  final _AiConsultationSuccess _self;
  final $Res Function(_AiConsultationSuccess) _then;

/// Create a copy of AiConsultationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? classification = null,Object? recommendation = null,}) {
  return _then(_AiConsultationSuccess(
classification: null == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as AiClassificationResultEntity,recommendation: null == recommendation ? _self.recommendation : recommendation // ignore: cast_nullable_to_non_nullable
as AiRecommendationEntity,
  ));
}


}

/// @nodoc


class _AiConsultationFailure implements AiConsultationState {
  const _AiConsultationFailure({required this.message});
  

 final  String message;

/// Create a copy of AiConsultationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiConsultationFailureCopyWith<_AiConsultationFailure> get copyWith => __$AiConsultationFailureCopyWithImpl<_AiConsultationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiConsultationFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AiConsultationState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$AiConsultationFailureCopyWith<$Res> implements $AiConsultationStateCopyWith<$Res> {
  factory _$AiConsultationFailureCopyWith(_AiConsultationFailure value, $Res Function(_AiConsultationFailure) _then) = __$AiConsultationFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$AiConsultationFailureCopyWithImpl<$Res>
    implements _$AiConsultationFailureCopyWith<$Res> {
  __$AiConsultationFailureCopyWithImpl(this._self, this._then);

  final _AiConsultationFailure _self;
  final $Res Function(_AiConsultationFailure) _then;

/// Create a copy of AiConsultationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_AiConsultationFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
