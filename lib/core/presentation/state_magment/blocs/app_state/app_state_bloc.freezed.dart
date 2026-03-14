// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppStateEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppStateEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStateEvent()';
}


}

/// @nodoc
class $AppStateEventCopyWith<$Res>  {
$AppStateEventCopyWith(AppStateEvent _, $Res Function(AppStateEvent) __);
}


/// Adds pattern-matching-related methods to [AppStateEvent].
extension AppStateEventPatterns on AppStateEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UpdateSession value)?  updateSession,TResult Function( UserLoggedIn value)?  userLoggedIn,TResult Function( InjectDataBeforeAppStart value)?  injectDataBeforeAppStart,TResult Function( SyncLocalDataToAppState value)?  syncLocalDataToAppState,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UpdateSession() when updateSession != null:
return updateSession(_that);case UserLoggedIn() when userLoggedIn != null:
return userLoggedIn(_that);case InjectDataBeforeAppStart() when injectDataBeforeAppStart != null:
return injectDataBeforeAppStart(_that);case SyncLocalDataToAppState() when syncLocalDataToAppState != null:
return syncLocalDataToAppState(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UpdateSession value)  updateSession,required TResult Function( UserLoggedIn value)  userLoggedIn,required TResult Function( InjectDataBeforeAppStart value)  injectDataBeforeAppStart,required TResult Function( SyncLocalDataToAppState value)  syncLocalDataToAppState,}){
final _that = this;
switch (_that) {
case UpdateSession():
return updateSession(_that);case UserLoggedIn():
return userLoggedIn(_that);case InjectDataBeforeAppStart():
return injectDataBeforeAppStart(_that);case SyncLocalDataToAppState():
return syncLocalDataToAppState(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UpdateSession value)?  updateSession,TResult? Function( UserLoggedIn value)?  userLoggedIn,TResult? Function( InjectDataBeforeAppStart value)?  injectDataBeforeAppStart,TResult? Function( SyncLocalDataToAppState value)?  syncLocalDataToAppState,}){
final _that = this;
switch (_that) {
case UpdateSession() when updateSession != null:
return updateSession(_that);case UserLoggedIn() when userLoggedIn != null:
return userLoggedIn(_that);case InjectDataBeforeAppStart() when injectDataBeforeAppStart != null:
return injectDataBeforeAppStart(_that);case SyncLocalDataToAppState() when syncLocalDataToAppState != null:
return syncLocalDataToAppState(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AuthUserEntity? authData,  bool? isLoggedIn,  UserAuthStatus? userAuthStatus)?  updateSession,TResult Function( AuthUserEntity? authData,  UserAuthStatus? userAuthStatus)?  userLoggedIn,TResult Function( AuthUserEntity? customer)?  injectDataBeforeAppStart,TResult Function( AppStateData Function(AppStateData old) mapper,  String? type)?  syncLocalDataToAppState,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UpdateSession() when updateSession != null:
return updateSession(_that.authData,_that.isLoggedIn,_that.userAuthStatus);case UserLoggedIn() when userLoggedIn != null:
return userLoggedIn(_that.authData,_that.userAuthStatus);case InjectDataBeforeAppStart() when injectDataBeforeAppStart != null:
return injectDataBeforeAppStart(_that.customer);case SyncLocalDataToAppState() when syncLocalDataToAppState != null:
return syncLocalDataToAppState(_that.mapper,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AuthUserEntity? authData,  bool? isLoggedIn,  UserAuthStatus? userAuthStatus)  updateSession,required TResult Function( AuthUserEntity? authData,  UserAuthStatus? userAuthStatus)  userLoggedIn,required TResult Function( AuthUserEntity? customer)  injectDataBeforeAppStart,required TResult Function( AppStateData Function(AppStateData old) mapper,  String? type)  syncLocalDataToAppState,}) {final _that = this;
switch (_that) {
case UpdateSession():
return updateSession(_that.authData,_that.isLoggedIn,_that.userAuthStatus);case UserLoggedIn():
return userLoggedIn(_that.authData,_that.userAuthStatus);case InjectDataBeforeAppStart():
return injectDataBeforeAppStart(_that.customer);case SyncLocalDataToAppState():
return syncLocalDataToAppState(_that.mapper,_that.type);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AuthUserEntity? authData,  bool? isLoggedIn,  UserAuthStatus? userAuthStatus)?  updateSession,TResult? Function( AuthUserEntity? authData,  UserAuthStatus? userAuthStatus)?  userLoggedIn,TResult? Function( AuthUserEntity? customer)?  injectDataBeforeAppStart,TResult? Function( AppStateData Function(AppStateData old) mapper,  String? type)?  syncLocalDataToAppState,}) {final _that = this;
switch (_that) {
case UpdateSession() when updateSession != null:
return updateSession(_that.authData,_that.isLoggedIn,_that.userAuthStatus);case UserLoggedIn() when userLoggedIn != null:
return userLoggedIn(_that.authData,_that.userAuthStatus);case InjectDataBeforeAppStart() when injectDataBeforeAppStart != null:
return injectDataBeforeAppStart(_that.customer);case SyncLocalDataToAppState() when syncLocalDataToAppState != null:
return syncLocalDataToAppState(_that.mapper,_that.type);case _:
  return null;

}
}

}

