// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_lookups_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegistrationLookupsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationLookupsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegistrationLookupsState()';
}


}

/// @nodoc
class $RegistrationLookupsStateCopyWith<$Res>  {
$RegistrationLookupsStateCopyWith(RegistrationLookupsState _, $Res Function(RegistrationLookupsState) __);
}


/// Adds pattern-matching-related methods to [RegistrationLookupsState].
extension RegistrationLookupsStatePatterns on RegistrationLookupsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _RegistrationLookupsLoading value)?  loading,TResult Function( _RegistrationLookupsReady value)?  ready,TResult Function( _RegistrationLookupsFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegistrationLookupsLoading() when loading != null:
return loading(_that);case _RegistrationLookupsReady() when ready != null:
return ready(_that);case _RegistrationLookupsFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _RegistrationLookupsLoading value)  loading,required TResult Function( _RegistrationLookupsReady value)  ready,required TResult Function( _RegistrationLookupsFailure value)  failure,}){
final _that = this;
switch (_that) {
case _RegistrationLookupsLoading():
return loading(_that);case _RegistrationLookupsReady():
return ready(_that);case _RegistrationLookupsFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _RegistrationLookupsLoading value)?  loading,TResult? Function( _RegistrationLookupsReady value)?  ready,TResult? Function( _RegistrationLookupsFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _RegistrationLookupsLoading() when loading != null:
return loading(_that);case _RegistrationLookupsReady() when ready != null:
return ready(_that);case _RegistrationLookupsFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<LookupItemEntity> genders,  List<LegalSpecializationEntity> specializations,  List<LookupItemEntity> cities,  List<LookupItemEntity> workDestinations)?  ready,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegistrationLookupsLoading() when loading != null:
return loading();case _RegistrationLookupsReady() when ready != null:
return ready(_that.genders,_that.specializations,_that.cities,_that.workDestinations);case _RegistrationLookupsFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<LookupItemEntity> genders,  List<LegalSpecializationEntity> specializations,  List<LookupItemEntity> cities,  List<LookupItemEntity> workDestinations)  ready,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _RegistrationLookupsLoading():
return loading();case _RegistrationLookupsReady():
return ready(_that.genders,_that.specializations,_that.cities,_that.workDestinations);case _RegistrationLookupsFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<LookupItemEntity> genders,  List<LegalSpecializationEntity> specializations,  List<LookupItemEntity> cities,  List<LookupItemEntity> workDestinations)?  ready,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _RegistrationLookupsLoading() when loading != null:
return loading();case _RegistrationLookupsReady() when ready != null:
return ready(_that.genders,_that.specializations,_that.cities,_that.workDestinations);case _RegistrationLookupsFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _RegistrationLookupsLoading implements RegistrationLookupsState {
  const _RegistrationLookupsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegistrationLookupsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegistrationLookupsState.loading()';
}


}




/// @nodoc


class _RegistrationLookupsReady implements RegistrationLookupsState {
  const _RegistrationLookupsReady({final  List<LookupItemEntity> genders = const <LookupItemEntity>[], final  List<LegalSpecializationEntity> specializations = const <LegalSpecializationEntity>[], final  List<LookupItemEntity> cities = const <LookupItemEntity>[], final  List<LookupItemEntity> workDestinations = const <LookupItemEntity>[]}): _genders = genders,_specializations = specializations,_cities = cities,_workDestinations = workDestinations;
  

 final  List<LookupItemEntity> _genders;
@JsonKey() List<LookupItemEntity> get genders {
  if (_genders is EqualUnmodifiableListView) return _genders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genders);
}

 final  List<LegalSpecializationEntity> _specializations;
@JsonKey() List<LegalSpecializationEntity> get specializations {
  if (_specializations is EqualUnmodifiableListView) return _specializations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_specializations);
}

 final  List<LookupItemEntity> _cities;
@JsonKey() List<LookupItemEntity> get cities {
  if (_cities is EqualUnmodifiableListView) return _cities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cities);
}

 final  List<LookupItemEntity> _workDestinations;
