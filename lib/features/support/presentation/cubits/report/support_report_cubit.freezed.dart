// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_report_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SupportReportState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportReportState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SupportReportState()';
}


}

/// @nodoc
class $SupportReportStateCopyWith<$Res>  {
$SupportReportStateCopyWith(SupportReportState _, $Res Function(SupportReportState) __);
}


/// Adds pattern-matching-related methods to [SupportReportState].
extension SupportReportStatePatterns on SupportReportState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SupportReportInitial value)?  initial,TResult Function( _SupportReportSubmitting value)?  submitting,TResult Function( _SupportReportSuccess value)?  success,TResult Function( _SupportReportFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupportReportInitial() when initial != null:
return initial(_that);case _SupportReportSubmitting() when submitting != null:
return submitting(_that);case _SupportReportSuccess() when success != null:
return success(_that);case _SupportReportFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SupportReportInitial value)  initial,required TResult Function( _SupportReportSubmitting value)  submitting,required TResult Function( _SupportReportSuccess value)  success,required TResult Function( _SupportReportFailure value)  failure,}){
final _that = this;
switch (_that) {
case _SupportReportInitial():
return initial(_that);case _SupportReportSubmitting():
return submitting(_that);case _SupportReportSuccess():
return success(_that);case _SupportReportFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SupportReportInitial value)?  initial,TResult? Function( _SupportReportSubmitting value)?  submitting,TResult? Function( _SupportReportSuccess value)?  success,TResult? Function( _SupportReportFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _SupportReportInitial() when initial != null:
return initial(_that);case _SupportReportSubmitting() when submitting != null:
return submitting(_that);case _SupportReportSuccess() when success != null:
return success(_that);case _SupportReportFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  submitting,TResult Function( SupportTicketEntity ticket)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupportReportInitial() when initial != null:
return initial();case _SupportReportSubmitting() when submitting != null:
return submitting();case _SupportReportSuccess() when success != null:
return success(_that.ticket);case _SupportReportFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  submitting,required TResult Function( SupportTicketEntity ticket)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _SupportReportInitial():
return initial();case _SupportReportSubmitting():
return submitting();case _SupportReportSuccess():
return success(_that.ticket);case _SupportReportFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  submitting,TResult? Function( SupportTicketEntity ticket)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _SupportReportInitial() when initial != null:
return initial();case _SupportReportSubmitting() when submitting != null:
return submitting();case _SupportReportSuccess() when success != null:
return success(_that.ticket);case _SupportReportFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _SupportReportInitial implements SupportReportState {
  const _SupportReportInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportReportInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SupportReportState.initial()';
}


}




/// @nodoc


class _SupportReportSubmitting implements SupportReportState {
  const _SupportReportSubmitting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportReportSubmitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SupportReportState.submitting()';
}


}




/// @nodoc


class _SupportReportSuccess implements SupportReportState {
  const _SupportReportSuccess({required this.ticket});
  

 final  SupportTicketEntity ticket;

/// Create a copy of SupportReportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportReportSuccessCopyWith<_SupportReportSuccess> get copyWith => __$SupportReportSuccessCopyWithImpl<_SupportReportSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportReportSuccess&&(identical(other.ticket, ticket) || other.ticket == ticket));
}


@override
int get hashCode => Object.hash(runtimeType,ticket);

@override
String toString() {
  return 'SupportReportState.success(ticket: $ticket)';
}


}

/// @nodoc
abstract mixin class _$SupportReportSuccessCopyWith<$Res> implements $SupportReportStateCopyWith<$Res> {
  factory _$SupportReportSuccessCopyWith(_SupportReportSuccess value, $Res Function(_SupportReportSuccess) _then) = __$SupportReportSuccessCopyWithImpl;
@useResult
$Res call({
 SupportTicketEntity ticket
});




}
/// @nodoc
class __$SupportReportSuccessCopyWithImpl<$Res>
    implements _$SupportReportSuccessCopyWith<$Res> {
  __$SupportReportSuccessCopyWithImpl(this._self, this._then);

  final _SupportReportSuccess _self;
  final $Res Function(_SupportReportSuccess) _then;

/// Create a copy of SupportReportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ticket = null,}) {
  return _then(_SupportReportSuccess(
ticket: null == ticket ? _self.ticket : ticket // ignore: cast_nullable_to_non_nullable
as SupportTicketEntity,
  ));
}


}

/// @nodoc


class _SupportReportFailure implements SupportReportState {
  const _SupportReportFailure({required this.message});
  

 final  String message;

/// Create a copy of SupportReportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportReportFailureCopyWith<_SupportReportFailure> get copyWith => __$SupportReportFailureCopyWithImpl<_SupportReportFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportReportFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SupportReportState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SupportReportFailureCopyWith<$Res> implements $SupportReportStateCopyWith<$Res> {
  factory _$SupportReportFailureCopyWith(_SupportReportFailure value, $Res Function(_SupportReportFailure) _then) = __$SupportReportFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$SupportReportFailureCopyWithImpl<$Res>
    implements _$SupportReportFailureCopyWith<$Res> {
  __$SupportReportFailureCopyWithImpl(this._self, this._then);

  final _SupportReportFailure _self;
  final $Res Function(_SupportReportFailure) _then;

/// Create a copy of SupportReportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_SupportReportFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
