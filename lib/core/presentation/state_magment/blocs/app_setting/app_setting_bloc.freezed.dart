// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_setting_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppSettingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppSettingEvent()';
}


}

/// @nodoc
class $AppSettingEventCopyWith<$Res>  {
$AppSettingEventCopyWith(AppSettingEvent _, $Res Function(AppSettingEvent) __);
}


/// Adds pattern-matching-related methods to [AppSettingEvent].
extension AppSettingEventPatterns on AppSettingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InjectAppSettingEvent value)?  inject,TResult Function( GetAppSettingEvent value)?  get,TResult Function( ChangeThemeEvent value)?  changeTheme,TResult Function( ChangeLanguageEvent value)?  changeLanguage,TResult Function( ChangeLocalEvent value)?  changeLocal,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InjectAppSettingEvent() when inject != null:
return inject(_that);case GetAppSettingEvent() when get != null:
return get(_that);case ChangeThemeEvent() when changeTheme != null:
return changeTheme(_that);case ChangeLanguageEvent() when changeLanguage != null:
return changeLanguage(_that);case ChangeLocalEvent() when changeLocal != null:
return changeLocal(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InjectAppSettingEvent value)  inject,required TResult Function( GetAppSettingEvent value)  get,required TResult Function( ChangeThemeEvent value)  changeTheme,required TResult Function( ChangeLanguageEvent value)  changeLanguage,required TResult Function( ChangeLocalEvent value)  changeLocal,}){
final _that = this;
switch (_that) {
case InjectAppSettingEvent():
return inject(_that);case GetAppSettingEvent():
return get(_that);case ChangeThemeEvent():
return changeTheme(_that);case ChangeLanguageEvent():
return changeLanguage(_that);case ChangeLocalEvent():
return changeLocal(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InjectAppSettingEvent value)?  inject,TResult? Function( GetAppSettingEvent value)?  get,TResult? Function( ChangeThemeEvent value)?  changeTheme,TResult? Function( ChangeLanguageEvent value)?  changeLanguage,TResult? Function( ChangeLocalEvent value)?  changeLocal,}){
final _that = this;
switch (_that) {
case InjectAppSettingEvent() when inject != null:
return inject(_that);case GetAppSettingEvent() when get != null:
return get(_that);case ChangeThemeEvent() when changeTheme != null:
return changeTheme(_that);case ChangeLanguageEvent() when changeLanguage != null:
return changeLanguage(_that);case ChangeLocalEvent() when changeLocal != null:
return changeLocal(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AppSettingEntity setting)?  inject,TResult Function()?  get,TResult Function( AppThemeMode? appAppThemeMode,  String fromWhere)?  changeTheme,TResult Function( AppLanguage language,  bool isRefresh,  String fromWhere)?  changeLanguage,TResult Function( AppLanguage language,  bool isRefresh,  String fromWhere)?  changeLocal,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InjectAppSettingEvent() when inject != null:
return inject(_that.setting);case GetAppSettingEvent() when get != null:
return get();case ChangeThemeEvent() when changeTheme != null:
return changeTheme(_that.appAppThemeMode,_that.fromWhere);case ChangeLanguageEvent() when changeLanguage != null:
return changeLanguage(_that.language,_that.isRefresh,_that.fromWhere);case ChangeLocalEvent() when changeLocal != null:
return changeLocal(_that.language,_that.isRefresh,_that.fromWhere);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AppSettingEntity setting)  inject,required TResult Function()  get,required TResult Function( AppThemeMode? appAppThemeMode,  String fromWhere)  changeTheme,required TResult Function( AppLanguage language,  bool isRefresh,  String fromWhere)  changeLanguage,required TResult Function( AppLanguage language,  bool isRefresh,  String fromWhere)  changeLocal,}) {final _that = this;
switch (_that) {
case InjectAppSettingEvent():
return inject(_that.setting);case GetAppSettingEvent():
return get();case ChangeThemeEvent():
return changeTheme(_that.appAppThemeMode,_that.fromWhere);case ChangeLanguageEvent():
return changeLanguage(_that.language,_that.isRefresh,_that.fromWhere);case ChangeLocalEvent():
return changeLocal(_that.language,_that.isRefresh,_that.fromWhere);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AppSettingEntity setting)?  inject,TResult? Function()?  get,TResult? Function( AppThemeMode? appAppThemeMode,  String fromWhere)?  changeTheme,TResult? Function( AppLanguage language,  bool isRefresh,  String fromWhere)?  changeLanguage,TResult? Function( AppLanguage language,  bool isRefresh,  String fromWhere)?  changeLocal,}) {final _that = this;
switch (_that) {
case InjectAppSettingEvent() when inject != null:
return inject(_that.setting);case GetAppSettingEvent() when get != null:
return get();case ChangeThemeEvent() when changeTheme != null:
return changeTheme(_that.appAppThemeMode,_that.fromWhere);case ChangeLanguageEvent() when changeLanguage != null:
return changeLanguage(_that.language,_that.isRefresh,_that.fromWhere);case ChangeLocalEvent() when changeLocal != null:
return changeLocal(_that.language,_that.isRefresh,_that.fromWhere);case _:
  return null;

}
}

}

