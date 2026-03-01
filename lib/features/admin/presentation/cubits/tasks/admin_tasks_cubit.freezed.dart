// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_tasks_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdminTasksState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminTasksState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminTasksState()';
}


}

/// @nodoc
class $AdminTasksStateCopyWith<$Res>  {
$AdminTasksStateCopyWith(AdminTasksState _, $Res Function(AdminTasksState) __);
}


/// Adds pattern-matching-related methods to [AdminTasksState].
extension AdminTasksStatePatterns on AdminTasksState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AdminTasksLoading value)?  loading,TResult Function( _AdminTasksEmpty value)?  empty,TResult Function( _AdminTasksReady value)?  ready,TResult Function( _AdminTasksFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminTasksLoading() when loading != null:
return loading(_that);case _AdminTasksEmpty() when empty != null:
return empty(_that);case _AdminTasksReady() when ready != null:
return ready(_that);case _AdminTasksFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AdminTasksLoading value)  loading,required TResult Function( _AdminTasksEmpty value)  empty,required TResult Function( _AdminTasksReady value)  ready,required TResult Function( _AdminTasksFailure value)  failure,}){
final _that = this;
switch (_that) {
case _AdminTasksLoading():
return loading(_that);case _AdminTasksEmpty():
return empty(_that);case _AdminTasksReady():
return ready(_that);case _AdminTasksFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AdminTasksLoading value)?  loading,TResult? Function( _AdminTasksEmpty value)?  empty,TResult? Function( _AdminTasksReady value)?  ready,TResult? Function( _AdminTasksFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _AdminTasksLoading() when loading != null:
return loading(_that);case _AdminTasksEmpty() when empty != null:
return empty(_that);case _AdminTasksReady() when ready != null:
return ready(_that);case _AdminTasksFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function()?  empty,TResult Function( List<AdminTaskEntity> tasks)?  ready,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminTasksLoading() when loading != null:
return loading();case _AdminTasksEmpty() when empty != null:
return empty();case _AdminTasksReady() when ready != null:
return ready(_that.tasks);case _AdminTasksFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function()  empty,required TResult Function( List<AdminTaskEntity> tasks)  ready,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _AdminTasksLoading():
return loading();case _AdminTasksEmpty():
return empty();case _AdminTasksReady():
return ready(_that.tasks);case _AdminTasksFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function()?  empty,TResult? Function( List<AdminTaskEntity> tasks)?  ready,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _AdminTasksLoading() when loading != null:
return loading();case _AdminTasksEmpty() when empty != null:
return empty();case _AdminTasksReady() when ready != null:
return ready(_that.tasks);case _AdminTasksFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _AdminTasksLoading implements AdminTasksState {
  const _AdminTasksLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminTasksLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminTasksState.loading()';
}


}




/// @nodoc


class _AdminTasksEmpty implements AdminTasksState {
  const _AdminTasksEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminTasksEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminTasksState.empty()';
}


}




/// @nodoc


class _AdminTasksReady implements AdminTasksState {
  const _AdminTasksReady({required final  List<AdminTaskEntity> tasks}): _tasks = tasks;
  

 final  List<AdminTaskEntity> _tasks;
 List<AdminTaskEntity> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}


/// Create a copy of AdminTasksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminTasksReadyCopyWith<_AdminTasksReady> get copyWith => __$AdminTasksReadyCopyWithImpl<_AdminTasksReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminTasksReady&&const DeepCollectionEquality().equals(other._tasks, _tasks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tasks));

@override
String toString() {
  return 'AdminTasksState.ready(tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class _$AdminTasksReadyCopyWith<$Res> implements $AdminTasksStateCopyWith<$Res> {
  factory _$AdminTasksReadyCopyWith(_AdminTasksReady value, $Res Function(_AdminTasksReady) _then) = __$AdminTasksReadyCopyWithImpl;
@useResult
$Res call({
 List<AdminTaskEntity> tasks
});




}
/// @nodoc
class __$AdminTasksReadyCopyWithImpl<$Res>
    implements _$AdminTasksReadyCopyWith<$Res> {
  __$AdminTasksReadyCopyWithImpl(this._self, this._then);

  final _AdminTasksReady _self;
  final $Res Function(_AdminTasksReady) _then;

/// Create a copy of AdminTasksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tasks = null,}) {
  return _then(_AdminTasksReady(
tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<AdminTaskEntity>,
  ));
}


}

/// @nodoc


class _AdminTasksFailure implements AdminTasksState {
  const _AdminTasksFailure({required this.message});
  

 final  String message;

/// Create a copy of AdminTasksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminTasksFailureCopyWith<_AdminTasksFailure> get copyWith => __$AdminTasksFailureCopyWithImpl<_AdminTasksFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminTasksFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AdminTasksState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$AdminTasksFailureCopyWith<$Res> implements $AdminTasksStateCopyWith<$Res> {
  factory _$AdminTasksFailureCopyWith(_AdminTasksFailure value, $Res Function(_AdminTasksFailure) _then) = __$AdminTasksFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$AdminTasksFailureCopyWithImpl<$Res>
    implements _$AdminTasksFailureCopyWith<$Res> {
  __$AdminTasksFailureCopyWithImpl(this._self, this._then);

  final _AdminTasksFailure _self;
  final $Res Function(_AdminTasksFailure) _then;

/// Create a copy of AdminTasksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_AdminTasksFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
