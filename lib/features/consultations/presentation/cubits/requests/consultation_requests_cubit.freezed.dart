// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_requests_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConsultationRequestsState {

 ConsultationStatus get filter;
/// Create a copy of ConsultationRequestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsultationRequestsStateCopyWith<ConsultationRequestsState> get copyWith => _$ConsultationRequestsStateCopyWithImpl<ConsultationRequestsState>(this as ConsultationRequestsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsultationRequestsState&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'ConsultationRequestsState(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $ConsultationRequestsStateCopyWith<$Res>  {
  factory $ConsultationRequestsStateCopyWith(ConsultationRequestsState value, $Res Function(ConsultationRequestsState) _then) = _$ConsultationRequestsStateCopyWithImpl;
@useResult
$Res call({
 ConsultationStatus filter
});




}
/// @nodoc
class _$ConsultationRequestsStateCopyWithImpl<$Res>
    implements $ConsultationRequestsStateCopyWith<$Res> {
  _$ConsultationRequestsStateCopyWithImpl(this._self, this._then);

  final ConsultationRequestsState _self;
  final $Res Function(ConsultationRequestsState) _then;

/// Create a copy of ConsultationRequestsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filter = null,}) {
  return _then(_self.copyWith(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ConsultationStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsultationRequestsState].
extension ConsultationRequestsStatePatterns on ConsultationRequestsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ConsultationRequestsInitial value)?  initial,TResult Function( _ConsultationRequestsLoading value)?  loading,TResult Function( _ConsultationRequestsLoaded value)?  loaded,TResult Function( _ConsultationRequestsEmpty value)?  empty,TResult Function( _ConsultationRequestsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsultationRequestsInitial() when initial != null:
return initial(_that);case _ConsultationRequestsLoading() when loading != null:
return loading(_that);case _ConsultationRequestsLoaded() when loaded != null:
return loaded(_that);case _ConsultationRequestsEmpty() when empty != null:
return empty(_that);case _ConsultationRequestsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ConsultationRequestsInitial value)  initial,required TResult Function( _ConsultationRequestsLoading value)  loading,required TResult Function( _ConsultationRequestsLoaded value)  loaded,required TResult Function( _ConsultationRequestsEmpty value)  empty,required TResult Function( _ConsultationRequestsError value)  error,}){
final _that = this;
switch (_that) {
case _ConsultationRequestsInitial():
return initial(_that);case _ConsultationRequestsLoading():
return loading(_that);case _ConsultationRequestsLoaded():
return loaded(_that);case _ConsultationRequestsEmpty():
return empty(_that);case _ConsultationRequestsError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ConsultationRequestsInitial value)?  initial,TResult? Function( _ConsultationRequestsLoading value)?  loading,TResult? Function( _ConsultationRequestsLoaded value)?  loaded,TResult? Function( _ConsultationRequestsEmpty value)?  empty,TResult? Function( _ConsultationRequestsError value)?  error,}){
final _that = this;
switch (_that) {
case _ConsultationRequestsInitial() when initial != null:
return initial(_that);case _ConsultationRequestsLoading() when loading != null:
return loading(_that);case _ConsultationRequestsLoaded() when loaded != null:
return loaded(_that);case _ConsultationRequestsEmpty() when empty != null:
return empty(_that);case _ConsultationRequestsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ConsultationStatus filter)?  initial,TResult Function( ConsultationStatus filter)?  loading,TResult Function( ConsultationStatus filter,  List<ConsultationRequestEntity> requests,  String? updatingId)?  loaded,TResult Function( ConsultationStatus filter)?  empty,TResult Function( ConsultationStatus filter,  String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsultationRequestsInitial() when initial != null:
return initial(_that.filter);case _ConsultationRequestsLoading() when loading != null:
return loading(_that.filter);case _ConsultationRequestsLoaded() when loaded != null:
return loaded(_that.filter,_that.requests,_that.updatingId);case _ConsultationRequestsEmpty() when empty != null:
return empty(_that.filter);case _ConsultationRequestsError() when error != null:
return error(_that.filter,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ConsultationStatus filter)  initial,required TResult Function( ConsultationStatus filter)  loading,required TResult Function( ConsultationStatus filter,  List<ConsultationRequestEntity> requests,  String? updatingId)  loaded,required TResult Function( ConsultationStatus filter)  empty,required TResult Function( ConsultationStatus filter,  String message)  error,}) {final _that = this;
switch (_that) {
case _ConsultationRequestsInitial():
return initial(_that.filter);case _ConsultationRequestsLoading():
return loading(_that.filter);case _ConsultationRequestsLoaded():
return loaded(_that.filter,_that.requests,_that.updatingId);case _ConsultationRequestsEmpty():
return empty(_that.filter);case _ConsultationRequestsError():
return error(_that.filter,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ConsultationStatus filter)?  initial,TResult? Function( ConsultationStatus filter)?  loading,TResult? Function( ConsultationStatus filter,  List<ConsultationRequestEntity> requests,  String? updatingId)?  loaded,TResult? Function( ConsultationStatus filter)?  empty,TResult? Function( ConsultationStatus filter,  String message)?  error,}) {final _that = this;
switch (_that) {
case _ConsultationRequestsInitial() when initial != null:
return initial(_that.filter);case _ConsultationRequestsLoading() when loading != null:
return loading(_that.filter);case _ConsultationRequestsLoaded() when loaded != null:
return loaded(_that.filter,_that.requests,_that.updatingId);case _ConsultationRequestsEmpty() when empty != null:
return empty(_that.filter);case _ConsultationRequestsError() when error != null:
return error(_that.filter,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _ConsultationRequestsInitial implements ConsultationRequestsState {
  const _ConsultationRequestsInitial({required this.filter});
  

@override final  ConsultationStatus filter;

/// Create a copy of ConsultationRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationRequestsInitialCopyWith<_ConsultationRequestsInitial> get copyWith => __$ConsultationRequestsInitialCopyWithImpl<_ConsultationRequestsInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationRequestsInitial&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'ConsultationRequestsState.initial(filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$ConsultationRequestsInitialCopyWith<$Res> implements $ConsultationRequestsStateCopyWith<$Res> {
  factory _$ConsultationRequestsInitialCopyWith(_ConsultationRequestsInitial value, $Res Function(_ConsultationRequestsInitial) _then) = __$ConsultationRequestsInitialCopyWithImpl;
@override @useResult
$Res call({
 ConsultationStatus filter
});




}
/// @nodoc
class __$ConsultationRequestsInitialCopyWithImpl<$Res>
    implements _$ConsultationRequestsInitialCopyWith<$Res> {
  __$ConsultationRequestsInitialCopyWithImpl(this._self, this._then);

  final _ConsultationRequestsInitial _self;
  final $Res Function(_ConsultationRequestsInitial) _then;

/// Create a copy of ConsultationRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(_ConsultationRequestsInitial(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ConsultationStatus,
  ));
}


}