/// @nodoc


class InjectAppSettingEvent implements AppSettingEvent {
  const InjectAppSettingEvent({required this.setting});
  

 final  AppSettingEntity setting;

/// Create a copy of AppSettingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InjectAppSettingEventCopyWith<InjectAppSettingEvent> get copyWith => _$InjectAppSettingEventCopyWithImpl<InjectAppSettingEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InjectAppSettingEvent&&(identical(other.setting, setting) || other.setting == setting));
}


@override
int get hashCode => Object.hash(runtimeType,setting);

@override
String toString() {
  return 'AppSettingEvent.inject(setting: $setting)';
}


}

/// @nodoc
abstract mixin class $InjectAppSettingEventCopyWith<$Res> implements $AppSettingEventCopyWith<$Res> {
  factory $InjectAppSettingEventCopyWith(InjectAppSettingEvent value, $Res Function(InjectAppSettingEvent) _then) = _$InjectAppSettingEventCopyWithImpl;
@useResult
$Res call({
 AppSettingEntity setting
});




}
/// @nodoc
class _$InjectAppSettingEventCopyWithImpl<$Res>
    implements $InjectAppSettingEventCopyWith<$Res> {
  _$InjectAppSettingEventCopyWithImpl(this._self, this._then);

  final InjectAppSettingEvent _self;
  final $Res Function(InjectAppSettingEvent) _then;

/// Create a copy of AppSettingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? setting = null,}) {
  return _then(InjectAppSettingEvent(
setting: null == setting ? _self.setting : setting // ignore: cast_nullable_to_non_nullable
as AppSettingEntity,
  ));
}


}

/// @nodoc


class GetAppSettingEvent implements AppSettingEvent {
  const GetAppSettingEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAppSettingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppSettingEvent.get()';
}


}




/// @nodoc


class ChangeThemeEvent implements AppSettingEvent {
  const ChangeThemeEvent({this.appAppThemeMode, required this.fromWhere});
  

 final  AppThemeMode? appAppThemeMode;
 final  String fromWhere;

/// Create a copy of AppSettingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeThemeEventCopyWith<ChangeThemeEvent> get copyWith => _$ChangeThemeEventCopyWithImpl<ChangeThemeEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeThemeEvent&&(identical(other.appAppThemeMode, appAppThemeMode) || other.appAppThemeMode == appAppThemeMode)&&(identical(other.fromWhere, fromWhere) || other.fromWhere == fromWhere));
}


@override
int get hashCode => Object.hash(runtimeType,appAppThemeMode,fromWhere);

@override
String toString() {
  return 'AppSettingEvent.changeTheme(appAppThemeMode: $appAppThemeMode, fromWhere: $fromWhere)';
}


}

