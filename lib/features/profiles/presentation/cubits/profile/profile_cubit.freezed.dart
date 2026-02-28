// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState()';
}


}

/// @nodoc
class $ProfileStateCopyWith<$Res>  {
$ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ProfileInitial value)?  initial,TResult Function( _ProfileLoading value)?  loading,TResult Function( _ProfileLoaded value)?  loaded,TResult Function( _ProfileError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileInitial() when initial != null:
return initial(_that);case _ProfileLoading() when loading != null:
return loading(_that);case _ProfileLoaded() when loaded != null:
return loaded(_that);case _ProfileError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ProfileInitial value)  initial,required TResult Function( _ProfileLoading value)  loading,required TResult Function( _ProfileLoaded value)  loaded,required TResult Function( _ProfileError value)  error,}){
final _that = this;
switch (_that) {
case _ProfileInitial():
return initial(_that);case _ProfileLoading():
return loading(_that);case _ProfileLoaded():
return loaded(_that);case _ProfileError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ProfileInitial value)?  initial,TResult? Function( _ProfileLoading value)?  loading,TResult? Function( _ProfileLoaded value)?  loaded,TResult? Function( _ProfileError value)?  error,}){
final _that = this;
switch (_that) {
case _ProfileInitial() when initial != null:
return initial(_that);case _ProfileLoading() when loading != null:
return loading(_that);case _ProfileLoaded() when loaded != null:
return loaded(_that);case _ProfileError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ProfileEntity profile,  bool? isSaving)?  loaded,TResult Function( String message,  ProfileEntity? profile)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileInitial() when initial != null:
return initial();case _ProfileLoading() when loading != null:
return loading();case _ProfileLoaded() when loaded != null:
return loaded(_that.profile,_that.isSaving);case _ProfileError() when error != null:
return error(_that.message,_that.profile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ProfileEntity profile,  bool? isSaving)  loaded,required TResult Function( String message,  ProfileEntity? profile)  error,}) {final _that = this;
switch (_that) {
case _ProfileInitial():
return initial();case _ProfileLoading():
return loading();case _ProfileLoaded():
return loaded(_that.profile,_that.isSaving);case _ProfileError():
return error(_that.message,_that.profile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ProfileEntity profile,  bool? isSaving)?  loaded,TResult? Function( String message,  ProfileEntity? profile)?  error,}) {final _that = this;
switch (_that) {
case _ProfileInitial() when initial != null:
return initial();case _ProfileLoading() when loading != null:
return loading();case _ProfileLoaded() when loaded != null:
return loaded(_that.profile,_that.isSaving);case _ProfileError() when error != null:
return error(_that.message,_that.profile);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileInitial implements ProfileState {
  const _ProfileInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.initial()';
}


}




/// @nodoc


class _ProfileLoading implements ProfileState {
  const _ProfileLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.loading()';
}


}




/// @nodoc


class _ProfileLoaded implements ProfileState {
  const _ProfileLoaded({required this.profile, this.isSaving});
  

 final  ProfileEntity profile;
 final  bool? isSaving;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileLoadedCopyWith<_ProfileLoaded> get copyWith => __$ProfileLoadedCopyWithImpl<_ProfileLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileLoaded&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving));
}


@override
int get hashCode => Object.hash(runtimeType,profile,isSaving);

@override
String toString() {
  return 'ProfileState.loaded(profile: $profile, isSaving: $isSaving)';
}


}

/// @nodoc
abstract mixin class _$ProfileLoadedCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileLoadedCopyWith(_ProfileLoaded value, $Res Function(_ProfileLoaded) _then) = __$ProfileLoadedCopyWithImpl;
@useResult
$Res call({
 ProfileEntity profile, bool? isSaving
});




}
/// @nodoc
class __$ProfileLoadedCopyWithImpl<$Res>
    implements _$ProfileLoadedCopyWith<$Res> {
  __$ProfileLoadedCopyWithImpl(this._self, this._then);

  final _ProfileLoaded _self;
  final $Res Function(_ProfileLoaded) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,Object? isSaving = freezed,}) {
  return _then(_ProfileLoaded(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileEntity,isSaving: freezed == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc


class _ProfileError implements ProfileState {
  const _ProfileError({required this.message, this.profile});
  

 final  String message;
 final  ProfileEntity? profile;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileErrorCopyWith<_ProfileError> get copyWith => __$ProfileErrorCopyWithImpl<_ProfileError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileError&&(identical(other.message, message) || other.message == message)&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,message,profile);

@override
String toString() {
  return 'ProfileState.error(message: $message, profile: $profile)';
}


}

/// @nodoc
abstract mixin class _$ProfileErrorCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileErrorCopyWith(_ProfileError value, $Res Function(_ProfileError) _then) = __$ProfileErrorCopyWithImpl;
@useResult
$Res call({
 String message, ProfileEntity? profile
});




}
/// @nodoc
class __$ProfileErrorCopyWithImpl<$Res>
    implements _$ProfileErrorCopyWith<$Res> {
  __$ProfileErrorCopyWithImpl(this._self, this._then);

  final _ProfileError _self;
  final $Res Function(_ProfileError) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? profile = freezed,}) {
  return _then(_ProfileError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileEntity?,
  ));
}


}

// dart format on
