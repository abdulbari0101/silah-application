// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'device_token_models.dart';

class DeviceTokenRequestModelMapper
    extends ClassMapperBase<DeviceTokenRequestModel> {
  DeviceTokenRequestModelMapper._();

  static DeviceTokenRequestModelMapper? _instance;
  static DeviceTokenRequestModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = DeviceTokenRequestModelMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'DeviceTokenRequestModel';

  static String _$deviceToken(DeviceTokenRequestModel v) => v.deviceToken;
  static const Field<DeviceTokenRequestModel, String> _f$deviceToken = Field(
    'deviceToken',
    _$deviceToken,
  );
  static String? _$platform(DeviceTokenRequestModel v) => v.platform;
  static const Field<DeviceTokenRequestModel, String> _f$platform = Field(
    'platform',
    _$platform,
    opt: true,
  );

  @override
  final MappableFields<DeviceTokenRequestModel> fields = const {
    #deviceToken: _f$deviceToken,
    #platform: _f$platform,
  };
  @override
  final bool ignoreNull = true;

  static DeviceTokenRequestModel _instantiate(DecodingData data) {
    return DeviceTokenRequestModel(
      deviceToken: data.dec(_f$deviceToken),
      platform: data.dec(_f$platform),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static DeviceTokenRequestModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DeviceTokenRequestModel>(map);
  }

  static DeviceTokenRequestModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<DeviceTokenRequestModel>(json);
  }
}