/// @nodoc


class _ConsultationRequestsLoading implements ConsultationRequestsState {
  const _ConsultationRequestsLoading({required this.filter});
  

@override final  ConsultationStatus filter;

/// Create a copy of ConsultationRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationRequestsLoadingCopyWith<_ConsultationRequestsLoading> get copyWith => __$ConsultationRequestsLoadingCopyWithImpl<_ConsultationRequestsLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationRequestsLoading&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'ConsultationRequestsState.loading(filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$ConsultationRequestsLoadingCopyWith<$Res> implements $ConsultationRequestsStateCopyWith<$Res> {
  factory _$ConsultationRequestsLoadingCopyWith(_ConsultationRequestsLoading value, $Res Function(_ConsultationRequestsLoading) _then) = __$ConsultationRequestsLoadingCopyWithImpl;
@override @useResult
$Res call({
 ConsultationStatus filter
});




}
/// @nodoc
class __$ConsultationRequestsLoadingCopyWithImpl<$Res>
    implements _$ConsultationRequestsLoadingCopyWith<$Res> {
  __$ConsultationRequestsLoadingCopyWithImpl(this._self, this._then);

  final _ConsultationRequestsLoading _self;
  final $Res Function(_ConsultationRequestsLoading) _then;

/// Create a copy of ConsultationRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(_ConsultationRequestsLoading(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ConsultationStatus,
  ));
}


}

/// @nodoc


class _ConsultationRequestsLoaded implements ConsultationRequestsState {
  const _ConsultationRequestsLoaded({required this.filter, required final  List<ConsultationRequestEntity> requests, this.updatingId}): _requests = requests;
  

@override final  ConsultationStatus filter;
 final  List<ConsultationRequestEntity> _requests;
 List<ConsultationRequestEntity> get requests {
  if (_requests is EqualUnmodifiableListView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requests);
}

 final  String? updatingId;

/// Create a copy of ConsultationRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationRequestsLoadedCopyWith<_ConsultationRequestsLoaded> get copyWith => __$ConsultationRequestsLoadedCopyWithImpl<_ConsultationRequestsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationRequestsLoaded&&(identical(other.filter, filter) || other.filter == filter)&&const DeepCollectionEquality().equals(other._requests, _requests)&&(identical(other.updatingId, updatingId) || other.updatingId == updatingId));
}