/// @nodoc


class UpdateSession implements AppStateEvent {
  const UpdateSession({this.authData, this.isLoggedIn, this.userAuthStatus});
  

 final  AuthUserEntity? authData;
 final  bool? isLoggedIn;
 final  UserAuthStatus? userAuthStatus;

/// Create a copy of AppStateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateSessionCopyWith<UpdateSession> get copyWith => _$UpdateSessionCopyWithImpl<UpdateSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateSession&&(identical(other.authData, authData) || other.authData == authData)&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn)&&(identical(other.userAuthStatus, userAuthStatus) || other.userAuthStatus == userAuthStatus));
}


@override
int get hashCode => Object.hash(runtimeType,authData,isLoggedIn,userAuthStatus);

@override
String toString() {
  return 'AppStateEvent.updateSession(authData: $authData, isLoggedIn: $isLoggedIn, userAuthStatus: $userAuthStatus)';
}


}

/// @nodoc
abstract mixin class $UpdateSessionCopyWith<$Res> implements $AppStateEventCopyWith<$Res> {
  factory $UpdateSessionCopyWith(UpdateSession value, $Res Function(UpdateSession) _then) = _$UpdateSessionCopyWithImpl;
@useResult
$Res call({
 AuthUserEntity? authData, bool? isLoggedIn, UserAuthStatus? userAuthStatus
});




}
/// @nodoc
class _$UpdateSessionCopyWithImpl<$Res>
    implements $UpdateSessionCopyWith<$Res> {
  _$UpdateSessionCopyWithImpl(this._self, this._then);

  final UpdateSession _self;
  final $Res Function(UpdateSession) _then;

/// Create a copy of AppStateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? authData = freezed,Object? isLoggedIn = freezed,Object? userAuthStatus = freezed,}) {
  return _then(UpdateSession(
authData: freezed == authData ? _self.authData : authData // ignore: cast_nullable_to_non_nullable
as AuthUserEntity?,isLoggedIn: freezed == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool?,userAuthStatus: freezed == userAuthStatus ? _self.userAuthStatus : userAuthStatus // ignore: cast_nullable_to_non_nullable
as UserAuthStatus?,
  ));
}


}

/// @nodoc


class UserLoggedIn implements AppStateEvent {
  const UserLoggedIn({required this.authData, required this.userAuthStatus});
  

 final  AuthUserEntity? authData;
 final  UserAuthStatus? userAuthStatus;

/// Create a copy of AppStateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLoggedInCopyWith<UserLoggedIn> get copyWith => _$UserLoggedInCopyWithImpl<UserLoggedIn>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLoggedIn&&(identical(other.authData, authData) || other.authData == authData)&&(identical(other.userAuthStatus, userAuthStatus) || other.userAuthStatus == userAuthStatus));
}


@override
int get hashCode => Object.hash(runtimeType,authData,userAuthStatus);

@override
String toString() {
  return 'AppStateEvent.userLoggedIn(authData: $authData, userAuthStatus: $userAuthStatus)';
}


}

