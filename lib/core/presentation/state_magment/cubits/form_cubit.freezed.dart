// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FormCubitState {

 bool get isValid;
/// Create a copy of FormCubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormCubitStateCopyWith<FormCubitState> get copyWith => _$FormCubitStateCopyWithImpl<FormCubitState>(this as FormCubitState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormCubitState&&(identical(other.isValid, isValid) || other.isValid == isValid));
}


@override
int get hashCode => Object.hash(runtimeType,isValid);

@override
String toString() {
  return 'FormCubitState(isValid: $isValid)';
}


}

/// @nodoc
abstract mixin class $FormCubitStateCopyWith<$Res>  {
  factory $FormCubitStateCopyWith(FormCubitState value, $Res Function(FormCubitState) _then) = _$FormCubitStateCopyWithImpl;
@useResult
$Res call({
 bool isValid
});




}
/// @nodoc
class _$FormCubitStateCopyWithImpl<$Res>
    implements $FormCubitStateCopyWith<$Res> {
  _$FormCubitStateCopyWithImpl(this._self, this._then);

  final FormCubitState _self;
  final $Res Function(FormCubitState) _then;

/// Create a copy of FormCubitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isValid = null,}) {
  return _then(_self.copyWith(
isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FormCubitState].
extension FormCubitStatePatterns on FormCubitState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormCubitState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormCubitState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormCubitState value)  $default,){
final _that = this;
switch (_that) {
case _FormCubitState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormCubitState value)?  $default,){
final _that = this;
switch (_that) {
case _FormCubitState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isValid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormCubitState() when $default != null:
return $default(_that.isValid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isValid)  $default,) {final _that = this;
switch (_that) {
case _FormCubitState():
return $default(_that.isValid);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isValid)?  $default,) {final _that = this;
switch (_that) {
case _FormCubitState() when $default != null:
return $default(_that.isValid);case _:
  return null;

}
}

}

/// @nodoc


class _FormCubitState implements FormCubitState {
  const _FormCubitState({this.isValid = false});
  

@override@JsonKey() final  bool isValid;

/// Create a copy of FormCubitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormCubitStateCopyWith<_FormCubitState> get copyWith => __$FormCubitStateCopyWithImpl<_FormCubitState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormCubitState&&(identical(other.isValid, isValid) || other.isValid == isValid));
}


@override
int get hashCode => Object.hash(runtimeType,isValid);

@override
String toString() {
  return 'FormCubitState(isValid: $isValid)';
}


}

/// @nodoc
abstract mixin class _$FormCubitStateCopyWith<$Res> implements $FormCubitStateCopyWith<$Res> {
  factory _$FormCubitStateCopyWith(_FormCubitState value, $Res Function(_FormCubitState) _then) = __$FormCubitStateCopyWithImpl;
@override @useResult
$Res call({
 bool isValid
});




}
/// @nodoc
class __$FormCubitStateCopyWithImpl<$Res>
    implements _$FormCubitStateCopyWith<$Res> {
  __$FormCubitStateCopyWithImpl(this._self, this._then);

  final _FormCubitState _self;
  final $Res Function(_FormCubitState) _then;

/// Create a copy of FormCubitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isValid = null,}) {
  return _then(_FormCubitState(
isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
