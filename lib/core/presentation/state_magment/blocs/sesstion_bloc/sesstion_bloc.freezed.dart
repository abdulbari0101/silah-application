// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sesstion_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionEvent()';
}


}

/// @nodoc
class $SessionEventCopyWith<$Res>  {
$SessionEventCopyWith(SessionEvent _, $Res Function(SessionEvent) __);
}


/// Adds pattern-matching-related methods to [SessionEvent].
extension SessionEventPatterns on SessionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ResumeInteractionListener value)?  resumeInteractionListener,TResult Function( PauseInteractionListener value)?  pauseInteractionListener,TResult Function( InteractionTimedOutEvent value)?  interactionTimedOut,TResult Function( TokenExpiredEvent value)?  tokenExpired,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ResumeInteractionListener() when resumeInteractionListener != null:
return resumeInteractionListener(_that);case PauseInteractionListener() when pauseInteractionListener != null:
return pauseInteractionListener(_that);case InteractionTimedOutEvent() when interactionTimedOut != null:
return interactionTimedOut(_that);case TokenExpiredEvent() when tokenExpired != null:
return tokenExpired(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ResumeInteractionListener value)  resumeInteractionListener,required TResult Function( PauseInteractionListener value)  pauseInteractionListener,required TResult Function( InteractionTimedOutEvent value)  interactionTimedOut,required TResult Function( TokenExpiredEvent value)  tokenExpired,}){
final _that = this;
switch (_that) {
case ResumeInteractionListener():
return resumeInteractionListener(_that);case PauseInteractionListener():
return pauseInteractionListener(_that);case InteractionTimedOutEvent():
return interactionTimedOut(_that);case TokenExpiredEvent():
return tokenExpired(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ResumeInteractionListener value)?  resumeInteractionListener,TResult? Function( PauseInteractionListener value)?  pauseInteractionListener,TResult? Function( InteractionTimedOutEvent value)?  interactionTimedOut,TResult? Function( TokenExpiredEvent value)?  tokenExpired,}){
final _that = this;
switch (_that) {
case ResumeInteractionListener() when resumeInteractionListener != null:
return resumeInteractionListener(_that);case PauseInteractionListener() when pauseInteractionListener != null:
return pauseInteractionListener(_that);case InteractionTimedOutEvent() when interactionTimedOut != null:
return interactionTimedOut(_that);case TokenExpiredEvent() when tokenExpired != null:
return tokenExpired(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  resumeInteractionListener,TResult Function()?  pauseInteractionListener,TResult Function()?  interactionTimedOut,TResult Function( ErrorSource source)?  tokenExpired,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ResumeInteractionListener() when resumeInteractionListener != null:
return resumeInteractionListener();case PauseInteractionListener() when pauseInteractionListener != null:
return pauseInteractionListener();case InteractionTimedOutEvent() when interactionTimedOut != null:
return interactionTimedOut();case TokenExpiredEvent() when tokenExpired != null:
return tokenExpired(_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  resumeInteractionListener,required TResult Function()  pauseInteractionListener,required TResult Function()  interactionTimedOut,required TResult Function( ErrorSource source)  tokenExpired,}) {final _that = this;
switch (_that) {
case ResumeInteractionListener():
return resumeInteractionListener();case PauseInteractionListener():
return pauseInteractionListener();case InteractionTimedOutEvent():
return interactionTimedOut();case TokenExpiredEvent():
return tokenExpired(_that.source);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  resumeInteractionListener,TResult? Function()?  pauseInteractionListener,TResult? Function()?  interactionTimedOut,TResult? Function( ErrorSource source)?  tokenExpired,}) {final _that = this;
switch (_that) {
case ResumeInteractionListener() when resumeInteractionListener != null:
return resumeInteractionListener();case PauseInteractionListener() when pauseInteractionListener != null:
return pauseInteractionListener();case InteractionTimedOutEvent() when interactionTimedOut != null:
return interactionTimedOut();case TokenExpiredEvent() when tokenExpired != null:
return tokenExpired(_that.source);case _:
  return null;

}
}

}

/// @nodoc


class ResumeInteractionListener implements SessionEvent {
  const ResumeInteractionListener();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResumeInteractionListener);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionEvent.resumeInteractionListener()';
}


}




/// @nodoc


class PauseInteractionListener implements SessionEvent {
  const PauseInteractionListener();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PauseInteractionListener);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionEvent.pauseInteractionListener()';
}


}




/// @nodoc


class InteractionTimedOutEvent implements SessionEvent {
  const InteractionTimedOutEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InteractionTimedOutEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionEvent.interactionTimedOut()';
}


}




/// @nodoc


class TokenExpiredEvent implements SessionEvent {
  const TokenExpiredEvent({required this.source});
  

 final  ErrorSource source;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenExpiredEventCopyWith<TokenExpiredEvent> get copyWith => _$TokenExpiredEventCopyWithImpl<TokenExpiredEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenExpiredEvent&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode => Object.hash(runtimeType,source);

@override
String toString() {
  return 'SessionEvent.tokenExpired(source: $source)';
}


}

/// @nodoc
abstract mixin class $TokenExpiredEventCopyWith<$Res> implements $SessionEventCopyWith<$Res> {
  factory $TokenExpiredEventCopyWith(TokenExpiredEvent value, $Res Function(TokenExpiredEvent) _then) = _$TokenExpiredEventCopyWithImpl;
@useResult
$Res call({
 ErrorSource source
});




}
/// @nodoc
class _$TokenExpiredEventCopyWithImpl<$Res>
    implements $TokenExpiredEventCopyWith<$Res> {
  _$TokenExpiredEventCopyWithImpl(this._self, this._then);

  final TokenExpiredEvent _self;
  final $Res Function(TokenExpiredEvent) _then;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? source = null,}) {
  return _then(TokenExpiredEvent(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ErrorSource,
  ));
}


}