/// @nodoc
abstract mixin class $UserLoggedInCopyWith<$Res> implements $AppStateEventCopyWith<$Res> {
  factory $UserLoggedInCopyWith(UserLoggedIn value, $Res Function(UserLoggedIn) _then) = _$UserLoggedInCopyWithImpl;
@useResult
$Res call({
 AuthUserEntity? authData, UserAuthStatus? userAuthStatus
});




}
/// @nodoc
class _$UserLoggedInCopyWithImpl<$Res>
    implements $UserLoggedInCopyWith<$Res> {
  _$UserLoggedInCopyWithImpl(this._self, this._then);

  final UserLoggedIn _self;
  final $Res Function(UserLoggedIn) _then;

/// Create a copy of AppStateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? authData = freezed,Object? userAuthStatus = freezed,}) {
  return _then(UserLoggedIn(
authData: freezed == authData ? _self.authData : authData // ignore: cast_nullable_to_non_nullable
as AuthUserEntity?,userAuthStatus: freezed == userAuthStatus ? _self.userAuthStatus : userAuthStatus // ignore: cast_nullable_to_non_nullable
as UserAuthStatus?,
  ));
}


}

/// @nodoc


class InjectDataBeforeAppStart implements AppStateEvent {
  const InjectDataBeforeAppStart({required this.customer});
  

 final  AuthUserEntity? customer;

/// Create a copy of AppStateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InjectDataBeforeAppStartCopyWith<InjectDataBeforeAppStart> get copyWith => _$InjectDataBeforeAppStartCopyWithImpl<InjectDataBeforeAppStart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InjectDataBeforeAppStart&&(identical(other.customer, customer) || other.customer == customer));
}


@override
int get hashCode => Object.hash(runtimeType,customer);

@override
String toString() {
  return 'AppStateEvent.injectDataBeforeAppStart(customer: $customer)';
}


}

/// @nodoc
abstract mixin class $InjectDataBeforeAppStartCopyWith<$Res> implements $AppStateEventCopyWith<$Res> {
  factory $InjectDataBeforeAppStartCopyWith(InjectDataBeforeAppStart value, $Res Function(InjectDataBeforeAppStart) _then) = _$InjectDataBeforeAppStartCopyWithImpl;
@useResult
$Res call({
 AuthUserEntity? customer
});




}
/// @nodoc
class _$InjectDataBeforeAppStartCopyWithImpl<$Res>
    implements $InjectDataBeforeAppStartCopyWith<$Res> {
  _$InjectDataBeforeAppStartCopyWithImpl(this._self, this._then);

  final InjectDataBeforeAppStart _self;
  final $Res Function(InjectDataBeforeAppStart) _then;

/// Create a copy of AppStateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? customer = freezed,}) {
  return _then(InjectDataBeforeAppStart(
customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as AuthUserEntity?,
  ));
}


}

/// @nodoc


class SyncLocalDataToAppState implements AppStateEvent {
  const SyncLocalDataToAppState(this.mapper, {this.type});
  

 final  AppStateData Function(AppStateData old) mapper;
 final  String? type;

/// Create a copy of AppStateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncLocalDataToAppStateCopyWith<SyncLocalDataToAppState> get copyWith => _$SyncLocalDataToAppStateCopyWithImpl<SyncLocalDataToAppState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncLocalDataToAppState&&(identical(other.mapper, mapper) || other.mapper == mapper)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,mapper,type);

@override
String toString() {
  return 'AppStateEvent.syncLocalDataToAppState(mapper: $mapper, type: $type)';
}


}

/// @nodoc
abstract mixin class $SyncLocalDataToAppStateCopyWith<$Res> implements $AppStateEventCopyWith<$Res> {
  factory $SyncLocalDataToAppStateCopyWith(SyncLocalDataToAppState value, $Res Function(SyncLocalDataToAppState) _then) = _$SyncLocalDataToAppStateCopyWithImpl;
@useResult
$Res call({
 AppStateData Function(AppStateData old) mapper, String? type
});




}
/// @nodoc
class _$SyncLocalDataToAppStateCopyWithImpl<$Res>
    implements $SyncLocalDataToAppStateCopyWith<$Res> {
  _$SyncLocalDataToAppStateCopyWithImpl(this._self, this._then);

  final SyncLocalDataToAppState _self;
  final $Res Function(SyncLocalDataToAppState) _then;

/// Create a copy of AppStateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mapper = null,Object? type = freezed,}) {
  return _then(SyncLocalDataToAppState(
null == mapper ? _self.mapper : mapper // ignore: cast_nullable_to_non_nullable
as AppStateData Function(AppStateData old),type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$AppStateState {

 AppStateData get data;
/// Create a copy of AppStateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppStateStateCopyWith<AppStateState> get copyWith => _$AppStateStateCopyWithImpl<AppStateState>(this as AppStateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppStateState&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppStateState(data: $data)';
}


}

/// @nodoc
abstract mixin class $AppStateStateCopyWith<$Res>  {
  factory $AppStateStateCopyWith(AppStateState value, $Res Function(AppStateState) _then) = _$AppStateStateCopyWithImpl;
@useResult
$Res call({
 AppStateData data
});




}
/// @nodoc
class _$AppStateStateCopyWithImpl<$Res>
    implements $AppStateStateCopyWith<$Res> {
  _$AppStateStateCopyWithImpl(this._self, this._then);

  final AppStateState _self;
  final $Res Function(AppStateState) _then;

/// Create a copy of AppStateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppStateData,
  ));
}

}


