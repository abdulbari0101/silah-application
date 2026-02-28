// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discovery_results_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DiscoveryResultsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscoveryResultsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiscoveryResultsState()';
}


}

/// @nodoc
class $DiscoveryResultsStateCopyWith<$Res>  {
$DiscoveryResultsStateCopyWith(DiscoveryResultsState _, $Res Function(DiscoveryResultsState) __);
}


/// Adds pattern-matching-related methods to [DiscoveryResultsState].
extension DiscoveryResultsStatePatterns on DiscoveryResultsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _DiscoveryResultsLoading value)?  loading,TResult Function( _DiscoveryResultsReady value)?  ready,TResult Function( _DiscoveryResultsFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiscoveryResultsLoading() when loading != null:
return loading(_that);case _DiscoveryResultsReady() when ready != null:
return ready(_that);case _DiscoveryResultsFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _DiscoveryResultsLoading value)  loading,required TResult Function( _DiscoveryResultsReady value)  ready,required TResult Function( _DiscoveryResultsFailure value)  failure,}){
final _that = this;
switch (_that) {
case _DiscoveryResultsLoading():
return loading(_that);case _DiscoveryResultsReady():
return ready(_that);case _DiscoveryResultsFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _DiscoveryResultsLoading value)?  loading,TResult? Function( _DiscoveryResultsReady value)?  ready,TResult? Function( _DiscoveryResultsFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _DiscoveryResultsLoading() when loading != null:
return loading(_that);case _DiscoveryResultsReady() when ready != null:
return ready(_that);case _DiscoveryResultsFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( LegalSpecializationEntity specialization,  List<LawyerProfileEntity> lawyers)?  ready,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiscoveryResultsLoading() when loading != null:
return loading();case _DiscoveryResultsReady() when ready != null:
return ready(_that.specialization,_that.lawyers);case _DiscoveryResultsFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( LegalSpecializationEntity specialization,  List<LawyerProfileEntity> lawyers)  ready,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _DiscoveryResultsLoading():
return loading();case _DiscoveryResultsReady():
return ready(_that.specialization,_that.lawyers);case _DiscoveryResultsFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( LegalSpecializationEntity specialization,  List<LawyerProfileEntity> lawyers)?  ready,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _DiscoveryResultsLoading() when loading != null:
return loading();case _DiscoveryResultsReady() when ready != null:
return ready(_that.specialization,_that.lawyers);case _DiscoveryResultsFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _DiscoveryResultsLoading implements DiscoveryResultsState {
  const _DiscoveryResultsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiscoveryResultsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiscoveryResultsState.loading()';
}


}




/// @nodoc


class _DiscoveryResultsReady implements DiscoveryResultsState {
  const _DiscoveryResultsReady({required this.specialization, required final  List<LawyerProfileEntity> lawyers}): _lawyers = lawyers;
  

 final  LegalSpecializationEntity specialization;
 final  List<LawyerProfileEntity> _lawyers;
 List<LawyerProfileEntity> get lawyers {
  if (_lawyers is EqualUnmodifiableListView) return _lawyers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lawyers);
}


/// Create a copy of DiscoveryResultsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscoveryResultsReadyCopyWith<_DiscoveryResultsReady> get copyWith => __$DiscoveryResultsReadyCopyWithImpl<_DiscoveryResultsReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiscoveryResultsReady&&(identical(other.specialization, specialization) || other.specialization == specialization)&&const DeepCollectionEquality().equals(other._lawyers, _lawyers));
}


@override
int get hashCode => Object.hash(runtimeType,specialization,const DeepCollectionEquality().hash(_lawyers));

@override
String toString() {
  return 'DiscoveryResultsState.ready(specialization: $specialization, lawyers: $lawyers)';
}


}

/// @nodoc
abstract mixin class _$DiscoveryResultsReadyCopyWith<$Res> implements $DiscoveryResultsStateCopyWith<$Res> {
  factory _$DiscoveryResultsReadyCopyWith(_DiscoveryResultsReady value, $Res Function(_DiscoveryResultsReady) _then) = __$DiscoveryResultsReadyCopyWithImpl;
@useResult
$Res call({
 LegalSpecializationEntity specialization, List<LawyerProfileEntity> lawyers
});




}
/// @nodoc
class __$DiscoveryResultsReadyCopyWithImpl<$Res>
    implements _$DiscoveryResultsReadyCopyWith<$Res> {
  __$DiscoveryResultsReadyCopyWithImpl(this._self, this._then);

  final _DiscoveryResultsReady _self;
  final $Res Function(_DiscoveryResultsReady) _then;

/// Create a copy of DiscoveryResultsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? specialization = null,Object? lawyers = null,}) {
  return _then(_DiscoveryResultsReady(
specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as LegalSpecializationEntity,lawyers: null == lawyers ? _self._lawyers : lawyers // ignore: cast_nullable_to_non_nullable
as List<LawyerProfileEntity>,
  ));
}


}

/// @nodoc


class _DiscoveryResultsFailure implements DiscoveryResultsState {
  const _DiscoveryResultsFailure({required this.message});
  

 final  String message;

/// Create a copy of DiscoveryResultsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscoveryResultsFailureCopyWith<_DiscoveryResultsFailure> get copyWith => __$DiscoveryResultsFailureCopyWithImpl<_DiscoveryResultsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiscoveryResultsFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DiscoveryResultsState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$DiscoveryResultsFailureCopyWith<$Res> implements $DiscoveryResultsStateCopyWith<$Res> {
  factory _$DiscoveryResultsFailureCopyWith(_DiscoveryResultsFailure value, $Res Function(_DiscoveryResultsFailure) _then) = __$DiscoveryResultsFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$DiscoveryResultsFailureCopyWithImpl<$Res>
    implements _$DiscoveryResultsFailureCopyWith<$Res> {
  __$DiscoveryResultsFailureCopyWithImpl(this._self, this._then);

  final _DiscoveryResultsFailure _self;
  final $Res Function(_DiscoveryResultsFailure) _then;

/// Create a copy of DiscoveryResultsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_DiscoveryResultsFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
