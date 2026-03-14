// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_setting_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserSettingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSettingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserSettingEvent()';
}


}

/// @nodoc
class $UserSettingEventCopyWith<$Res>  {
$UserSettingEventCopyWith(UserSettingEvent _, $Res Function(UserSettingEvent) __);
}


/// Adds pattern-matching-related methods to [UserSettingEvent].
extension UserSettingEventPatterns on UserSettingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InjectUserSettingEvent value)?  inject,TResult Function( GetUserSettingEvent value)?  get,TResult Function( UpdateUserSettingEvent value)?  update,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InjectUserSettingEvent() when inject != null:
return inject(_that);case GetUserSettingEvent() when get != null:
return get(_that);case UpdateUserSettingEvent() when update != null:
return update(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InjectUserSettingEvent value)  inject,required TResult Function( GetUserSettingEvent value)  get,required TResult Function( UpdateUserSettingEvent value)  update,}){
final _that = this;
switch (_that) {
case InjectUserSettingEvent():
return inject(_that);case GetUserSettingEvent():
return get(_that);case UpdateUserSettingEvent():
return update(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InjectUserSettingEvent value)?  inject,TResult? Function( GetUserSettingEvent value)?  get,TResult? Function( UpdateUserSettingEvent value)?  update,}){
final _that = this;
switch (_that) {
case InjectUserSettingEvent() when inject != null:
return inject(_that);case GetUserSettingEvent() when get != null:
return get(_that);case UpdateUserSettingEvent() when update != null:
return update(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( UserSettingEntity setting)?  inject,TResult Function()?  get,TResult Function( bool? notification,  bool isRefresh,  bool rebuildApp)?  update,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InjectUserSettingEvent() when inject != null:
return inject(_that.setting);case GetUserSettingEvent() when get != null:
return get();case UpdateUserSettingEvent() when update != null:
return update(_that.notification,_that.isRefresh,_that.rebuildApp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( UserSettingEntity setting)  inject,required TResult Function()  get,required TResult Function( bool? notification,  bool isRefresh,  bool rebuildApp)  update,}) {final _that = this;
switch (_that) {
case InjectUserSettingEvent():
return inject(_that.setting);case GetUserSettingEvent():
return get();case UpdateUserSettingEvent():
return update(_that.notification,_that.isRefresh,_that.rebuildApp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( UserSettingEntity setting)?  inject,TResult? Function()?  get,TResult? Function( bool? notification,  bool isRefresh,  bool rebuildApp)?  update,}) {final _that = this;
switch (_that) {
case InjectUserSettingEvent() when inject != null:
return inject(_that.setting);case GetUserSettingEvent() when get != null:
return get();case UpdateUserSettingEvent() when update != null:
return update(_that.notification,_that.isRefresh,_that.rebuildApp);case _:
  return null;

}
}

}

/// @nodoc


class InjectUserSettingEvent implements UserSettingEvent {
  const InjectUserSettingEvent({required this.setting});
  

 final  UserSettingEntity setting;

/// Create a copy of UserSettingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InjectUserSettingEventCopyWith<InjectUserSettingEvent> get copyWith => _$InjectUserSettingEventCopyWithImpl<InjectUserSettingEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InjectUserSettingEvent&&(identical(other.setting, setting) || other.setting == setting));
}


@override
int get hashCode => Object.hash(runtimeType,setting);

@override
String toString() {
  return 'UserSettingEvent.inject(setting: $setting)';
}


}

/// @nodoc
abstract mixin class $InjectUserSettingEventCopyWith<$Res> implements $UserSettingEventCopyWith<$Res> {
  factory $InjectUserSettingEventCopyWith(InjectUserSettingEvent value, $Res Function(InjectUserSettingEvent) _then) = _$InjectUserSettingEventCopyWithImpl;
@useResult
$Res call({
 UserSettingEntity setting
});




}
/// @nodoc
class _$InjectUserSettingEventCopyWithImpl<$Res>
    implements $InjectUserSettingEventCopyWith<$Res> {
  _$InjectUserSettingEventCopyWithImpl(this._self, this._then);

  final InjectUserSettingEvent _self;
  final $Res Function(InjectUserSettingEvent) _then;

/// Create a copy of UserSettingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? setting = null,}) {
  return _then(InjectUserSettingEvent(
setting: null == setting ? _self.setting : setting // ignore: cast_nullable_to_non_nullable
as UserSettingEntity,
  ));
}


}

/// @nodoc


class GetUserSettingEvent implements UserSettingEvent {
  const GetUserSettingEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetUserSettingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserSettingEvent.get()';
}


}




/// @nodoc


class UpdateUserSettingEvent implements UserSettingEvent {
  const UpdateUserSettingEvent({this.notification, this.isRefresh = true, this.rebuildApp = true});
  

 final  bool? notification;
@JsonKey() final  bool isRefresh;
@JsonKey() final  bool rebuildApp;

/// Create a copy of UserSettingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateUserSettingEventCopyWith<UpdateUserSettingEvent> get copyWith => _$UpdateUserSettingEventCopyWithImpl<UpdateUserSettingEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateUserSettingEvent&&(identical(other.notification, notification) || other.notification == notification)&&(identical(other.isRefresh, isRefresh) || other.isRefresh == isRefresh)&&(identical(other.rebuildApp, rebuildApp) || other.rebuildApp == rebuildApp));
}


