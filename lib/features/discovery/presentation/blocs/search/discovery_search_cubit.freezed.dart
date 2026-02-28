// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discovery_search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DiscoverySearchState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscoverySearchState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiscoverySearchState()';
}


}

/// @nodoc
class $DiscoverySearchStateCopyWith<$Res>  {
$DiscoverySearchStateCopyWith(DiscoverySearchState _, $Res Function(DiscoverySearchState) __);
}


/// Adds pattern-matching-related methods to [DiscoverySearchState].
extension DiscoverySearchStatePatterns on DiscoverySearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _DiscoverySearchLoading value)?  loading,TResult Function( _DiscoverySearchReady value)?  ready,TResult Function( _DiscoverySearchFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiscoverySearchLoading() when loading != null:
return loading(_that);case _DiscoverySearchReady() when ready != null:
return ready(_that);case _DiscoverySearchFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _DiscoverySearchLoading value)  loading,required TResult Function( _DiscoverySearchReady value)  ready,required TResult Function( _DiscoverySearchFailure value)  failure,}){
final _that = this;
switch (_that) {
case _DiscoverySearchLoading():
return loading(_that);case _DiscoverySearchReady():
return ready(_that);case _DiscoverySearchFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _DiscoverySearchLoading value)?  loading,TResult? Function( _DiscoverySearchReady value)?  ready,TResult? Function( _DiscoverySearchFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _DiscoverySearchLoading() when loading != null:
return loading(_that);case _DiscoverySearchReady() when ready != null:
return ready(_that);case _DiscoverySearchFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<LegalSpecializationEntity> specializations,  LegalSpecializationEntity? selected,  String? query)?  ready,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiscoverySearchLoading() when loading != null:
return loading();case _DiscoverySearchReady() when ready != null:
return ready(_that.specializations,_that.selected,_that.query);case _DiscoverySearchFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<LegalSpecializationEntity> specializations,  LegalSpecializationEntity? selected,  String? query)  ready,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _DiscoverySearchLoading():
return loading();case _DiscoverySearchReady():
return ready(_that.specializations,_that.selected,_that.query);case _DiscoverySearchFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<LegalSpecializationEntity> specializations,  LegalSpecializationEntity? selected,  String? query)?  ready,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _DiscoverySearchLoading() when loading != null:
return loading();case _DiscoverySearchReady() when ready != null:
return ready(_that.specializations,_that.selected,_that.query);case _DiscoverySearchFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _DiscoverySearchLoading implements DiscoverySearchState {
  const _DiscoverySearchLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiscoverySearchLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiscoverySearchState.loading()';
}


}




/// @nodoc


class _DiscoverySearchReady implements DiscoverySearchState {
  const _DiscoverySearchReady({required final  List<LegalSpecializationEntity> specializations, this.selected, this.query}): _specializations = specializations;
  

 final  List<LegalSpecializationEntity> _specializations;
 List<LegalSpecializationEntity> get specializations {
  if (_specializations is EqualUnmodifiableListView) return _specializations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_specializations);
}

 final  LegalSpecializationEntity? selected;
 final  String? query;

/// Create a copy of DiscoverySearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscoverySearchReadyCopyWith<_DiscoverySearchReady> get copyWith => __$DiscoverySearchReadyCopyWithImpl<_DiscoverySearchReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiscoverySearchReady&&const DeepCollectionEquality().equals(other._specializations, _specializations)&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_specializations),selected,query);

@override
String toString() {
  return 'DiscoverySearchState.ready(specializations: $specializations, selected: $selected, query: $query)';
}


}

/// @nodoc
abstract mixin class _$DiscoverySearchReadyCopyWith<$Res> implements $DiscoverySearchStateCopyWith<$Res> {
  factory _$DiscoverySearchReadyCopyWith(_DiscoverySearchReady value, $Res Function(_DiscoverySearchReady) _then) = __$DiscoverySearchReadyCopyWithImpl;
@useResult
$Res call({
 List<LegalSpecializationEntity> specializations, LegalSpecializationEntity? selected, String? query
});




}
/// @nodoc
class __$DiscoverySearchReadyCopyWithImpl<$Res>
    implements _$DiscoverySearchReadyCopyWith<$Res> {
  __$DiscoverySearchReadyCopyWithImpl(this._self, this._then);

  final _DiscoverySearchReady _self;
  final $Res Function(_DiscoverySearchReady) _then;

/// Create a copy of DiscoverySearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? specializations = null,Object? selected = freezed,Object? query = freezed,}) {
  return _then(_DiscoverySearchReady(
specializations: null == specializations ? _self._specializations : specializations // ignore: cast_nullable_to_non_nullable
as List<LegalSpecializationEntity>,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as LegalSpecializationEntity?,query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _DiscoverySearchFailure implements DiscoverySearchState {
  const _DiscoverySearchFailure({required this.message});
  

 final  String message;

/// Create a copy of DiscoverySearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscoverySearchFailureCopyWith<_DiscoverySearchFailure> get copyWith => __$DiscoverySearchFailureCopyWithImpl<_DiscoverySearchFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiscoverySearchFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DiscoverySearchState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$DiscoverySearchFailureCopyWith<$Res> implements $DiscoverySearchStateCopyWith<$Res> {
  factory _$DiscoverySearchFailureCopyWith(_DiscoverySearchFailure value, $Res Function(_DiscoverySearchFailure) _then) = __$DiscoverySearchFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$DiscoverySearchFailureCopyWithImpl<$Res>
    implements _$DiscoverySearchFailureCopyWith<$Res> {
  __$DiscoverySearchFailureCopyWithImpl(this._self, this._then);

  final _DiscoverySearchFailure _self;
  final $Res Function(_DiscoverySearchFailure) _then;

/// Create a copy of DiscoverySearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_DiscoverySearchFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