@JsonKey() List<LookupItemEntity> get workDestinations {
  if (_workDestinations is EqualUnmodifiableListView) return _workDestinations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_workDestinations);
}


/// Create a copy of RegistrationLookupsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegistrationLookupsReadyCopyWith<_RegistrationLookupsReady> get copyWith => __$RegistrationLookupsReadyCopyWithImpl<_RegistrationLookupsReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegistrationLookupsReady&&const DeepCollectionEquality().equals(other._genders, _genders)&&const DeepCollectionEquality().equals(other._specializations, _specializations)&&const DeepCollectionEquality().equals(other._cities, _cities)&&const DeepCollectionEquality().equals(other._workDestinations, _workDestinations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_genders),const DeepCollectionEquality().hash(_specializations),const DeepCollectionEquality().hash(_cities),const DeepCollectionEquality().hash(_workDestinations));

@override
String toString() {
  return 'RegistrationLookupsState.ready(genders: $genders, specializations: $specializations, cities: $cities, workDestinations: $workDestinations)';
}


}

/// @nodoc
abstract mixin class _$RegistrationLookupsReadyCopyWith<$Res> implements $RegistrationLookupsStateCopyWith<$Res> {
  factory _$RegistrationLookupsReadyCopyWith(_RegistrationLookupsReady value, $Res Function(_RegistrationLookupsReady) _then) = __$RegistrationLookupsReadyCopyWithImpl;
@useResult
$Res call({
 List<LookupItemEntity> genders, List<LegalSpecializationEntity> specializations, List<LookupItemEntity> cities, List<LookupItemEntity> workDestinations
});




}
/// @nodoc
class __$RegistrationLookupsReadyCopyWithImpl<$Res>
    implements _$RegistrationLookupsReadyCopyWith<$Res> {
  __$RegistrationLookupsReadyCopyWithImpl(this._self, this._then);

  final _RegistrationLookupsReady _self;
  final $Res Function(_RegistrationLookupsReady) _then;

/// Create a copy of RegistrationLookupsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? genders = null,Object? specializations = null,Object? cities = null,Object? workDestinations = null,}) {
  return _then(_RegistrationLookupsReady(
genders: null == genders ? _self._genders : genders // ignore: cast_nullable_to_non_nullable
as List<LookupItemEntity>,specializations: null == specializations ? _self._specializations : specializations // ignore: cast_nullable_to_non_nullable
as List<LegalSpecializationEntity>,cities: null == cities ? _self._cities : cities // ignore: cast_nullable_to_non_nullable
as List<LookupItemEntity>,workDestinations: null == workDestinations ? _self._workDestinations : workDestinations // ignore: cast_nullable_to_non_nullable
as List<LookupItemEntity>,
  ));
}


}

/// @nodoc


class _RegistrationLookupsFailure implements RegistrationLookupsState {
  const _RegistrationLookupsFailure({required this.message});
  

 final  String message;

/// Create a copy of RegistrationLookupsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegistrationLookupsFailureCopyWith<_RegistrationLookupsFailure> get copyWith => __$RegistrationLookupsFailureCopyWithImpl<_RegistrationLookupsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegistrationLookupsFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'RegistrationLookupsState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$RegistrationLookupsFailureCopyWith<$Res> implements $RegistrationLookupsStateCopyWith<$Res> {
  factory _$RegistrationLookupsFailureCopyWith(_RegistrationLookupsFailure value, $Res Function(_RegistrationLookupsFailure) _then) = __$RegistrationLookupsFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$RegistrationLookupsFailureCopyWithImpl<$Res>
    implements _$RegistrationLookupsFailureCopyWith<$Res> {
  __$RegistrationLookupsFailureCopyWithImpl(this._self, this._then);

  final _RegistrationLookupsFailure _self;
  final $Res Function(_RegistrationLookupsFailure) _then;

/// Create a copy of RegistrationLookupsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_RegistrationLookupsFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
