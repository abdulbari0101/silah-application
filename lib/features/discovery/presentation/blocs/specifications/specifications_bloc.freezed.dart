// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'specifications_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SpecificationsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpecificationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpecificationsEvent()';
}


}

/// @nodoc
class $SpecificationsEventCopyWith<$Res>  {
$SpecificationsEventCopyWith(SpecificationsEvent _, $Res Function(SpecificationsEvent) __);
}


/// Adds pattern-matching-related methods to [SpecificationsEvent].
extension SpecificationsEventPatterns on SpecificationsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadSpecifications value)?  load,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadSpecifications() when load != null:
return load(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadSpecifications value)  load,}){
final _that = this;
switch (_that) {
case LoadSpecifications():
return load(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadSpecifications value)?  load,}){
final _that = this;
switch (_that) {
case LoadSpecifications() when load != null:
return load(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadSpecifications() when load != null:
return load();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,}) {final _that = this;
switch (_that) {
case LoadSpecifications():
return load();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,}) {final _that = this;
switch (_that) {
case LoadSpecifications() when load != null:
return load();case _:
  return null;

}
}

}

/// @nodoc


class LoadSpecifications implements SpecificationsEvent {
  const LoadSpecifications();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadSpecifications);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpecificationsEvent.load()';
}


}




/// @nodoc
mixin _$SpecificationsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpecificationsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpecificationsState()';
}


}

/// @nodoc
class $SpecificationsStateCopyWith<$Res>  {
$SpecificationsStateCopyWith(SpecificationsState _, $Res Function(SpecificationsState) __);
}


/// Adds pattern-matching-related methods to [SpecificationsState].
extension SpecificationsStatePatterns on SpecificationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DataPaymentInitial value)?  initial,TResult Function( DataPaymentLoading value)?  loading,TResult Function( DataPaymentLoaded value)?  loaded,TResult Function( DataPaymentError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DataPaymentInitial() when initial != null:
return initial(_that);case DataPaymentLoading() when loading != null:
return loading(_that);case DataPaymentLoaded() when loaded != null:
return loaded(_that);case DataPaymentError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DataPaymentInitial value)  initial,required TResult Function( DataPaymentLoading value)  loading,required TResult Function( DataPaymentLoaded value)  loaded,required TResult Function( DataPaymentError value)  error,}){
final _that = this;
switch (_that) {
case DataPaymentInitial():
return initial(_that);case DataPaymentLoading():
return loading(_that);case DataPaymentLoaded():
return loaded(_that);case DataPaymentError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DataPaymentInitial value)?  initial,TResult? Function( DataPaymentLoading value)?  loading,TResult? Function( DataPaymentLoaded value)?  loaded,TResult? Function( DataPaymentError value)?  error,}){
final _that = this;
switch (_that) {
case DataPaymentInitial() when initial != null:
return initial(_that);case DataPaymentLoading() when loading != null:
return loading(_that);case DataPaymentLoaded() when loaded != null:
return loaded(_that);case DataPaymentError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<LegalSpecializationEntity> data)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DataPaymentInitial() when initial != null:
return initial();case DataPaymentLoading() when loading != null:
return loading();case DataPaymentLoaded() when loaded != null:
return loaded(_that.data);case DataPaymentError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<LegalSpecializationEntity> data)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case DataPaymentInitial():
return initial();case DataPaymentLoading():
return loading();case DataPaymentLoaded():
return loaded(_that.data);case DataPaymentError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<LegalSpecializationEntity> data)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case DataPaymentInitial() when initial != null:
return initial();case DataPaymentLoading() when loading != null:
return loading();case DataPaymentLoaded() when loaded != null:
return loaded(_that.data);case DataPaymentError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class DataPaymentInitial implements SpecificationsState {
  const DataPaymentInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataPaymentInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpecificationsState.initial()';
}


}




/// @nodoc


class DataPaymentLoading implements SpecificationsState {
  const DataPaymentLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataPaymentLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpecificationsState.loading()';
}


}




/// @nodoc


class DataPaymentLoaded implements SpecificationsState {
  const DataPaymentLoaded({required final  List<LegalSpecializationEntity> data}): _data = data;
  

 final  List<LegalSpecializationEntity> _data;
 List<LegalSpecializationEntity> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of SpecificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataPaymentLoadedCopyWith<DataPaymentLoaded> get copyWith => _$DataPaymentLoadedCopyWithImpl<DataPaymentLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataPaymentLoaded&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'SpecificationsState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $DataPaymentLoadedCopyWith<$Res> implements $SpecificationsStateCopyWith<$Res> {
  factory $DataPaymentLoadedCopyWith(DataPaymentLoaded value, $Res Function(DataPaymentLoaded) _then) = _$DataPaymentLoadedCopyWithImpl;
@useResult
$Res call({
 List<LegalSpecializationEntity> data
});




}
/// @nodoc
class _$DataPaymentLoadedCopyWithImpl<$Res>
    implements $DataPaymentLoadedCopyWith<$Res> {
  _$DataPaymentLoadedCopyWithImpl(this._self, this._then);

  final DataPaymentLoaded _self;
  final $Res Function(DataPaymentLoaded) _then;

/// Create a copy of SpecificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(DataPaymentLoaded(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<LegalSpecializationEntity>,
  ));
}


}

/// @nodoc


class DataPaymentError implements SpecificationsState {
  const DataPaymentError({required this.message});
  

 final  String message;

/// Create a copy of SpecificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataPaymentErrorCopyWith<DataPaymentError> get copyWith => _$DataPaymentErrorCopyWithImpl<DataPaymentError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataPaymentError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SpecificationsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $DataPaymentErrorCopyWith<$Res> implements $SpecificationsStateCopyWith<$Res> {
  factory $DataPaymentErrorCopyWith(DataPaymentError value, $Res Function(DataPaymentError) _then) = _$DataPaymentErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DataPaymentErrorCopyWithImpl<$Res>
    implements $DataPaymentErrorCopyWith<$Res> {
  _$DataPaymentErrorCopyWithImpl(this._self, this._then);

  final DataPaymentError _self;
  final $Res Function(DataPaymentError) _then;

/// Create a copy of SpecificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DataPaymentError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
