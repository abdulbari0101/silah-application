// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainees_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TraineesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TraineesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TraineesState()';
}


}

/// @nodoc
class $TraineesStateCopyWith<$Res>  {
$TraineesStateCopyWith(TraineesState _, $Res Function(TraineesState) __);
}


/// Adds pattern-matching-related methods to [TraineesState].
extension TraineesStatePatterns on TraineesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TraineesInitial value)?  initial,TResult Function( _TraineesLoading value)?  loading,TResult Function( _TraineesLoaded value)?  loaded,TResult Function( _TraineesEmpty value)?  empty,TResult Function( _TraineesError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TraineesInitial() when initial != null:
return initial(_that);case _TraineesLoading() when loading != null:
return loading(_that);case _TraineesLoaded() when loaded != null:
return loaded(_that);case _TraineesEmpty() when empty != null:
return empty(_that);case _TraineesError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TraineesInitial value)  initial,required TResult Function( _TraineesLoading value)  loading,required TResult Function( _TraineesLoaded value)  loaded,required TResult Function( _TraineesEmpty value)  empty,required TResult Function( _TraineesError value)  error,}){
final _that = this;
switch (_that) {
case _TraineesInitial():
return initial(_that);case _TraineesLoading():
return loading(_that);case _TraineesLoaded():
return loaded(_that);case _TraineesEmpty():
return empty(_that);case _TraineesError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TraineesInitial value)?  initial,TResult? Function( _TraineesLoading value)?  loading,TResult? Function( _TraineesLoaded value)?  loaded,TResult? Function( _TraineesEmpty value)?  empty,TResult? Function( _TraineesError value)?  error,}){
final _that = this;
switch (_that) {
case _TraineesInitial() when initial != null:
return initial(_that);case _TraineesLoading() when loading != null:
return loading(_that);case _TraineesLoaded() when loaded != null:
return loaded(_that);case _TraineesEmpty() when empty != null:
return empty(_that);case _TraineesError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<TrainingApplicationEntity> applications,  String? updatingId)?  loaded,TResult Function()?  empty,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TraineesInitial() when initial != null:
return initial();case _TraineesLoading() when loading != null:
return loading();case _TraineesLoaded() when loaded != null:
return loaded(_that.applications,_that.updatingId);case _TraineesEmpty() when empty != null:
return empty();case _TraineesError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<TrainingApplicationEntity> applications,  String? updatingId)  loaded,required TResult Function()  empty,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _TraineesInitial():
return initial();case _TraineesLoading():
return loading();case _TraineesLoaded():
return loaded(_that.applications,_that.updatingId);case _TraineesEmpty():
return empty();case _TraineesError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<TrainingApplicationEntity> applications,  String? updatingId)?  loaded,TResult? Function()?  empty,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _TraineesInitial() when initial != null:
return initial();case _TraineesLoading() when loading != null:
return loading();case _TraineesLoaded() when loaded != null:
return loaded(_that.applications,_that.updatingId);case _TraineesEmpty() when empty != null:
return empty();case _TraineesError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _TraineesInitial implements TraineesState {
  const _TraineesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TraineesInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TraineesState.initial()';
}


}




/// @nodoc


class _TraineesLoading implements TraineesState {
  const _TraineesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TraineesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TraineesState.loading()';
}


}




/// @nodoc


class _TraineesLoaded implements TraineesState {
  const _TraineesLoaded({required final  List<TrainingApplicationEntity> applications, this.updatingId}): _applications = applications;
  

 final  List<TrainingApplicationEntity> _applications;
 List<TrainingApplicationEntity> get applications {
  if (_applications is EqualUnmodifiableListView) return _applications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_applications);
}

 final  String? updatingId;

/// Create a copy of TraineesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TraineesLoadedCopyWith<_TraineesLoaded> get copyWith => __$TraineesLoadedCopyWithImpl<_TraineesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TraineesLoaded&&const DeepCollectionEquality().equals(other._applications, _applications)&&(identical(other.updatingId, updatingId) || other.updatingId == updatingId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_applications),updatingId);

@override
String toString() {
  return 'TraineesState.loaded(applications: $applications, updatingId: $updatingId)';
}


}

/// @nodoc
abstract mixin class _$TraineesLoadedCopyWith<$Res> implements $TraineesStateCopyWith<$Res> {
  factory _$TraineesLoadedCopyWith(_TraineesLoaded value, $Res Function(_TraineesLoaded) _then) = __$TraineesLoadedCopyWithImpl;
@useResult
$Res call({
 List<TrainingApplicationEntity> applications, String? updatingId
});




}
/// @nodoc
class __$TraineesLoadedCopyWithImpl<$Res>
    implements _$TraineesLoadedCopyWith<$Res> {
  __$TraineesLoadedCopyWithImpl(this._self, this._then);

  final _TraineesLoaded _self;
  final $Res Function(_TraineesLoaded) _then;

/// Create a copy of TraineesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? applications = null,Object? updatingId = freezed,}) {
  return _then(_TraineesLoaded(
applications: null == applications ? _self._applications : applications // ignore: cast_nullable_to_non_nullable
as List<TrainingApplicationEntity>,updatingId: freezed == updatingId ? _self.updatingId : updatingId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _TraineesEmpty implements TraineesState {
  const _TraineesEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TraineesEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TraineesState.empty()';
}


}




/// @nodoc


class _TraineesError implements TraineesState {
  const _TraineesError({required this.message});
  

 final  String message;

/// Create a copy of TraineesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TraineesErrorCopyWith<_TraineesError> get copyWith => __$TraineesErrorCopyWithImpl<_TraineesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TraineesError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TraineesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$TraineesErrorCopyWith<$Res> implements $TraineesStateCopyWith<$Res> {
  factory _$TraineesErrorCopyWith(_TraineesError value, $Res Function(_TraineesError) _then) = __$TraineesErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$TraineesErrorCopyWithImpl<$Res>
    implements _$TraineesErrorCopyWith<$Res> {
  __$TraineesErrorCopyWithImpl(this._self, this._then);

  final _TraineesError _self;
  final $Res Function(_TraineesError) _then;

/// Create a copy of TraineesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_TraineesError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