/// @nodoc
abstract mixin class $ChangeThemeEventCopyWith<$Res> implements $AppSettingEventCopyWith<$Res> {
  factory $ChangeThemeEventCopyWith(ChangeThemeEvent value, $Res Function(ChangeThemeEvent) _then) = _$ChangeThemeEventCopyWithImpl;
@useResult
$Res call({
 AppThemeMode? appAppThemeMode, String fromWhere
});




}
/// @nodoc
class _$ChangeThemeEventCopyWithImpl<$Res>
    implements $ChangeThemeEventCopyWith<$Res> {
  _$ChangeThemeEventCopyWithImpl(this._self, this._then);

  final ChangeThemeEvent _self;
  final $Res Function(ChangeThemeEvent) _then;

/// Create a copy of AppSettingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appAppThemeMode = freezed,Object? fromWhere = null,}) {
  return _then(ChangeThemeEvent(
appAppThemeMode: freezed == appAppThemeMode ? _self.appAppThemeMode : appAppThemeMode // ignore: cast_nullable_to_non_nullable
as AppThemeMode?,fromWhere: null == fromWhere ? _self.fromWhere : fromWhere // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChangeLanguageEvent implements AppSettingEvent {
  const ChangeLanguageEvent({required this.language, this.isRefresh = true, required this.fromWhere});
  

 final  AppLanguage language;
@JsonKey() final  bool isRefresh;
 final  String fromWhere;

/// Create a copy of AppSettingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeLanguageEventCopyWith<ChangeLanguageEvent> get copyWith => _$ChangeLanguageEventCopyWithImpl<ChangeLanguageEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeLanguageEvent&&(identical(other.language, language) || other.language == language)&&(identical(other.isRefresh, isRefresh) || other.isRefresh == isRefresh)&&(identical(other.fromWhere, fromWhere) || other.fromWhere == fromWhere));
}


@override
int get hashCode => Object.hash(runtimeType,language,isRefresh,fromWhere);

@override
String toString() {
  return 'AppSettingEvent.changeLanguage(language: $language, isRefresh: $isRefresh, fromWhere: $fromWhere)';
}


}

/// @nodoc
abstract mixin class $ChangeLanguageEventCopyWith<$Res> implements $AppSettingEventCopyWith<$Res> {
  factory $ChangeLanguageEventCopyWith(ChangeLanguageEvent value, $Res Function(ChangeLanguageEvent) _then) = _$ChangeLanguageEventCopyWithImpl;
@useResult
$Res call({
 AppLanguage language, bool isRefresh, String fromWhere
});




}
/// @nodoc
class _$ChangeLanguageEventCopyWithImpl<$Res>
    implements $ChangeLanguageEventCopyWith<$Res> {
  _$ChangeLanguageEventCopyWithImpl(this._self, this._then);

  final ChangeLanguageEvent _self;
  final $Res Function(ChangeLanguageEvent) _then;

/// Create a copy of AppSettingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? language = null,Object? isRefresh = null,Object? fromWhere = null,}) {
  return _then(ChangeLanguageEvent(
language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as AppLanguage,isRefresh: null == isRefresh ? _self.isRefresh : isRefresh // ignore: cast_nullable_to_non_nullable
as bool,fromWhere: null == fromWhere ? _self.fromWhere : fromWhere // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChangeLocalEvent implements AppSettingEvent {
  const ChangeLocalEvent({required this.language, this.isRefresh = true, required this.fromWhere});
  

 final  AppLanguage language;
@JsonKey() final  bool isRefresh;
 final  String fromWhere;

/// Create a copy of AppSettingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeLocalEventCopyWith<ChangeLocalEvent> get copyWith => _$ChangeLocalEventCopyWithImpl<ChangeLocalEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeLocalEvent&&(identical(other.language, language) || other.language == language)&&(identical(other.isRefresh, isRefresh) || other.isRefresh == isRefresh)&&(identical(other.fromWhere, fromWhere) || other.fromWhere == fromWhere));
}


@override
int get hashCode => Object.hash(runtimeType,language,isRefresh,fromWhere);

@override
String toString() {
  return 'AppSettingEvent.changeLocal(language: $language, isRefresh: $isRefresh, fromWhere: $fromWhere)';
}


}

/// @nodoc
abstract mixin class $ChangeLocalEventCopyWith<$Res> implements $AppSettingEventCopyWith<$Res> {
  factory $ChangeLocalEventCopyWith(ChangeLocalEvent value, $Res Function(ChangeLocalEvent) _then) = _$ChangeLocalEventCopyWithImpl;
@useResult
$Res call({
 AppLanguage language, bool isRefresh, String fromWhere
});




}
/// @nodoc
class _$ChangeLocalEventCopyWithImpl<$Res>
    implements $ChangeLocalEventCopyWith<$Res> {
  _$ChangeLocalEventCopyWithImpl(this._self, this._then);

  final ChangeLocalEvent _self;
  final $Res Function(ChangeLocalEvent) _then;

/// Create a copy of AppSettingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? language = null,Object? isRefresh = null,Object? fromWhere = null,}) {
  return _then(ChangeLocalEvent(
language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as AppLanguage,isRefresh: null == isRefresh ? _self.isRefresh : isRefresh // ignore: cast_nullable_to_non_nullable
as bool,fromWhere: null == fromWhere ? _self.fromWhere : fromWhere // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AppSettingState {

 AppSettingEntity get data;
/// Create a copy of AppSettingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingStateCopyWith<AppSettingState> get copyWith => _$AppSettingStateCopyWithImpl<AppSettingState>(this as AppSettingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettingState&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppSettingState(data: $data)';
}


}

/// @nodoc
abstract mixin class $AppSettingStateCopyWith<$Res>  {
  factory $AppSettingStateCopyWith(AppSettingState value, $Res Function(AppSettingState) _then) = _$AppSettingStateCopyWithImpl;
@useResult
$Res call({
 AppSettingEntity data
});




}
/// @nodoc
class _$AppSettingStateCopyWithImpl<$Res>
    implements $AppSettingStateCopyWith<$Res> {
  _$AppSettingStateCopyWithImpl(this._self, this._then);

  final AppSettingState _self;
  final $Res Function(AppSettingState) _then;

/// Create a copy of AppSettingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppSettingEntity,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettingState].
extension AppSettingStatePatterns on AppSettingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AppSettingInitial value)?  initial,TResult Function( AppSettingLoading value)?  loading,TResult Function( AppSettingError value)?  error,TResult Function( AppSettingLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AppSettingInitial() when initial != null:
return initial(_that);case AppSettingLoading() when loading != null:
return loading(_that);case AppSettingError() when error != null:
return error(_that);case AppSettingLoaded() when loaded != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AppSettingInitial value)  initial,required TResult Function( AppSettingLoading value)  loading,required TResult Function( AppSettingError value)  error,required TResult Function( AppSettingLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case AppSettingInitial():
return initial(_that);case AppSettingLoading():
return loading(_that);case AppSettingError():
return error(_that);case AppSettingLoaded():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AppSettingInitial value)?  initial,TResult? Function( AppSettingLoading value)?  loading,TResult? Function( AppSettingError value)?  error,TResult? Function( AppSettingLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case AppSettingInitial() when initial != null:
return initial(_that);case AppSettingLoading() when loading != null:
return loading(_that);case AppSettingError() when error != null:
return error(_that);case AppSettingLoaded() when loaded != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AppSettingEntity data)?  initial,TResult Function( AppSettingEntity data)?  loading,TResult Function( String message,  AppSettingEntity data)?  error,TResult Function( AppSettingEntity data)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AppSettingInitial() when initial != null:
return initial(_that.data);case AppSettingLoading() when loading != null:
return loading(_that.data);case AppSettingError() when error != null:
return error(_that.message,_that.data);case AppSettingLoaded() when loaded != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AppSettingEntity data)  initial,required TResult Function( AppSettingEntity data)  loading,required TResult Function( String message,  AppSettingEntity data)  error,required TResult Function( AppSettingEntity data)  loaded,}) {final _that = this;
switch (_that) {
case AppSettingInitial():
return initial(_that.data);case AppSettingLoading():
return loading(_that.data);case AppSettingError():
return error(_that.message,_that.data);case AppSettingLoaded():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AppSettingEntity data)?  initial,TResult? Function( AppSettingEntity data)?  loading,TResult? Function( String message,  AppSettingEntity data)?  error,TResult? Function( AppSettingEntity data)?  loaded,}) {final _that = this;
switch (_that) {
case AppSettingInitial() when initial != null:
return initial(_that.data);case AppSettingLoading() when loading != null:
return loading(_that.data);case AppSettingError() when error != null:
return error(_that.message,_that.data);case AppSettingLoaded() when loaded != null:
return loaded(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class AppSettingInitial implements AppSettingState {
  const AppSettingInitial({this.data = const AppSettingEntity()});
  

@override@JsonKey() final  AppSettingEntity data;

/// Create a copy of AppSettingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingInitialCopyWith<AppSettingInitial> get copyWith => _$AppSettingInitialCopyWithImpl<AppSettingInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettingInitial&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppSettingState.initial(data: $data)';
}


}

/// @nodoc
abstract mixin class $AppSettingInitialCopyWith<$Res> implements $AppSettingStateCopyWith<$Res> {
  factory $AppSettingInitialCopyWith(AppSettingInitial value, $Res Function(AppSettingInitial) _then) = _$AppSettingInitialCopyWithImpl;
@override @useResult
$Res call({
 AppSettingEntity data
});




}
/// @nodoc
class _$AppSettingInitialCopyWithImpl<$Res>
    implements $AppSettingInitialCopyWith<$Res> {
  _$AppSettingInitialCopyWithImpl(this._self, this._then);

  final AppSettingInitial _self;
  final $Res Function(AppSettingInitial) _then;

/// Create a copy of AppSettingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(AppSettingInitial(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppSettingEntity,
  ));
}


}

