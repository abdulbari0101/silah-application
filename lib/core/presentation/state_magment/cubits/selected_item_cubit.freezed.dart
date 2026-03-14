// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_item_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SelectedItemState<T> {

 T? get selected;
/// Create a copy of SelectedItemState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectedItemStateCopyWith<T, SelectedItemState<T>> get copyWith => _$SelectedItemStateCopyWithImpl<T, SelectedItemState<T>>(this as SelectedItemState<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedItemState<T>&&const DeepCollectionEquality().equals(other.selected, selected));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(selected));

@override
String toString() {
  return 'SelectedItemState<$T>(selected: $selected)';
}


}

/// @nodoc
abstract mixin class $SelectedItemStateCopyWith<T,$Res>  {
  factory $SelectedItemStateCopyWith(SelectedItemState<T> value, $Res Function(SelectedItemState<T>) _then) = _$SelectedItemStateCopyWithImpl;
@useResult
$Res call({
 T? selected
});




}
/// @nodoc
class _$SelectedItemStateCopyWithImpl<T,$Res>
    implements $SelectedItemStateCopyWith<T, $Res> {
  _$SelectedItemStateCopyWithImpl(this._self, this._then);

  final SelectedItemState<T> _self;
  final $Res Function(SelectedItemState<T>) _then;

/// Create a copy of SelectedItemState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selected = freezed,}) {
  return _then(_self.copyWith(
selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}

}


/// Adds pattern-matching-related methods to [SelectedItemState].
extension SelectedItemStatePatterns<T> on SelectedItemState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectedItemState<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectedItemState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectedItemState<T> value)  $default,){
final _that = this;
switch (_that) {
case _SelectedItemState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectedItemState<T> value)?  $default,){
final _that = this;
switch (_that) {
case _SelectedItemState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( T? selected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectedItemState() when $default != null:
return $default(_that.selected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( T? selected)  $default,) {final _that = this;
switch (_that) {
case _SelectedItemState():
return $default(_that.selected);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( T? selected)?  $default,) {final _that = this;
switch (_that) {
case _SelectedItemState() when $default != null:
return $default(_that.selected);case _:
  return null;

}
}

}

/// @nodoc


class _SelectedItemState<T> implements SelectedItemState<T> {
  const _SelectedItemState({this.selected});
  

@override final  T? selected;

/// Create a copy of SelectedItemState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectedItemStateCopyWith<T, _SelectedItemState<T>> get copyWith => __$SelectedItemStateCopyWithImpl<T, _SelectedItemState<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectedItemState<T>&&const DeepCollectionEquality().equals(other.selected, selected));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(selected));

@override
String toString() {
  return 'SelectedItemState<$T>(selected: $selected)';
}


}

/// @nodoc
abstract mixin class _$SelectedItemStateCopyWith<T,$Res> implements $SelectedItemStateCopyWith<T, $Res> {
  factory _$SelectedItemStateCopyWith(_SelectedItemState<T> value, $Res Function(_SelectedItemState<T>) _then) = __$SelectedItemStateCopyWithImpl;
@override @useResult
$Res call({
 T? selected
});




}
/// @nodoc
class __$SelectedItemStateCopyWithImpl<T,$Res>
    implements _$SelectedItemStateCopyWith<T, $Res> {
  __$SelectedItemStateCopyWithImpl(this._self, this._then);

  final _SelectedItemState<T> _self;
  final $Res Function(_SelectedItemState<T>) _then;

/// Create a copy of SelectedItemState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selected = freezed,}) {
  return _then(_SelectedItemState<T>(
selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}

// dart format on