/// Adds pattern-matching-related methods to [AppStateState].
extension AppStateStatePatterns on AppStateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AppStateInitial value)?  initial,TResult Function( AppStateLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AppStateInitial() when initial != null:
return initial(_that);case AppStateLoaded() when loaded != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AppStateInitial value)  initial,required TResult Function( AppStateLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case AppStateInitial():
return initial(_that);case AppStateLoaded():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AppStateInitial value)?  initial,TResult? Function( AppStateLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case AppStateInitial() when initial != null:
return initial(_that);case AppStateLoaded() when loaded != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AppStateData data)?  initial,TResult Function( AppStateData data)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AppStateInitial() when initial != null:
return initial(_that.data);case AppStateLoaded() when loaded != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AppStateData data)  initial,required TResult Function( AppStateData data)  loaded,}) {final _that = this;
switch (_that) {
case AppStateInitial():
return initial(_that.data);case AppStateLoaded():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AppStateData data)?  initial,TResult? Function( AppStateData data)?  loaded,}) {final _that = this;
switch (_that) {
case AppStateInitial() when initial != null:
return initial(_that.data);case AppStateLoaded() when loaded != null:
return loaded(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class AppStateInitial implements AppStateState {
  const AppStateInitial({required this.data});
  

@override final  AppStateData data;

/// Create a copy of AppStateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppStateInitialCopyWith<AppStateInitial> get copyWith => _$AppStateInitialCopyWithImpl<AppStateInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppStateInitial&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppStateState.initial(data: $data)';
}


}

/// @nodoc
abstract mixin class $AppStateInitialCopyWith<$Res> implements $AppStateStateCopyWith<$Res> {
  factory $AppStateInitialCopyWith(AppStateInitial value, $Res Function(AppStateInitial) _then) = _$AppStateInitialCopyWithImpl;
@override @useResult
$Res call({
 AppStateData data
});




}
/// @nodoc
class _$AppStateInitialCopyWithImpl<$Res>
    implements $AppStateInitialCopyWith<$Res> {
  _$AppStateInitialCopyWithImpl(this._self, this._then);

  final AppStateInitial _self;
  final $Res Function(AppStateInitial) _then;

/// Create a copy of AppStateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(AppStateInitial(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppStateData,
  ));
}


}

/// @nodoc


class AppStateLoaded implements AppStateState {
  const AppStateLoaded({required this.data});
  

@override final  AppStateData data;

/// Create a copy of AppStateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppStateLoadedCopyWith<AppStateLoaded> get copyWith => _$AppStateLoadedCopyWithImpl<AppStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppStateLoaded&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppStateState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $AppStateLoadedCopyWith<$Res> implements $AppStateStateCopyWith<$Res> {
  factory $AppStateLoadedCopyWith(AppStateLoaded value, $Res Function(AppStateLoaded) _then) = _$AppStateLoadedCopyWithImpl;
@override @useResult
$Res call({
 AppStateData data
});




}
/// @nodoc
class _$AppStateLoadedCopyWithImpl<$Res>
    implements $AppStateLoadedCopyWith<$Res> {
  _$AppStateLoadedCopyWithImpl(this._self, this._then);

  final AppStateLoaded _self;
  final $Res Function(AppStateLoaded) _then;

/// Create a copy of AppStateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(AppStateLoaded(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppStateData,
  ));
}


}

// dart format on