/// @nodoc
mixin _$SessionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionState()';
}


}

/// @nodoc
class $SessionStateCopyWith<$Res>  {
$SessionStateCopyWith(SessionState _, $Res Function(SessionState) __);
}


/// Adds pattern-matching-related methods to [SessionState].
extension SessionStatePatterns on SessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SessionInitial value)?  initial,TResult Function( SessionIdleTimedOut value)?  idleTimedOut,TResult Function( SessionTokenExpired value)?  tokenExpired,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SessionInitial() when initial != null:
return initial(_that);case SessionIdleTimedOut() when idleTimedOut != null:
return idleTimedOut(_that);case SessionTokenExpired() when tokenExpired != null:
return tokenExpired(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SessionInitial value)  initial,required TResult Function( SessionIdleTimedOut value)  idleTimedOut,required TResult Function( SessionTokenExpired value)  tokenExpired,}){
final _that = this;
switch (_that) {
case SessionInitial():
return initial(_that);case SessionIdleTimedOut():
return idleTimedOut(_that);case SessionTokenExpired():
return tokenExpired(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SessionInitial value)?  initial,TResult? Function( SessionIdleTimedOut value)?  idleTimedOut,TResult? Function( SessionTokenExpired value)?  tokenExpired,}){
final _that = this;
switch (_that) {
case SessionInitial() when initial != null:
return initial(_that);case SessionIdleTimedOut() when idleTimedOut != null:
return idleTimedOut(_that);case SessionTokenExpired() when tokenExpired != null:
return tokenExpired(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( int randomId)?  idleTimedOut,TResult Function( ErrorSource source)?  tokenExpired,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SessionInitial() when initial != null:
return initial();case SessionIdleTimedOut() when idleTimedOut != null:
return idleTimedOut(_that.randomId);case SessionTokenExpired() when tokenExpired != null:
return tokenExpired(_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( int randomId)  idleTimedOut,required TResult Function( ErrorSource source)  tokenExpired,}) {final _that = this;
switch (_that) {
case SessionInitial():
return initial();case SessionIdleTimedOut():
return idleTimedOut(_that.randomId);case SessionTokenExpired():
return tokenExpired(_that.source);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( int randomId)?  idleTimedOut,TResult? Function( ErrorSource source)?  tokenExpired,}) {final _that = this;
switch (_that) {
case SessionInitial() when initial != null:
return initial();case SessionIdleTimedOut() when idleTimedOut != null:
return idleTimedOut(_that.randomId);case SessionTokenExpired() when tokenExpired != null:
return tokenExpired(_that.source);case _:
  return null;

}
}

}

/// @nodoc


class SessionInitial implements SessionState {
  const SessionInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionState.initial()';
}


}




/// @nodoc


class SessionIdleTimedOut implements SessionState {
  const SessionIdleTimedOut({required this.randomId});
  

 final  int randomId;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionIdleTimedOutCopyWith<SessionIdleTimedOut> get copyWith => _$SessionIdleTimedOutCopyWithImpl<SessionIdleTimedOut>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionIdleTimedOut&&(identical(other.randomId, randomId) || other.randomId == randomId));
}


@override
int get hashCode => Object.hash(runtimeType,randomId);

@override
String toString() {
  return 'SessionState.idleTimedOut(randomId: $randomId)';
}


}

/// @nodoc
abstract mixin class $SessionIdleTimedOutCopyWith<$Res> implements $SessionStateCopyWith<$Res> {
  factory $SessionIdleTimedOutCopyWith(SessionIdleTimedOut value, $Res Function(SessionIdleTimedOut) _then) = _$SessionIdleTimedOutCopyWithImpl;
@useResult
$Res call({
 int randomId
});




}
/// @nodoc
class _$SessionIdleTimedOutCopyWithImpl<$Res>
    implements $SessionIdleTimedOutCopyWith<$Res> {
  _$SessionIdleTimedOutCopyWithImpl(this._self, this._then);

  final SessionIdleTimedOut _self;
  final $Res Function(SessionIdleTimedOut) _then;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? randomId = null,}) {
  return _then(SessionIdleTimedOut(
randomId: null == randomId ? _self.randomId : randomId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SessionTokenExpired implements SessionState {
  const SessionTokenExpired({required this.source});
  

 final  ErrorSource source;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionTokenExpiredCopyWith<SessionTokenExpired> get copyWith => _$SessionTokenExpiredCopyWithImpl<SessionTokenExpired>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionTokenExpired&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode => Object.hash(runtimeType,source);

@override
String toString() {
  return 'SessionState.tokenExpired(source: $source)';
}


}

/// @nodoc
abstract mixin class $SessionTokenExpiredCopyWith<$Res> implements $SessionStateCopyWith<$Res> {
  factory $SessionTokenExpiredCopyWith(SessionTokenExpired value, $Res Function(SessionTokenExpired) _then) = _$SessionTokenExpiredCopyWithImpl;
@useResult
$Res call({
 ErrorSource source
});




}
/// @nodoc
class _$SessionTokenExpiredCopyWithImpl<$Res>
    implements $SessionTokenExpiredCopyWith<$Res> {
  _$SessionTokenExpiredCopyWithImpl(this._self, this._then);

  final SessionTokenExpired _self;
  final $Res Function(SessionTokenExpired) _then;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? source = null,}) {
  return _then(SessionTokenExpired(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ErrorSource,
  ));
}


}

// dart format on