/// @nodoc


class AppSettingLoading implements AppSettingState {
  const AppSettingLoading({required this.data});
  

@override final  AppSettingEntity data;

/// Create a copy of AppSettingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingLoadingCopyWith<AppSettingLoading> get copyWith => _$AppSettingLoadingCopyWithImpl<AppSettingLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettingLoading&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppSettingState.loading(data: $data)';
}


}

/// @nodoc
abstract mixin class $AppSettingLoadingCopyWith<$Res> implements $AppSettingStateCopyWith<$Res> {
  factory $AppSettingLoadingCopyWith(AppSettingLoading value, $Res Function(AppSettingLoading) _then) = _$AppSettingLoadingCopyWithImpl;
@override @useResult
$Res call({
 AppSettingEntity data
});




}
/// @nodoc
class _$AppSettingLoadingCopyWithImpl<$Res>
    implements $AppSettingLoadingCopyWith<$Res> {
  _$AppSettingLoadingCopyWithImpl(this._self, this._then);

  final AppSettingLoading _self;
  final $Res Function(AppSettingLoading) _then;

/// Create a copy of AppSettingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(AppSettingLoading(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppSettingEntity,
  ));
}


}

/// @nodoc


class AppSettingError implements AppSettingState {
  const AppSettingError({required this.message, required this.data});
  

