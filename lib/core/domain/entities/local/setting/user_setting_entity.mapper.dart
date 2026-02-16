// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_setting_entity.dart';

class UserSettingEntityMapper extends ClassMapperBase<UserSettingEntity> {
  UserSettingEntityMapper._();

  static UserSettingEntityMapper? _instance;
  static UserSettingEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserSettingEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserSettingEntity';

  static bool _$notification(UserSettingEntity v) => v.notification;
  static const Field<UserSettingEntity, bool> _f$notification = Field(
    'notification',
    _$notification,
    opt: true,
    def: true,
  );

  @override
  final MappableFields<UserSettingEntity> fields = const {
    #notification: _f$notification,
  };
  @override
  final bool ignoreNull = true;

  static UserSettingEntity _instantiate(DecodingData data) {
    return UserSettingEntity(notification: data.dec(_f$notification));
  }

  @override
  final Function instantiate = _instantiate;

  static UserSettingEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserSettingEntity>(map);
  }

  static UserSettingEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<UserSettingEntity>(json);
  }
}

mixin UserSettingEntityMappable {
  String toJsonString() {
    return UserSettingEntityMapper.ensureInitialized()
        .encodeJson<UserSettingEntity>(this as UserSettingEntity);
  }

  Map<String, dynamic> toJson() {
    return UserSettingEntityMapper.ensureInitialized()
        .encodeMap<UserSettingEntity>(this as UserSettingEntity);
  }

  UserSettingEntityCopyWith<
    UserSettingEntity,
    UserSettingEntity,
    UserSettingEntity
  >
  get copyWith =>
      _UserSettingEntityCopyWithImpl<UserSettingEntity, UserSettingEntity>(
        this as UserSettingEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UserSettingEntityMapper.ensureInitialized().stringifyValue(
      this as UserSettingEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return UserSettingEntityMapper.ensureInitialized().equalsValue(
      this as UserSettingEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return UserSettingEntityMapper.ensureInitialized().hashValue(
      this as UserSettingEntity,
    );
  }
}

extension UserSettingEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserSettingEntity, $Out> {
  UserSettingEntityCopyWith<$R, UserSettingEntity, $Out>
  get $asUserSettingEntity => $base.as(
    (v, t, t2) => _UserSettingEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class UserSettingEntityCopyWith<
  $R,
  $In extends UserSettingEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? notification});
  UserSettingEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _UserSettingEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserSettingEntity, $Out>
    implements UserSettingEntityCopyWith<$R, UserSettingEntity, $Out> {
  _UserSettingEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserSettingEntity> $mapper =
      UserSettingEntityMapper.ensureInitialized();
  @override
  $R call({bool? notification}) => $apply(
    FieldCopyWithData({if (notification != null) #notification: notification}),
  );
  @override
  UserSettingEntity $make(CopyWithData data) => UserSettingEntity(
    notification: data.get(#notification, or: $value.notification),
  );

  @override
  UserSettingEntityCopyWith<$R2, UserSettingEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserSettingEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