@override
int get hashCode => Object.hash(runtimeType,notification,isRefresh,rebuildApp);

@override
String toString() {
  return 'UserSettingEvent.update(notification: $notification, isRefresh: $isRefresh, rebuildApp: $rebuildApp)';
}


}

/// @nodoc
abstract mixin class $UpdateUserSettingEventCopyWith<$Res> implements $UserSettingEventCopyWith<$Res> {
  factory $UpdateUserSettingEventCopyWith(UpdateUserSettingEvent value, $Res Function(UpdateUserSettingEvent) _then) = _$UpdateUserSettingEventCopyWithImpl;
@useResult
$Res call({
 bool? notification, bool isRefresh, bool rebuildApp
});




}
/// @nodoc
class _$UpdateUserSettingEventCopyWithImpl<$Res>
    implements $UpdateUserSettingEventCopyWith<$Res> {
  _$UpdateUserSettingEventCopyWithImpl(this._self, this._then);

  final UpdateUserSettingEvent _self;
  final $Res Function(UpdateUserSettingEvent) _then;

/// Create a copy of UserSettingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notification = freezed,Object? isRefresh = null,Object? rebuildApp = null,}) {
  return _then(UpdateUserSettingEvent(
notification: freezed == notification ? _self.notification : notification // ignore: cast_nullable_to_non_nullable
as bool?,isRefresh: null == isRefresh ? _self.isRefresh : isRefresh // ignore: cast_nullable_to_non_nullable
as bool,rebuildApp: null == rebuildApp ? _self.rebuildApp : rebuildApp // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$UserSettingState {

 UserSettingEntity get data;
/// Create a copy of UserSettingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSettingStateCopyWith<UserSettingState> get copyWith => _$UserSettingStateCopyWithImpl<UserSettingState>(this as UserSettingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSettingState&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'UserSettingState(data: $data)';
}


}

/// @nodoc
abstract mixin class $UserSettingStateCopyWith<$Res>  {
  factory $UserSettingStateCopyWith(UserSettingState value, $Res Function(UserSettingState) _then) = _$UserSettingStateCopyWithImpl;
@useResult
$Res call({
 UserSettingEntity data
});




}
/// @nodoc
class _$UserSettingStateCopyWithImpl<$Res>
    implements $UserSettingStateCopyWith<$Res> {
  _$UserSettingStateCopyWithImpl(this._self, this._then);

  final UserSettingState _self;
  final $Res Function(UserSettingState) _then;

/// Create a copy of UserSettingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UserSettingEntity,
  ));
}

}


/// Adds pattern-matching-related methods to [UserSettingState].
extension UserSettingStatePatterns on UserSettingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UserSettingInitial value)?  initial,TResult Function( UserSettingLoading value)?  loading,TResult Function( UserSettingError value)?  error,TResult Function( UserSettingLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UserSettingInitial() when initial != null:
return initial(_that);case UserSettingLoading() when loading != null:
return loading(_that);case UserSettingError() when error != null:
return error(_that);case UserSettingLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UserSettingInitial value)  initial,required TResult Function( UserSettingLoading value)  loading,required TResult Function( UserSettingError value)  error,required TResult Function( UserSettingLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case UserSettingInitial():
return initial(_that);case UserSettingLoading():
return loading(_that);case UserSettingError():
return error(_that);case UserSettingLoaded():
return loaded(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UserSettingInitial value)?  initial,TResult? Function( UserSettingLoading value)?  loading,TResult? Function( UserSettingError value)?  error,TResult? Function( UserSettingLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case UserSettingInitial() when initial != null:
return initial(_that);case UserSettingLoading() when loading != null:
return loading(_that);case UserSettingError() when error != null:
return error(_that);case UserSettingLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( UserSettingEntity data)?  initial,TResult Function( UserSettingEntity data)?  loading,TResult Function( String message,  UserSettingEntity data)?  error,TResult Function( UserSettingEntity data)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UserSettingInitial() when initial != null:
return initial(_that.data);case UserSettingLoading() when loading != null:
return loading(_that.data);case UserSettingError() when error != null:
return error(_that.message,_that.data);case UserSettingLoaded() when loaded != null:
return loaded(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( UserSettingEntity data)  initial,required TResult Function( UserSettingEntity data)  loading,required TResult Function( String message,  UserSettingEntity data)  error,required TResult Function( UserSettingEntity data)  loaded,}) {final _that = this;
switch (_that) {
case UserSettingInitial():
return initial(_that.data);case UserSettingLoading():
return loading(_that.data);case UserSettingError():
return error(_that.message,_that.data);case UserSettingLoaded():
return loaded(_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( UserSettingEntity data)?  initial,TResult? Function( UserSettingEntity data)?  loading,TResult? Function( String message,  UserSettingEntity data)?  error,TResult? Function( UserSettingEntity data)?  loaded,}) {final _that = this;
switch (_that) {
case UserSettingInitial() when initial != null:
return initial(_that.data);case UserSettingLoading() when loading != null:
return loading(_that.data);case UserSettingError() when error != null:
return error(_that.message,_that.data);case UserSettingLoaded() when loaded != null:
return loaded(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class UserSettingInitial implements UserSettingState {
  const UserSettingInitial({this.data = const UserSettingEntity()});
  

@override@JsonKey() final  UserSettingEntity data;

/// Create a copy of UserSettingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSettingInitialCopyWith<UserSettingInitial> get copyWith => _$UserSettingInitialCopyWithImpl<UserSettingInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSettingInitial&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'UserSettingState.initial(data: $data)';
}


}

/// @nodoc
abstract mixin class $UserSettingInitialCopyWith<$Res> implements $UserSettingStateCopyWith<$Res> {
  factory $UserSettingInitialCopyWith(UserSettingInitial value, $Res Function(UserSettingInitial) _then) = _$UserSettingInitialCopyWithImpl;
@override @useResult
$Res call({
 UserSettingEntity data
});




}
/// @nodoc
class _$UserSettingInitialCopyWithImpl<$Res>
    implements $UserSettingInitialCopyWith<$Res> {
  _$UserSettingInitialCopyWithImpl(this._self, this._then);

  final UserSettingInitial _self;
  final $Res Function(UserSettingInitial) _then;

/// Create a copy of UserSettingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UserSettingInitial(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UserSettingEntity,
  ));
}


}

/// @nodoc


class UserSettingLoading implements UserSettingState {
  const UserSettingLoading({required this.data});
  

@override final  UserSettingEntity data;

/// Create a copy of UserSettingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSettingLoadingCopyWith<UserSettingLoading> get copyWith => _$UserSettingLoadingCopyWithImpl<UserSettingLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSettingLoading&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'UserSettingState.loading(data: $data)';
}


}

