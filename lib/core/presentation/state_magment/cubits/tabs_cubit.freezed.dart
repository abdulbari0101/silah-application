// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tabs_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TabsState {

 List<TabView> get tabs; int get selectedIndex;
/// Create a copy of TabsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TabsStateCopyWith<TabsState> get copyWith => _$TabsStateCopyWithImpl<TabsState>(this as TabsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TabsState&&const DeepCollectionEquality().equals(other.tabs, tabs)&&(identical(other.selectedIndex, selectedIndex) || other.selectedIndex == selectedIndex));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tabs),selectedIndex);

@override
String toString() {
  return 'TabsState(tabs: $tabs, selectedIndex: $selectedIndex)';
}


}

/// @nodoc
abstract mixin class $TabsStateCopyWith<$Res>  {
  factory $TabsStateCopyWith(TabsState value, $Res Function(TabsState) _then) = _$TabsStateCopyWithImpl;
@useResult
$Res call({
 List<TabView> tabs, int selectedIndex
});




}
/// @nodoc
class _$TabsStateCopyWithImpl<$Res>
    implements $TabsStateCopyWith<$Res> {
  _$TabsStateCopyWithImpl(this._self, this._then);

  final TabsState _self;
  final $Res Function(TabsState) _then;

/// Create a copy of TabsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tabs = null,Object? selectedIndex = null,}) {
  return _then(_self.copyWith(
tabs: null == tabs ? _self.tabs : tabs // ignore: cast_nullable_to_non_nullable
as List<TabView>,selectedIndex: null == selectedIndex ? _self.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TabsState].
extension TabsStatePatterns on TabsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TabsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TabsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TabsState value)  $default,){
final _that = this;
switch (_that) {
case _TabsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TabsState value)?  $default,){
final _that = this;
switch (_that) {
case _TabsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TabView> tabs,  int selectedIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TabsState() when $default != null:
return $default(_that.tabs,_that.selectedIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TabView> tabs,  int selectedIndex)  $default,) {final _that = this;
switch (_that) {
case _TabsState():
return $default(_that.tabs,_that.selectedIndex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TabView> tabs,  int selectedIndex)?  $default,) {final _that = this;
switch (_that) {
case _TabsState() when $default != null:
return $default(_that.tabs,_that.selectedIndex);case _:
  return null;

}
}

}

/// @nodoc


class _TabsState implements TabsState {
  const _TabsState({required final  List<TabView> tabs, required this.selectedIndex}): _tabs = tabs;
  

 final  List<TabView> _tabs;
@override List<TabView> get tabs {
  if (_tabs is EqualUnmodifiableListView) return _tabs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tabs);
}

@override final  int selectedIndex;

/// Create a copy of TabsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TabsStateCopyWith<_TabsState> get copyWith => __$TabsStateCopyWithImpl<_TabsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TabsState&&const DeepCollectionEquality().equals(other._tabs, _tabs)&&(identical(other.selectedIndex, selectedIndex) || other.selectedIndex == selectedIndex));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tabs),selectedIndex);

@override
String toString() {
  return 'TabsState(tabs: $tabs, selectedIndex: $selectedIndex)';
}


}

/// @nodoc
abstract mixin class _$TabsStateCopyWith<$Res> implements $TabsStateCopyWith<$Res> {
  factory _$TabsStateCopyWith(_TabsState value, $Res Function(_TabsState) _then) = __$TabsStateCopyWithImpl;
@override @useResult
$Res call({
 List<TabView> tabs, int selectedIndex
});




}
/// @nodoc
class __$TabsStateCopyWithImpl<$Res>
    implements _$TabsStateCopyWith<$Res> {
  __$TabsStateCopyWithImpl(this._self, this._then);

  final _TabsState _self;
  final $Res Function(_TabsState) _then;

/// Create a copy of TabsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tabs = null,Object? selectedIndex = null,}) {
  return _then(_TabsState(
tabs: null == tabs ? _self._tabs : tabs // ignore: cast_nullable_to_non_nullable
as List<TabView>,selectedIndex: null == selectedIndex ? _self.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
