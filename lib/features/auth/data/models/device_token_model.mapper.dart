// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'device_token_model.dart';

class DeviceTokenModelMapper extends ClassMapperBase<DeviceTokenModel> {
  DeviceTokenModelMapper._();

  static DeviceTokenModelMapper? _instance;
  static DeviceTokenModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DeviceTokenModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DeviceTokenModel';

  static String? _$deviceToken(DeviceTokenModel v) => v.deviceToken;
  static const Field<DeviceTokenModel, String> _f$deviceToken = Field(
    'deviceToken',
    _$deviceToken,
    key: r'DeviceToken',
    opt: true,
  );

  @override
  final MappableFields<DeviceTokenModel> fields = const {
    #deviceToken: _f$deviceToken,
  };
  @override
  final bool ignoreNull = true;

  static DeviceTokenModel _instantiate(DecodingData data) {
    return DeviceTokenModel(deviceToken: data.dec(_f$deviceToken));
  }

  @override
  final Function instantiate = _instantiate;

  static DeviceTokenModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DeviceTokenModel>(map);
  }

  static DeviceTokenModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<DeviceTokenModel>(json);
  }
}

mixin DeviceTokenModelMappable {
  String toJsonString() {
    return DeviceTokenModelMapper.ensureInitialized()
        .encodeJson<DeviceTokenModel>(this as DeviceTokenModel);
  }

  Map<String, dynamic> toJson() {
    return DeviceTokenModelMapper.ensureInitialized()
        .encodeMap<DeviceTokenModel>(this as DeviceTokenModel);
  }

  DeviceTokenModelCopyWith<DeviceTokenModel, DeviceTokenModel, DeviceTokenModel>
  get copyWith =>
      _DeviceTokenModelCopyWithImpl<DeviceTokenModel, DeviceTokenModel>(
        this as DeviceTokenModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return DeviceTokenModelMapper.ensureInitialized().stringifyValue(
      this as DeviceTokenModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return DeviceTokenModelMapper.ensureInitialized().equalsValue(
      this as DeviceTokenModel,
      other,
    );
  }

  @override
  int get hashCode {
    return DeviceTokenModelMapper.ensureInitialized().hashValue(
      this as DeviceTokenModel,
    );
  }
}

extension DeviceTokenModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DeviceTokenModel, $Out> {
  DeviceTokenModelCopyWith<$R, DeviceTokenModel, $Out>
  get $asDeviceTokenModel =>
      $base.as((v, t, t2) => _DeviceTokenModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DeviceTokenModelCopyWith<$R, $In extends DeviceTokenModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? deviceToken});
  DeviceTokenModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _DeviceTokenModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DeviceTokenModel, $Out>
    implements DeviceTokenModelCopyWith<$R, DeviceTokenModel, $Out> {
  _DeviceTokenModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DeviceTokenModel> $mapper =
      DeviceTokenModelMapper.ensureInitialized();
  @override
  $R call({Object? deviceToken = $none}) => $apply(
    FieldCopyWithData({if (deviceToken != $none) #deviceToken: deviceToken}),
  );
  @override
  DeviceTokenModel $make(CopyWithData data) => DeviceTokenModel(
    deviceToken: data.get(#deviceToken, or: $value.deviceToken),
  );

  @override
  DeviceTokenModelCopyWith<$R2, DeviceTokenModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _DeviceTokenModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

