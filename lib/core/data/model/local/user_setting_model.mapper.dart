// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_setting_model.dart';

class UserSettingModelMapper extends ClassMapperBase<UserSettingModel> {
  UserSettingModelMapper._();

  static UserSettingModelMapper? _instance;
  static UserSettingModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserSettingModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserSettingModel';

  static bool _$notification(UserSettingModel v) => v.notification;
  static const Field<UserSettingModel, bool> _f$notification = Field(
    'notification',
    _$notification,
    opt: true,
    def: true,
  );

  @override
  final MappableFields<UserSettingModel> fields = const {
    #notification: _f$notification,
  };
  @override
  final bool ignoreNull = true;

  static UserSettingModel _instantiate(DecodingData data) {
    return UserSettingModel(notification: data.dec(_f$notification));
  }

  @override
  final Function instantiate = _instantiate;

  static UserSettingModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserSettingModel>(map);
  }

  static UserSettingModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<UserSettingModel>(json);
  }
}

mixin UserSettingModelMappable {
  String toJsonString() {
    return UserSettingModelMapper.ensureInitialized()
        .encodeJson<UserSettingModel>(this as UserSettingModel);
  }

  Map<String, dynamic> toJson() {
    return UserSettingModelMapper.ensureInitialized()
        .encodeMap<UserSettingModel>(this as UserSettingModel);
  }

  UserSettingModelCopyWith<UserSettingModel, UserSettingModel, UserSettingModel>
  get copyWith =>
      _UserSettingModelCopyWithImpl<UserSettingModel, UserSettingModel>(
        this as UserSettingModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UserSettingModelMapper.ensureInitialized().stringifyValue(
      this as UserSettingModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return UserSettingModelMapper.ensureInitialized().equalsValue(
      this as UserSettingModel,
      other,
    );
  }

  @override
  int get hashCode {
    return UserSettingModelMapper.ensureInitialized().hashValue(
      this as UserSettingModel,
    );
  }
}

extension UserSettingModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserSettingModel, $Out> {
  UserSettingModelCopyWith<$R, UserSettingModel, $Out>
  get $asUserSettingModel =>
      $base.as((v, t, t2) => _UserSettingModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserSettingModelCopyWith<$R, $In extends UserSettingModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? notification});
  UserSettingModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _UserSettingModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserSettingModel, $Out>
    implements UserSettingModelCopyWith<$R, UserSettingModel, $Out> {
  _UserSettingModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserSettingModel> $mapper =
      UserSettingModelMapper.ensureInitialized();
  @override
  $R call({bool? notification}) => $apply(
    FieldCopyWithData({if (notification != null) #notification: notification}),
  );
  @override
  UserSettingModel $make(CopyWithData data) => UserSettingModel(
    notification: data.get(#notification, or: $value.notification),
  );

  @override
  UserSettingModelCopyWith<$R2, UserSettingModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserSettingModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