@override
int get hashCode => Object.hash(runtimeType,filter,const DeepCollectionEquality().hash(_requests),updatingId);

@override
String toString() {
  return 'ConsultationRequestsState.loaded(filter: $filter, requests: $requests, updatingId: $updatingId)';
}


}

/// @nodoc
abstract mixin class _$ConsultationRequestsLoadedCopyWith<$Res> implements $ConsultationRequestsStateCopyWith<$Res> {
  factory _$ConsultationRequestsLoadedCopyWith(_ConsultationRequestsLoaded value, $Res Function(_ConsultationRequestsLoaded) _then) = __$ConsultationRequestsLoadedCopyWithImpl;
@override @useResult
$Res call({
 ConsultationStatus filter, List<ConsultationRequestEntity> requests, String? updatingId
});




}
/// @nodoc
class __$ConsultationRequestsLoadedCopyWithImpl<$Res>
    implements _$ConsultationRequestsLoadedCopyWith<$Res> {
  __$ConsultationRequestsLoadedCopyWithImpl(this._self, this._then);

  final _ConsultationRequestsLoaded _self;
  final $Res Function(_ConsultationRequestsLoaded) _then;

/// Create a copy of ConsultationRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,Object? requests = null,Object? updatingId = freezed,}) {
  return _then(_ConsultationRequestsLoaded(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ConsultationStatus,requests: null == requests ? _self._requests : requests // ignore: cast_nullable_to_non_nullable
as List<ConsultationRequestEntity>,updatingId: freezed == updatingId ? _self.updatingId : updatingId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _ConsultationRequestsEmpty implements ConsultationRequestsState {
  const _ConsultationRequestsEmpty({required this.filter});
  

@override final  ConsultationStatus filter;

/// Create a copy of ConsultationRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationRequestsEmptyCopyWith<_ConsultationRequestsEmpty> get copyWith => __$ConsultationRequestsEmptyCopyWithImpl<_ConsultationRequestsEmpty>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationRequestsEmpty&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'ConsultationRequestsState.empty(filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$ConsultationRequestsEmptyCopyWith<$Res> implements $ConsultationRequestsStateCopyWith<$Res> {
  factory _$ConsultationRequestsEmptyCopyWith(_ConsultationRequestsEmpty value, $Res Function(_ConsultationRequestsEmpty) _then) = __$ConsultationRequestsEmptyCopyWithImpl;
@override @useResult
$Res call({
 ConsultationStatus filter
});




}
/// @nodoc
class __$ConsultationRequestsEmptyCopyWithImpl<$Res>
    implements _$ConsultationRequestsEmptyCopyWith<$Res> {
  __$ConsultationRequestsEmptyCopyWithImpl(this._self, this._then);

  final _ConsultationRequestsEmpty _self;
  final $Res Function(_ConsultationRequestsEmpty) _then;

/// Create a copy of ConsultationRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(_ConsultationRequestsEmpty(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ConsultationStatus,
  ));
}


}

/// @nodoc


class _ConsultationRequestsError implements ConsultationRequestsState {
  const _ConsultationRequestsError({required this.filter, required this.message});
  

@override final  ConsultationStatus filter;
 final  String message;

/// Create a copy of ConsultationRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationRequestsErrorCopyWith<_ConsultationRequestsError> get copyWith => __$ConsultationRequestsErrorCopyWithImpl<_ConsultationRequestsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationRequestsError&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,filter,message);

@override
String toString() {
  return 'ConsultationRequestsState.error(filter: $filter, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ConsultationRequestsErrorCopyWith<$Res> implements $ConsultationRequestsStateCopyWith<$Res> {
  factory _$ConsultationRequestsErrorCopyWith(_ConsultationRequestsError value, $Res Function(_ConsultationRequestsError) _then) = __$ConsultationRequestsErrorCopyWithImpl;
@override @useResult
$Res call({
 ConsultationStatus filter, String message
});




}
/// @nodoc
class __$ConsultationRequestsErrorCopyWithImpl<$Res>
    implements _$ConsultationRequestsErrorCopyWith<$Res> {
  __$ConsultationRequestsErrorCopyWithImpl(this._self, this._then);

  final _ConsultationRequestsError _self;
  final $Res Function(_ConsultationRequestsError) _then;

/// Create a copy of ConsultationRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,Object? message = null,}) {
  return _then(_ConsultationRequestsError(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ConsultationStatus,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
