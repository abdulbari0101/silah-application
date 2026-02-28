// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_threads_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatThreadsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatThreadsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatThreadsState()';
}


}

/// @nodoc
class $ChatThreadsStateCopyWith<$Res>  {
$ChatThreadsStateCopyWith(ChatThreadsState _, $Res Function(ChatThreadsState) __);
}


/// Adds pattern-matching-related methods to [ChatThreadsState].
extension ChatThreadsStatePatterns on ChatThreadsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ChatThreadsInitial value)?  initial,TResult Function( _ChatThreadsLoading value)?  loading,TResult Function( _ChatThreadsLoaded value)?  loaded,TResult Function( _ChatThreadsEmpty value)?  empty,TResult Function( _ChatThreadsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatThreadsInitial() when initial != null:
return initial(_that);case _ChatThreadsLoading() when loading != null:
return loading(_that);case _ChatThreadsLoaded() when loaded != null:
return loaded(_that);case _ChatThreadsEmpty() when empty != null:
return empty(_that);case _ChatThreadsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ChatThreadsInitial value)  initial,required TResult Function( _ChatThreadsLoading value)  loading,required TResult Function( _ChatThreadsLoaded value)  loaded,required TResult Function( _ChatThreadsEmpty value)  empty,required TResult Function( _ChatThreadsError value)  error,}){
final _that = this;
switch (_that) {
case _ChatThreadsInitial():
return initial(_that);case _ChatThreadsLoading():
return loading(_that);case _ChatThreadsLoaded():
return loaded(_that);case _ChatThreadsEmpty():
return empty(_that);case _ChatThreadsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ChatThreadsInitial value)?  initial,TResult? Function( _ChatThreadsLoading value)?  loading,TResult? Function( _ChatThreadsLoaded value)?  loaded,TResult? Function( _ChatThreadsEmpty value)?  empty,TResult? Function( _ChatThreadsError value)?  error,}){
final _that = this;
switch (_that) {
case _ChatThreadsInitial() when initial != null:
return initial(_that);case _ChatThreadsLoading() when loading != null:
return loading(_that);case _ChatThreadsLoaded() when loaded != null:
return loaded(_that);case _ChatThreadsEmpty() when empty != null:
return empty(_that);case _ChatThreadsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ChatThreadEntity> threads)?  loaded,TResult Function()?  empty,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatThreadsInitial() when initial != null:
return initial();case _ChatThreadsLoading() when loading != null:
return loading();case _ChatThreadsLoaded() when loaded != null:
return loaded(_that.threads);case _ChatThreadsEmpty() when empty != null:
return empty();case _ChatThreadsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ChatThreadEntity> threads)  loaded,required TResult Function()  empty,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _ChatThreadsInitial():
return initial();case _ChatThreadsLoading():
return loading();case _ChatThreadsLoaded():
return loaded(_that.threads);case _ChatThreadsEmpty():
return empty();case _ChatThreadsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ChatThreadEntity> threads)?  loaded,TResult? Function()?  empty,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _ChatThreadsInitial() when initial != null:
return initial();case _ChatThreadsLoading() when loading != null:
return loading();case _ChatThreadsLoaded() when loaded != null:
return loaded(_that.threads);case _ChatThreadsEmpty() when empty != null:
return empty();case _ChatThreadsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _ChatThreadsInitial implements ChatThreadsState {
  const _ChatThreadsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatThreadsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatThreadsState.initial()';
}


}




/// @nodoc


class _ChatThreadsLoading implements ChatThreadsState {
  const _ChatThreadsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatThreadsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatThreadsState.loading()';
}


}




/// @nodoc


class _ChatThreadsLoaded implements ChatThreadsState {
  const _ChatThreadsLoaded({required final  List<ChatThreadEntity> threads}): _threads = threads;
  

 final  List<ChatThreadEntity> _threads;
 List<ChatThreadEntity> get threads {
  if (_threads is EqualUnmodifiableListView) return _threads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_threads);
}


/// Create a copy of ChatThreadsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatThreadsLoadedCopyWith<_ChatThreadsLoaded> get copyWith => __$ChatThreadsLoadedCopyWithImpl<_ChatThreadsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatThreadsLoaded&&const DeepCollectionEquality().equals(other._threads, _threads));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_threads));

@override
String toString() {
  return 'ChatThreadsState.loaded(threads: $threads)';
}


}

/// @nodoc
abstract mixin class _$ChatThreadsLoadedCopyWith<$Res> implements $ChatThreadsStateCopyWith<$Res> {
  factory _$ChatThreadsLoadedCopyWith(_ChatThreadsLoaded value, $Res Function(_ChatThreadsLoaded) _then) = __$ChatThreadsLoadedCopyWithImpl;
@useResult
$Res call({
 List<ChatThreadEntity> threads
});




}
/// @nodoc
class __$ChatThreadsLoadedCopyWithImpl<$Res>
    implements _$ChatThreadsLoadedCopyWith<$Res> {
  __$ChatThreadsLoadedCopyWithImpl(this._self, this._then);

  final _ChatThreadsLoaded _self;
  final $Res Function(_ChatThreadsLoaded) _then;

/// Create a copy of ChatThreadsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? threads = null,}) {
  return _then(_ChatThreadsLoaded(
threads: null == threads ? _self._threads : threads // ignore: cast_nullable_to_non_nullable
as List<ChatThreadEntity>,
  ));
}


}

/// @nodoc


class _ChatThreadsEmpty implements ChatThreadsState {
  const _ChatThreadsEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatThreadsEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatThreadsState.empty()';
}


}




/// @nodoc


class _ChatThreadsError implements ChatThreadsState {
  const _ChatThreadsError({required this.message});
  

 final  String message;

/// Create a copy of ChatThreadsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatThreadsErrorCopyWith<_ChatThreadsError> get copyWith => __$ChatThreadsErrorCopyWithImpl<_ChatThreadsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatThreadsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatThreadsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ChatThreadsErrorCopyWith<$Res> implements $ChatThreadsStateCopyWith<$Res> {
  factory _$ChatThreadsErrorCopyWith(_ChatThreadsError value, $Res Function(_ChatThreadsError) _then) = __$ChatThreadsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ChatThreadsErrorCopyWithImpl<$Res>
    implements _$ChatThreadsErrorCopyWith<$Res> {
  __$ChatThreadsErrorCopyWithImpl(this._self, this._then);

  final _ChatThreadsError _self;
  final $Res Function(_ChatThreadsError) _then;

/// Create a copy of ChatThreadsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ChatThreadsError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
