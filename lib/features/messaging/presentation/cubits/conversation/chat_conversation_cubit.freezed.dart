// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_conversation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatConversationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatConversationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatConversationState()';
}


}

/// @nodoc
class $ChatConversationStateCopyWith<$Res>  {
$ChatConversationStateCopyWith(ChatConversationState _, $Res Function(ChatConversationState) __);
}


/// Adds pattern-matching-related methods to [ChatConversationState].
extension ChatConversationStatePatterns on ChatConversationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ChatConversationLoading value)?  loading,TResult Function( _ChatConversationReady value)?  ready,TResult Function( _ChatConversationFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatConversationLoading() when loading != null:
return loading(_that);case _ChatConversationReady() when ready != null:
return ready(_that);case _ChatConversationFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ChatConversationLoading value)  loading,required TResult Function( _ChatConversationReady value)  ready,required TResult Function( _ChatConversationFailure value)  failure,}){
final _that = this;
switch (_that) {
case _ChatConversationLoading():
return loading(_that);case _ChatConversationReady():
return ready(_that);case _ChatConversationFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ChatConversationLoading value)?  loading,TResult? Function( _ChatConversationReady value)?  ready,TResult? Function( _ChatConversationFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _ChatConversationLoading() when loading != null:
return loading(_that);case _ChatConversationReady() when ready != null:
return ready(_that);case _ChatConversationFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<MessageEntity> messages,  bool isSending)?  ready,TResult Function( String message,  List<MessageEntity>? messages)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatConversationLoading() when loading != null:
return loading();case _ChatConversationReady() when ready != null:
return ready(_that.messages,_that.isSending);case _ChatConversationFailure() when failure != null:
return failure(_that.message,_that.messages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<MessageEntity> messages,  bool isSending)  ready,required TResult Function( String message,  List<MessageEntity>? messages)  failure,}) {final _that = this;
switch (_that) {
case _ChatConversationLoading():
return loading();case _ChatConversationReady():
return ready(_that.messages,_that.isSending);case _ChatConversationFailure():
return failure(_that.message,_that.messages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<MessageEntity> messages,  bool isSending)?  ready,TResult? Function( String message,  List<MessageEntity>? messages)?  failure,}) {final _that = this;
switch (_that) {
case _ChatConversationLoading() when loading != null:
return loading();case _ChatConversationReady() when ready != null:
return ready(_that.messages,_that.isSending);case _ChatConversationFailure() when failure != null:
return failure(_that.message,_that.messages);case _:
  return null;

}
}

}

/// @nodoc


class _ChatConversationLoading implements ChatConversationState {
  const _ChatConversationLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatConversationLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatConversationState.loading()';
}


}




/// @nodoc


class _ChatConversationReady implements ChatConversationState {
  const _ChatConversationReady({required final  List<MessageEntity> messages, this.isSending = false}): _messages = messages;
  

 final  List<MessageEntity> _messages;
 List<MessageEntity> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@JsonKey() final  bool isSending;

/// Create a copy of ChatConversationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatConversationReadyCopyWith<_ChatConversationReady> get copyWith => __$ChatConversationReadyCopyWithImpl<_ChatConversationReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatConversationReady&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.isSending, isSending) || other.isSending == isSending));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages),isSending);

@override
String toString() {
  return 'ChatConversationState.ready(messages: $messages, isSending: $isSending)';
}


}

/// @nodoc
abstract mixin class _$ChatConversationReadyCopyWith<$Res> implements $ChatConversationStateCopyWith<$Res> {
  factory _$ChatConversationReadyCopyWith(_ChatConversationReady value, $Res Function(_ChatConversationReady) _then) = __$ChatConversationReadyCopyWithImpl;
@useResult
$Res call({
 List<MessageEntity> messages, bool isSending
});




}
/// @nodoc
class __$ChatConversationReadyCopyWithImpl<$Res>
    implements _$ChatConversationReadyCopyWith<$Res> {
  __$ChatConversationReadyCopyWithImpl(this._self, this._then);

  final _ChatConversationReady _self;
  final $Res Function(_ChatConversationReady) _then;

/// Create a copy of ChatConversationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? isSending = null,}) {
  return _then(_ChatConversationReady(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageEntity>,isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _ChatConversationFailure implements ChatConversationState {
  const _ChatConversationFailure({required this.message, final  List<MessageEntity>? messages}): _messages = messages;
  

 final  String message;
 final  List<MessageEntity>? _messages;
 List<MessageEntity>? get messages {
  final value = _messages;
  if (value == null) return null;
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ChatConversationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatConversationFailureCopyWith<_ChatConversationFailure> get copyWith => __$ChatConversationFailureCopyWithImpl<_ChatConversationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatConversationFailure&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._messages, _messages));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'ChatConversationState.failure(message: $message, messages: $messages)';
}


}

/// @nodoc
abstract mixin class _$ChatConversationFailureCopyWith<$Res> implements $ChatConversationStateCopyWith<$Res> {
  factory _$ChatConversationFailureCopyWith(_ChatConversationFailure value, $Res Function(_ChatConversationFailure) _then) = __$ChatConversationFailureCopyWithImpl;
@useResult
$Res call({
 String message, List<MessageEntity>? messages
});




}
/// @nodoc
class __$ChatConversationFailureCopyWithImpl<$Res>
    implements _$ChatConversationFailureCopyWith<$Res> {
  __$ChatConversationFailureCopyWithImpl(this._self, this._then);

  final _ChatConversationFailure _self;
  final $Res Function(_ChatConversationFailure) _then;

/// Create a copy of ChatConversationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? messages = freezed,}) {
  return _then(_ChatConversationFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,messages: freezed == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageEntity>?,
  ));
}


}

// dart format on
