// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_lookups_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainingLookupsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingLookupsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainingLookupsState()';
}


}

/// @nodoc
class $TrainingLookupsStateCopyWith<$Res>  {
$TrainingLookupsStateCopyWith(TrainingLookupsState _, $Res Function(TrainingLookupsState) __);
}


/// Adds pattern-matching-related methods to [TrainingLookupsState].
extension TrainingLookupsStatePatterns on TrainingLookupsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TrainingLookupsLoading value)?  loading,TResult Function( _TrainingLookupsReady value)?  ready,TResult Function( _TrainingLookupsFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingLookupsLoading() when loading != null:
return loading(_that);case _TrainingLookupsReady() when ready != null:
return ready(_that);case _TrainingLookupsFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TrainingLookupsLoading value)  loading,required TResult Function( _TrainingLookupsReady value)  ready,required TResult Function( _TrainingLookupsFailure value)  failure,}){
final _that = this;
switch (_that) {
case _TrainingLookupsLoading():
return loading(_that);case _TrainingLookupsReady():
return ready(_that);case _TrainingLookupsFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TrainingLookupsLoading value)?  loading,TResult? Function( _TrainingLookupsReady value)?  ready,TResult? Function( _TrainingLookupsFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _TrainingLookupsLoading() when loading != null:
return loading(_that);case _TrainingLookupsReady() when ready != null:
return ready(_that);case _TrainingLookupsFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<LookupItemEntity> countries,  List<LookupItemEntity> cities,  LookupItemEntity? selectedArea,  LookupItemEntity? selectedCity)?  ready,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingLookupsLoading() when loading != null:
return loading();case _TrainingLookupsReady() when ready != null:
return ready(_that.countries,_that.cities,_that.selectedArea,_that.selectedCity);case _TrainingLookupsFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<LookupItemEntity> countries,  List<LookupItemEntity> cities,  LookupItemEntity? selectedArea,  LookupItemEntity? selectedCity)  ready,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _TrainingLookupsLoading():
return loading();case _TrainingLookupsReady():
return ready(_that.countries,_that.cities,_that.selectedArea,_that.selectedCity);case _TrainingLookupsFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<LookupItemEntity> countries,  List<LookupItemEntity> cities,  LookupItemEntity? selectedArea,  LookupItemEntity? selectedCity)?  ready,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _TrainingLookupsLoading() when loading != null:
return loading();case _TrainingLookupsReady() when ready != null:
return ready(_that.countries,_that.cities,_that.selectedArea,_that.selectedCity);case _TrainingLookupsFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _TrainingLookupsLoading implements TrainingLookupsState {
  const _TrainingLookupsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingLookupsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainingLookupsState.loading()';
}


}




/// @nodoc


class _TrainingLookupsReady implements TrainingLookupsState {
  const _TrainingLookupsReady({required final  List<LookupItemEntity> countries, required final  List<LookupItemEntity> cities, this.selectedArea, this.selectedCity}): _countries = countries,_cities = cities;
  

 final  List<LookupItemEntity> _countries;
 List<LookupItemEntity> get countries {
  if (_countries is EqualUnmodifiableListView) return _countries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_countries);
}

 final  List<LookupItemEntity> _cities;
 List<LookupItemEntity> get cities {
  if (_cities is EqualUnmodifiableListView) return _cities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cities);
}

 final  LookupItemEntity? selectedArea;
 final  LookupItemEntity? selectedCity;

/// Create a copy of TrainingLookupsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingLookupsReadyCopyWith<_TrainingLookupsReady> get copyWith => __$TrainingLookupsReadyCopyWithImpl<_TrainingLookupsReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingLookupsReady&&const DeepCollectionEquality().equals(other._countries, _countries)&&const DeepCollectionEquality().equals(other._cities, _cities)&&(identical(other.selectedArea, selectedArea) || other.selectedArea == selectedArea)&&(identical(other.selectedCity, selectedCity) || other.selectedCity == selectedCity));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_countries),const DeepCollectionEquality().hash(_cities),selectedArea,selectedCity);

@override
String toString() {
  return 'TrainingLookupsState.ready(countries: $countries, cities: $cities, selectedArea: $selectedArea, selectedCity: $selectedCity)';
}


}

/// @nodoc
abstract mixin class _$TrainingLookupsReadyCopyWith<$Res> implements $TrainingLookupsStateCopyWith<$Res> {
  factory _$TrainingLookupsReadyCopyWith(_TrainingLookupsReady value, $Res Function(_TrainingLookupsReady) _then) = __$TrainingLookupsReadyCopyWithImpl;
@useResult
$Res call({
 List<LookupItemEntity> countries, List<LookupItemEntity> cities, LookupItemEntity? selectedArea, LookupItemEntity? selectedCity
});




}
/// @nodoc
class __$TrainingLookupsReadyCopyWithImpl<$Res>
    implements _$TrainingLookupsReadyCopyWith<$Res> {
  __$TrainingLookupsReadyCopyWithImpl(this._self, this._then);

  final _TrainingLookupsReady _self;
  final $Res Function(_TrainingLookupsReady) _then;

/// Create a copy of TrainingLookupsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? countries = null,Object? cities = null,Object? selectedArea = freezed,Object? selectedCity = freezed,}) {
  return _then(_TrainingLookupsReady(
countries: null == countries ? _self._countries : countries // ignore: cast_nullable_to_non_nullable
as List<LookupItemEntity>,cities: null == cities ? _self._cities : cities // ignore: cast_nullable_to_non_nullable
as List<LookupItemEntity>,selectedArea: freezed == selectedArea ? _self.selectedArea : selectedArea // ignore: cast_nullable_to_non_nullable
as LookupItemEntity?,selectedCity: freezed == selectedCity ? _self.selectedCity : selectedCity // ignore: cast_nullable_to_non_nullable
as LookupItemEntity?,
  ));
}


}

/// @nodoc


class _TrainingLookupsFailure implements TrainingLookupsState {
  const _TrainingLookupsFailure({required this.message});
  

 final  String message;

/// Create a copy of TrainingLookupsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingLookupsFailureCopyWith<_TrainingLookupsFailure> get copyWith => __$TrainingLookupsFailureCopyWithImpl<_TrainingLookupsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingLookupsFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TrainingLookupsState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$TrainingLookupsFailureCopyWith<$Res> implements $TrainingLookupsStateCopyWith<$Res> {
  factory _$TrainingLookupsFailureCopyWith(_TrainingLookupsFailure value, $Res Function(_TrainingLookupsFailure) _then) = __$TrainingLookupsFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$TrainingLookupsFailureCopyWithImpl<$Res>
    implements _$TrainingLookupsFailureCopyWith<$Res> {
  __$TrainingLookupsFailureCopyWithImpl(this._self, this._then);

  final _TrainingLookupsFailure _self;
  final $Res Function(_TrainingLookupsFailure) _then;

/// Create a copy of TrainingLookupsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_TrainingLookupsFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
