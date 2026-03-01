// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_task_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdminTaskDetailsState {

 AdminTaskEntity? get task;
/// Create a copy of AdminTaskDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminTaskDetailsStateCopyWith<AdminTaskDetailsState> get copyWith => _$AdminTaskDetailsStateCopyWithImpl<AdminTaskDetailsState>(this as AdminTaskDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminTaskDetailsState&&(identical(other.task, task) || other.task == task));
}


@override
int get hashCode => Object.hash(runtimeType,task);

@override
String toString() {
  return 'AdminTaskDetailsState(task: $task)';
}


}

/// @nodoc
abstract mixin class $AdminTaskDetailsStateCopyWith<$Res>  {
  factory $AdminTaskDetailsStateCopyWith(AdminTaskDetailsState value, $Res Function(AdminTaskDetailsState) _then) = _$AdminTaskDetailsStateCopyWithImpl;
@useResult
$Res call({
 AdminTaskEntity task
});




}
/// @nodoc
class _$AdminTaskDetailsStateCopyWithImpl<$Res>
    implements $AdminTaskDetailsStateCopyWith<$Res> {
  _$AdminTaskDetailsStateCopyWithImpl(this._self, this._then);

  final AdminTaskDetailsState _self;
  final $Res Function(AdminTaskDetailsState) _then;

/// Create a copy of AdminTaskDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? task = null,}) {
  return _then(_self.copyWith(
task: null == task ? _self.task! : task // ignore: cast_nullable_to_non_nullable
as AdminTaskEntity,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminTaskDetailsState].
extension AdminTaskDetailsStatePatterns on AdminTaskDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AdminTaskDetailsReady value)?  ready,TResult Function( _AdminTaskDetailsFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminTaskDetailsReady() when ready != null:
return ready(_that);case _AdminTaskDetailsFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AdminTaskDetailsReady value)  ready,required TResult Function( _AdminTaskDetailsFailure value)  failure,}){
final _that = this;
switch (_that) {
case _AdminTaskDetailsReady():
return ready(_that);case _AdminTaskDetailsFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AdminTaskDetailsReady value)?  ready,TResult? Function( _AdminTaskDetailsFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _AdminTaskDetailsReady() when ready != null:
return ready(_that);case _AdminTaskDetailsFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AdminTaskEntity task,  bool isUpdating)?  ready,TResult Function( String message,  AdminTaskEntity? task)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminTaskDetailsReady() when ready != null:
return ready(_that.task,_that.isUpdating);case _AdminTaskDetailsFailure() when failure != null:
return failure(_that.message,_that.task);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AdminTaskEntity task,  bool isUpdating)  ready,required TResult Function( String message,  AdminTaskEntity? task)  failure,}) {final _that = this;
switch (_that) {
case _AdminTaskDetailsReady():
return ready(_that.task,_that.isUpdating);case _AdminTaskDetailsFailure():
return failure(_that.message,_that.task);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AdminTaskEntity task,  bool isUpdating)?  ready,TResult? Function( String message,  AdminTaskEntity? task)?  failure,}) {final _that = this;
switch (_that) {
case _AdminTaskDetailsReady() when ready != null:
return ready(_that.task,_that.isUpdating);case _AdminTaskDetailsFailure() when failure != null:
return failure(_that.message,_that.task);case _:
  return null;

}
}

}

/// @nodoc


class _AdminTaskDetailsReady implements AdminTaskDetailsState {
  const _AdminTaskDetailsReady({required this.task, this.isUpdating = false});
  

@override final  AdminTaskEntity task;
@JsonKey() final  bool isUpdating;

/// Create a copy of AdminTaskDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminTaskDetailsReadyCopyWith<_AdminTaskDetailsReady> get copyWith => __$AdminTaskDetailsReadyCopyWithImpl<_AdminTaskDetailsReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminTaskDetailsReady&&(identical(other.task, task) || other.task == task)&&(identical(other.isUpdating, isUpdating) || other.isUpdating == isUpdating));
}


@override
int get hashCode => Object.hash(runtimeType,task,isUpdating);

@override
String toString() {
  return 'AdminTaskDetailsState.ready(task: $task, isUpdating: $isUpdating)';
}


}

/// @nodoc
abstract mixin class _$AdminTaskDetailsReadyCopyWith<$Res> implements $AdminTaskDetailsStateCopyWith<$Res> {
  factory _$AdminTaskDetailsReadyCopyWith(_AdminTaskDetailsReady value, $Res Function(_AdminTaskDetailsReady) _then) = __$AdminTaskDetailsReadyCopyWithImpl;
@override @useResult
$Res call({
 AdminTaskEntity task, bool isUpdating
});




}
/// @nodoc
class __$AdminTaskDetailsReadyCopyWithImpl<$Res>
    implements _$AdminTaskDetailsReadyCopyWith<$Res> {
  __$AdminTaskDetailsReadyCopyWithImpl(this._self, this._then);

  final _AdminTaskDetailsReady _self;
  final $Res Function(_AdminTaskDetailsReady) _then;

/// Create a copy of AdminTaskDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? task = null,Object? isUpdating = null,}) {
  return _then(_AdminTaskDetailsReady(
task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as AdminTaskEntity,isUpdating: null == isUpdating ? _self.isUpdating : isUpdating // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _AdminTaskDetailsFailure implements AdminTaskDetailsState {
  const _AdminTaskDetailsFailure({required this.message, this.task});
  

 final  String message;
@override final  AdminTaskEntity? task;

/// Create a copy of AdminTaskDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminTaskDetailsFailureCopyWith<_AdminTaskDetailsFailure> get copyWith => __$AdminTaskDetailsFailureCopyWithImpl<_AdminTaskDetailsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminTaskDetailsFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.task, task) || other.task == task));
}


@override
int get hashCode => Object.hash(runtimeType,message,task);

@override
String toString() {
  return 'AdminTaskDetailsState.failure(message: $message, task: $task)';
}


}

/// @nodoc
abstract mixin class _$AdminTaskDetailsFailureCopyWith<$Res> implements $AdminTaskDetailsStateCopyWith<$Res> {
  factory _$AdminTaskDetailsFailureCopyWith(_AdminTaskDetailsFailure value, $Res Function(_AdminTaskDetailsFailure) _then) = __$AdminTaskDetailsFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, AdminTaskEntity? task
});




}
/// @nodoc
class __$AdminTaskDetailsFailureCopyWithImpl<$Res>
    implements _$AdminTaskDetailsFailureCopyWith<$Res> {
  __$AdminTaskDetailsFailureCopyWithImpl(this._self, this._then);

  final _AdminTaskDetailsFailure _self;
  final $Res Function(_AdminTaskDetailsFailure) _then;

/// Create a copy of AdminTaskDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? task = freezed,}) {
  return _then(_AdminTaskDetailsFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,task: freezed == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as AdminTaskEntity?,
  ));
}


}

// dart format on