 final  String message;
@override final  AppSettingEntity data;

/// Create a copy of AppSettingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingErrorCopyWith<AppSettingError> get copyWith => _$AppSettingErrorCopyWithImpl<AppSettingError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettingError&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,message,data);

@override
String toString() {
  return 'AppSettingState.error(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $AppSettingErrorCopyWith<$Res> implements $AppSettingStateCopyWith<$Res> {
  factory $AppSettingErrorCopyWith(AppSettingError value, $Res Function(AppSettingError) _then) = _$AppSettingErrorCopyWithImpl;
@override @useResult
$Res call({
 String message, AppSettingEntity data
});




}
/// @nodoc
class _$AppSettingErrorCopyWithImpl<$Res>
    implements $AppSettingErrorCopyWith<$Res> {
  _$AppSettingErrorCopyWithImpl(this._self, this._then);

  final AppSettingError _self;
  final $Res Function(AppSettingError) _then;

/// Create a copy of AppSettingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? data = null,}) {
  return _then(AppSettingError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppSettingEntity,
  ));
}


}

/// @nodoc


class AppSettingLoaded implements AppSettingState {
  const AppSettingLoaded({required this.data});
  

@override final  AppSettingEntity data;

/// Create a copy of AppSettingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingLoadedCopyWith<AppSettingLoaded> get copyWith => _$AppSettingLoadedCopyWithImpl<AppSettingLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettingLoaded&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppSettingState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $AppSettingLoadedCopyWith<$Res> implements $AppSettingStateCopyWith<$Res> {
  factory $AppSettingLoadedCopyWith(AppSettingLoaded value, $Res Function(AppSettingLoaded) _then) = _$AppSettingLoadedCopyWithImpl;
@override @useResult
$Res call({
 AppSettingEntity data
});




}
/// @nodoc
class _$AppSettingLoadedCopyWithImpl<$Res>
    implements $AppSettingLoadedCopyWith<$Res> {
  _$AppSettingLoadedCopyWithImpl(this._self, this._then);

  final AppSettingLoaded _self;
  final $Res Function(AppSettingLoaded) _then;

/// Create a copy of AppSettingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(AppSettingLoaded(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppSettingEntity,
  ));
}


}

// dart format on