mixin DeviceTokenRequestModelMappable {
  String toJsonString() {
    return DeviceTokenRequestModelMapper.ensureInitialized()
        .encodeJson<DeviceTokenRequestModel>(this as DeviceTokenRequestModel);
  }

  Map<String, dynamic> toJson() {
    return DeviceTokenRequestModelMapper.ensureInitialized()
        .encodeMap<DeviceTokenRequestModel>(this as DeviceTokenRequestModel);
  }

  DeviceTokenRequestModelCopyWith<
    DeviceTokenRequestModel,
    DeviceTokenRequestModel,
    DeviceTokenRequestModel
  >
  get copyWith =>
      _DeviceTokenRequestModelCopyWithImpl<
        DeviceTokenRequestModel,
        DeviceTokenRequestModel
      >(this as DeviceTokenRequestModel, $identity, $identity);
  @override
  String toString() {
    return DeviceTokenRequestModelMapper.ensureInitialized().stringifyValue(
      this as DeviceTokenRequestModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return DeviceTokenRequestModelMapper.ensureInitialized().equalsValue(
      this as DeviceTokenRequestModel,
      other,
    );
  }

  @override
  int get hashCode {
    return DeviceTokenRequestModelMapper.ensureInitialized().hashValue(
      this as DeviceTokenRequestModel,
    );
  }
}

extension DeviceTokenRequestModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DeviceTokenRequestModel, $Out> {
  DeviceTokenRequestModelCopyWith<$R, DeviceTokenRequestModel, $Out>
  get $asDeviceTokenRequestModel => $base.as(
    (v, t, t2) => _DeviceTokenRequestModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class DeviceTokenRequestModelCopyWith<
  $R,
  $In extends DeviceTokenRequestModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? deviceToken, String? platform});
  DeviceTokenRequestModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _DeviceTokenRequestModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DeviceTokenRequestModel, $Out>
    implements
        DeviceTokenRequestModelCopyWith<$R, DeviceTokenRequestModel, $Out> {
  _DeviceTokenRequestModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DeviceTokenRequestModel> $mapper =
      DeviceTokenRequestModelMapper.ensureInitialized();
  @override
  $R call({String? deviceToken, Object? platform = $none}) => $apply(
    FieldCopyWithData({
      if (deviceToken != null) #deviceToken: deviceToken,
      if (platform != $none) #platform: platform,
    }),
  );
  @override
  DeviceTokenRequestModel $make(CopyWithData data) => DeviceTokenRequestModel(
    deviceToken: data.get(#deviceToken, or: $value.deviceToken),
    platform: data.get(#platform, or: $value.platform),
  );

  @override
  DeviceTokenRequestModelCopyWith<$R2, DeviceTokenRequestModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _DeviceTokenRequestModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class DeviceTokenResponseModelMapper
    extends ClassMapperBase<DeviceTokenResponseModel> {
  DeviceTokenResponseModelMapper._();

  static DeviceTokenResponseModelMapper? _instance;
  static DeviceTokenResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = DeviceTokenResponseModelMapper._(),
      );
      BaseRespWrapperMapper.ensureInitialized();
      ResultModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'DeviceTokenResponseModel';

  static ResultModel? _$result(DeviceTokenResponseModel v) => v.result;
  static const Field<DeviceTokenResponseModel, ResultModel> _f$result = Field(
    'result',
    _$result,
    key: r'Result',
  );
  static String? _$status(DeviceTokenResponseModel v) => v.status;
  static const Field<DeviceTokenResponseModel, String> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );

  @override
  final MappableFields<DeviceTokenResponseModel> fields = const {
    #result: _f$result,
    #status: _f$status,
  };
  @override
  final bool ignoreNull = true;

  static DeviceTokenResponseModel _instantiate(DecodingData data) {
    return DeviceTokenResponseModel(
      result: data.dec(_f$result),
      status: data.dec(_f$status),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static DeviceTokenResponseModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DeviceTokenResponseModel>(map);
  }

  static DeviceTokenResponseModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<DeviceTokenResponseModel>(json);
  }
}

mixin DeviceTokenResponseModelMappable {
  String toJsonString() {
    return DeviceTokenResponseModelMapper.ensureInitialized()
        .encodeJson<DeviceTokenResponseModel>(this as DeviceTokenResponseModel);
  }

  Map<String, dynamic> toJson() {
    return DeviceTokenResponseModelMapper.ensureInitialized()
        .encodeMap<DeviceTokenResponseModel>(this as DeviceTokenResponseModel);
  }

  DeviceTokenResponseModelCopyWith<
    DeviceTokenResponseModel,
    DeviceTokenResponseModel,
    DeviceTokenResponseModel
  >
  get copyWith =>
      _DeviceTokenResponseModelCopyWithImpl<
        DeviceTokenResponseModel,
        DeviceTokenResponseModel
      >(this as DeviceTokenResponseModel, $identity, $identity);
  @override
  String toString() {
    return DeviceTokenResponseModelMapper.ensureInitialized().stringifyValue(
      this as DeviceTokenResponseModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return DeviceTokenResponseModelMapper.ensureInitialized().equalsValue(
      this as DeviceTokenResponseModel,
      other,
    );
  }

  @override
  int get hashCode {
    return DeviceTokenResponseModelMapper.ensureInitialized().hashValue(
      this as DeviceTokenResponseModel,
    );
  }
}

extension DeviceTokenResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DeviceTokenResponseModel, $Out> {
  DeviceTokenResponseModelCopyWith<$R, DeviceTokenResponseModel, $Out>
  get $asDeviceTokenResponseModel => $base.as(
    (v, t, t2) => _DeviceTokenResponseModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class DeviceTokenResponseModelCopyWith<
  $R,
  $In extends DeviceTokenResponseModel,
  $Out
>
    implements BaseRespWrapperCopyWith<$R, $In, $Out> {
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result;
  @override
  $R call({ResultModel? result, String? status});
  DeviceTokenResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _DeviceTokenResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DeviceTokenResponseModel, $Out>
    implements
        DeviceTokenResponseModelCopyWith<$R, DeviceTokenResponseModel, $Out> {
  _DeviceTokenResponseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DeviceTokenResponseModel> $mapper =
      DeviceTokenResponseModelMapper.ensureInitialized();
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result =>
      $value.result?.copyWith.$chain((v) => call(result: v));
  @override
  $R call({Object? result = $none, Object? status = $none}) => $apply(
    FieldCopyWithData({
      if (result != $none) #result: result,
      if (status != $none) #status: status,
    }),
  );
  @override
  DeviceTokenResponseModel $make(CopyWithData data) => DeviceTokenResponseModel(
    result: data.get(#result, or: $value.result),
    status: data.get(#status, or: $value.status),
  );

  @override
  DeviceTokenResponseModelCopyWith<$R2, DeviceTokenResponseModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _DeviceTokenResponseModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