/// @nodoc
abstract mixin class $UserSettingLoadingCopyWith<$Res> implements $UserSettingStateCopyWith<$Res> {
  factory $UserSettingLoadingCopyWith(UserSettingLoading value, $Res Function(UserSettingLoading) _then) = _$UserSettingLoadingCopyWithImpl;
@override @useResult
$Res call({
 UserSettingEntity data
});




}
/// @nodoc
class _$UserSettingLoadingCopyWithImpl<$Res>
    implements $UserSettingLoadingCopyWith<$Res> {
  _$UserSettingLoadingCopyWithImpl(this._self, this._then);

  final UserSettingLoading _self;
  final $Res Function(UserSettingLoading) _then;

/// Create a copy of UserSettingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UserSettingLoading(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UserSettingEntity,
  ));
}


}

/// @nodoc


class UserSettingError implements UserSettingState {
  const UserSettingError({required this.message, required this.data});
  

 final  String message;
@override final  UserSettingEntity data;

/// Create a copy of UserSettingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSettingErrorCopyWith<UserSettingError> get copyWith => _$UserSettingErrorCopyWithImpl<UserSettingError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSettingError&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,message,data);

@override
String toString() {
  return 'UserSettingState.error(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $UserSettingErrorCopyWith<$Res> implements $UserSettingStateCopyWith<$Res> {
  factory $UserSettingErrorCopyWith(UserSettingError value, $Res Function(UserSettingError) _then) = _$UserSettingErrorCopyWithImpl;
@override @useResult
$Res call({
 String message, UserSettingEntity data
});




}
/// @nodoc
class _$UserSettingErrorCopyWithImpl<$Res>
    implements $UserSettingErrorCopyWith<$Res> {
  _$UserSettingErrorCopyWithImpl(this._self, this._then);

  final UserSettingError _self;
  final $Res Function(UserSettingError) _then;

/// Create a copy of UserSettingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? data = null,}) {
  return _then(UserSettingError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UserSettingEntity,
  ));
}


}

/// @nodoc


class UserSettingLoaded implements UserSettingState {
  const UserSettingLoaded({required this.data});
  

@override final  UserSettingEntity data;

/// Create a copy of UserSettingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSettingLoadedCopyWith<UserSettingLoaded> get copyWith => _$UserSettingLoadedCopyWithImpl<UserSettingLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSettingLoaded&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'UserSettingState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $UserSettingLoadedCopyWith<$Res> implements $UserSettingStateCopyWith<$Res> {
  factory $UserSettingLoadedCopyWith(UserSettingLoaded value, $Res Function(UserSettingLoaded) _then) = _$UserSettingLoadedCopyWithImpl;
@override @useResult
$Res call({
 UserSettingEntity data
});




}
/// @nodoc
class _$UserSettingLoadedCopyWithImpl<$Res>
    implements $UserSettingLoadedCopyWith<$Res> {
  _$UserSettingLoadedCopyWithImpl(this._self, this._then);

  final UserSettingLoaded _self;
  final $Res Function(UserSettingLoaded) _then;

/// Create a copy of UserSettingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UserSettingLoaded(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UserSettingEntity,
  ));
}


}

// dart format on
