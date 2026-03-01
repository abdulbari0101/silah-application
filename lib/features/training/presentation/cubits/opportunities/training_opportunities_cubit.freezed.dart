// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_opportunities_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainingOpportunitiesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingOpportunitiesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainingOpportunitiesState()';
}


}

/// @nodoc
class $TrainingOpportunitiesStateCopyWith<$Res>  {
$TrainingOpportunitiesStateCopyWith(TrainingOpportunitiesState _, $Res Function(TrainingOpportunitiesState) __);
}


/// Adds pattern-matching-related methods to [TrainingOpportunitiesState].
extension TrainingOpportunitiesStatePatterns on TrainingOpportunitiesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TrainingOpportunitiesLoading value)?  loading,TResult Function( _TrainingOpportunitiesReady value)?  ready,TResult Function( _TrainingOpportunitiesEmpty value)?  empty,TResult Function( _TrainingOpportunitiesFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingOpportunitiesLoading() when loading != null:
return loading(_that);case _TrainingOpportunitiesReady() when ready != null:
return ready(_that);case _TrainingOpportunitiesEmpty() when empty != null:
return empty(_that);case _TrainingOpportunitiesFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TrainingOpportunitiesLoading value)  loading,required TResult Function( _TrainingOpportunitiesReady value)  ready,required TResult Function( _TrainingOpportunitiesEmpty value)  empty,required TResult Function( _TrainingOpportunitiesFailure value)  failure,}){
final _that = this;
switch (_that) {
case _TrainingOpportunitiesLoading():
return loading(_that);case _TrainingOpportunitiesReady():
return ready(_that);case _TrainingOpportunitiesEmpty():
return empty(_that);case _TrainingOpportunitiesFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TrainingOpportunitiesLoading value)?  loading,TResult? Function( _TrainingOpportunitiesReady value)?  ready,TResult? Function( _TrainingOpportunitiesEmpty value)?  empty,TResult? Function( _TrainingOpportunitiesFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _TrainingOpportunitiesLoading() when loading != null:
return loading(_that);case _TrainingOpportunitiesReady() when ready != null:
return ready(_that);case _TrainingOpportunitiesEmpty() when empty != null:
return empty(_that);case _TrainingOpportunitiesFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<TrainingOpportunityEntity> opportunities)?  ready,TResult Function()?  empty,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingOpportunitiesLoading() when loading != null:
return loading();case _TrainingOpportunitiesReady() when ready != null:
return ready(_that.opportunities);case _TrainingOpportunitiesEmpty() when empty != null:
return empty();case _TrainingOpportunitiesFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<TrainingOpportunityEntity> opportunities)  ready,required TResult Function()  empty,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _TrainingOpportunitiesLoading():
return loading();case _TrainingOpportunitiesReady():
return ready(_that.opportunities);case _TrainingOpportunitiesEmpty():
return empty();case _TrainingOpportunitiesFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<TrainingOpportunityEntity> opportunities)?  ready,TResult? Function()?  empty,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _TrainingOpportunitiesLoading() when loading != null:
return loading();case _TrainingOpportunitiesReady() when ready != null:
return ready(_that.opportunities);case _TrainingOpportunitiesEmpty() when empty != null:
return empty();case _TrainingOpportunitiesFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _TrainingOpportunitiesLoading implements TrainingOpportunitiesState {
  const _TrainingOpportunitiesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingOpportunitiesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainingOpportunitiesState.loading()';
}


}




/// @nodoc


class _TrainingOpportunitiesReady implements TrainingOpportunitiesState {
  const _TrainingOpportunitiesReady({required final  List<TrainingOpportunityEntity> opportunities}): _opportunities = opportunities;
  

 final  List<TrainingOpportunityEntity> _opportunities;
 List<TrainingOpportunityEntity> get opportunities {
  if (_opportunities is EqualUnmodifiableListView) return _opportunities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_opportunities);
}


/// Create a copy of TrainingOpportunitiesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingOpportunitiesReadyCopyWith<_TrainingOpportunitiesReady> get copyWith => __$TrainingOpportunitiesReadyCopyWithImpl<_TrainingOpportunitiesReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingOpportunitiesReady&&const DeepCollectionEquality().equals(other._opportunities, _opportunities));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_opportunities));

@override
String toString() {
  return 'TrainingOpportunitiesState.ready(opportunities: $opportunities)';
}


}

/// @nodoc
abstract mixin class _$TrainingOpportunitiesReadyCopyWith<$Res> implements $TrainingOpportunitiesStateCopyWith<$Res> {
  factory _$TrainingOpportunitiesReadyCopyWith(_TrainingOpportunitiesReady value, $Res Function(_TrainingOpportunitiesReady) _then) = __$TrainingOpportunitiesReadyCopyWithImpl;
@useResult
$Res call({
 List<TrainingOpportunityEntity> opportunities
});




}
/// @nodoc
class __$TrainingOpportunitiesReadyCopyWithImpl<$Res>
    implements _$TrainingOpportunitiesReadyCopyWith<$Res> {
  __$TrainingOpportunitiesReadyCopyWithImpl(this._self, this._then);

  final _TrainingOpportunitiesReady _self;
  final $Res Function(_TrainingOpportunitiesReady) _then;

/// Create a copy of TrainingOpportunitiesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? opportunities = null,}) {
  return _then(_TrainingOpportunitiesReady(
opportunities: null == opportunities ? _self._opportunities : opportunities // ignore: cast_nullable_to_non_nullable
as List<TrainingOpportunityEntity>,
  ));
}


}

/// @nodoc


class _TrainingOpportunitiesEmpty implements TrainingOpportunitiesState {
  const _TrainingOpportunitiesEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingOpportunitiesEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainingOpportunitiesState.empty()';
}


}




/// @nodoc


class _TrainingOpportunitiesFailure implements TrainingOpportunitiesState {
  const _TrainingOpportunitiesFailure({required this.message});
  

 final  String message;

/// Create a copy of TrainingOpportunitiesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingOpportunitiesFailureCopyWith<_TrainingOpportunitiesFailure> get copyWith => __$TrainingOpportunitiesFailureCopyWithImpl<_TrainingOpportunitiesFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingOpportunitiesFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TrainingOpportunitiesState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$TrainingOpportunitiesFailureCopyWith<$Res> implements $TrainingOpportunitiesStateCopyWith<$Res> {
  factory _$TrainingOpportunitiesFailureCopyWith(_TrainingOpportunitiesFailure value, $Res Function(_TrainingOpportunitiesFailure) _then) = __$TrainingOpportunitiesFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$TrainingOpportunitiesFailureCopyWithImpl<$Res>
    implements _$TrainingOpportunitiesFailureCopyWith<$Res> {
  __$TrainingOpportunitiesFailureCopyWithImpl(this._self, this._then);

  final _TrainingOpportunitiesFailure _self;
  final $Res Function(_TrainingOpportunitiesFailure) _then;

/// Create a copy of TrainingOpportunitiesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_TrainingOpportunitiesFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
