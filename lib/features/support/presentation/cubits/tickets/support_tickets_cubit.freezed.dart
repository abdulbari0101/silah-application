// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_tickets_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SupportTicketsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportTicketsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SupportTicketsState()';
}


}

/// @nodoc
class $SupportTicketsStateCopyWith<$Res>  {
$SupportTicketsStateCopyWith(SupportTicketsState _, $Res Function(SupportTicketsState) __);
}


/// Adds pattern-matching-related methods to [SupportTicketsState].
extension SupportTicketsStatePatterns on SupportTicketsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SupportTicketsLoading value)?  loading,TResult Function( _SupportTicketsEmpty value)?  empty,TResult Function( _SupportTicketsReady value)?  ready,TResult Function( _SupportTicketsFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupportTicketsLoading() when loading != null:
return loading(_that);case _SupportTicketsEmpty() when empty != null:
return empty(_that);case _SupportTicketsReady() when ready != null:
return ready(_that);case _SupportTicketsFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SupportTicketsLoading value)  loading,required TResult Function( _SupportTicketsEmpty value)  empty,required TResult Function( _SupportTicketsReady value)  ready,required TResult Function( _SupportTicketsFailure value)  failure,}){
final _that = this;
switch (_that) {
case _SupportTicketsLoading():
return loading(_that);case _SupportTicketsEmpty():
return empty(_that);case _SupportTicketsReady():
return ready(_that);case _SupportTicketsFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SupportTicketsLoading value)?  loading,TResult? Function( _SupportTicketsEmpty value)?  empty,TResult? Function( _SupportTicketsReady value)?  ready,TResult? Function( _SupportTicketsFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _SupportTicketsLoading() when loading != null:
return loading(_that);case _SupportTicketsEmpty() when empty != null:
return empty(_that);case _SupportTicketsReady() when ready != null:
return ready(_that);case _SupportTicketsFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function()?  empty,TResult Function( List<SupportTicketEntity> tickets)?  ready,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupportTicketsLoading() when loading != null:
return loading();case _SupportTicketsEmpty() when empty != null:
return empty();case _SupportTicketsReady() when ready != null:
return ready(_that.tickets);case _SupportTicketsFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function()  empty,required TResult Function( List<SupportTicketEntity> tickets)  ready,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _SupportTicketsLoading():
return loading();case _SupportTicketsEmpty():
return empty();case _SupportTicketsReady():
return ready(_that.tickets);case _SupportTicketsFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function()?  empty,TResult? Function( List<SupportTicketEntity> tickets)?  ready,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _SupportTicketsLoading() when loading != null:
return loading();case _SupportTicketsEmpty() when empty != null:
return empty();case _SupportTicketsReady() when ready != null:
return ready(_that.tickets);case _SupportTicketsFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _SupportTicketsLoading implements SupportTicketsState {
  const _SupportTicketsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportTicketsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SupportTicketsState.loading()';
}


}




/// @nodoc


class _SupportTicketsEmpty implements SupportTicketsState {
  const _SupportTicketsEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportTicketsEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SupportTicketsState.empty()';
}


}




/// @nodoc


class _SupportTicketsReady implements SupportTicketsState {
  const _SupportTicketsReady({required final  List<SupportTicketEntity> tickets}): _tickets = tickets;
  

 final  List<SupportTicketEntity> _tickets;
 List<SupportTicketEntity> get tickets {
  if (_tickets is EqualUnmodifiableListView) return _tickets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tickets);
}


/// Create a copy of SupportTicketsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportTicketsReadyCopyWith<_SupportTicketsReady> get copyWith => __$SupportTicketsReadyCopyWithImpl<_SupportTicketsReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportTicketsReady&&const DeepCollectionEquality().equals(other._tickets, _tickets));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tickets));

@override
String toString() {
  return 'SupportTicketsState.ready(tickets: $tickets)';
}


}

/// @nodoc
abstract mixin class _$SupportTicketsReadyCopyWith<$Res> implements $SupportTicketsStateCopyWith<$Res> {
  factory _$SupportTicketsReadyCopyWith(_SupportTicketsReady value, $Res Function(_SupportTicketsReady) _then) = __$SupportTicketsReadyCopyWithImpl;
@useResult
$Res call({
 List<SupportTicketEntity> tickets
});




}
/// @nodoc
class __$SupportTicketsReadyCopyWithImpl<$Res>
    implements _$SupportTicketsReadyCopyWith<$Res> {
  __$SupportTicketsReadyCopyWithImpl(this._self, this._then);

  final _SupportTicketsReady _self;
  final $Res Function(_SupportTicketsReady) _then;

/// Create a copy of SupportTicketsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tickets = null,}) {
  return _then(_SupportTicketsReady(
tickets: null == tickets ? _self._tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<SupportTicketEntity>,
  ));
}


}

/// @nodoc


class _SupportTicketsFailure implements SupportTicketsState {
  const _SupportTicketsFailure({required this.message});
  

 final  String message;

/// Create a copy of SupportTicketsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportTicketsFailureCopyWith<_SupportTicketsFailure> get copyWith => __$SupportTicketsFailureCopyWithImpl<_SupportTicketsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportTicketsFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SupportTicketsState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SupportTicketsFailureCopyWith<$Res> implements $SupportTicketsStateCopyWith<$Res> {
  factory _$SupportTicketsFailureCopyWith(_SupportTicketsFailure value, $Res Function(_SupportTicketsFailure) _then) = __$SupportTicketsFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$SupportTicketsFailureCopyWithImpl<$Res>
    implements _$SupportTicketsFailureCopyWith<$Res> {
  __$SupportTicketsFailureCopyWithImpl(this._self, this._then);

  final _SupportTicketsFailure _self;
  final $Res Function(_SupportTicketsFailure) _then;

/// Create a copy of SupportTicketsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_SupportTicketsFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
