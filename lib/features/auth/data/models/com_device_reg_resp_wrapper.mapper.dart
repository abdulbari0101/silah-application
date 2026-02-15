// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'com_device_reg_resp_wrapper.dart';

class ComDeviceRegRespWrapperMapper
    extends ClassMapperBase<ComDeviceRegRespWrapper> {
  ComDeviceRegRespWrapperMapper._();

  static ComDeviceRegRespWrapperMapper? _instance;
  static ComDeviceRegRespWrapperMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = ComDeviceRegRespWrapperMapper._(),
      );
      BaseRespWrapperMapper.ensureInitialized();
      ResultModelMapper.ensureInitialized();
      DeviceTokenModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ComDeviceRegRespWrapper';

  static ResultModel? _$result(ComDeviceRegRespWrapper v) => v.result;
  static const Field<ComDeviceRegRespWrapper, ResultModel> _f$result = Field(
    'result',
    _$result,
    key: r'Result',
    opt: true,
  );
  static DeviceTokenModel? _$token(ComDeviceRegRespWrapper v) => v.token;
  static const Field<ComDeviceRegRespWrapper, DeviceTokenModel> _f$token =
      Field('token', _$token, key: r'TOKEN', opt: true);

  @override
  final MappableFields<ComDeviceRegRespWrapper> fields = const {
    #result: _f$result,
    #token: _f$token,
  };
  @override
  final bool ignoreNull = true;

  static ComDeviceRegRespWrapper _instantiate(DecodingData data) {
    return ComDeviceRegRespWrapper(
      result: data.dec(_f$result),
      token: data.dec(_f$token),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ComDeviceRegRespWrapper fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ComDeviceRegRespWrapper>(map);
  }

  static ComDeviceRegRespWrapper fromJsonString(String json) {
    return ensureInitialized().decodeJson<ComDeviceRegRespWrapper>(json);
  }
}

mixin ComDeviceRegRespWrapperMappable {
  String toJsonString() {
    return ComDeviceRegRespWrapperMapper.ensureInitialized()
        .encodeJson<ComDeviceRegRespWrapper>(this as ComDeviceRegRespWrapper);
  }

  Map<String, dynamic> toJson() {
    return ComDeviceRegRespWrapperMapper.ensureInitialized()
        .encodeMap<ComDeviceRegRespWrapper>(this as ComDeviceRegRespWrapper);
  }

  ComDeviceRegRespWrapperCopyWith<
    ComDeviceRegRespWrapper,
    ComDeviceRegRespWrapper,
    ComDeviceRegRespWrapper
  >
  get copyWith =>
      _ComDeviceRegRespWrapperCopyWithImpl<
        ComDeviceRegRespWrapper,
        ComDeviceRegRespWrapper
      >(this as ComDeviceRegRespWrapper, $identity, $identity);
  @override
  String toString() {
    return ComDeviceRegRespWrapperMapper.ensureInitialized().stringifyValue(
      this as ComDeviceRegRespWrapper,
    );
  }

  @override
  bool operator ==(Object other) {
    return ComDeviceRegRespWrapperMapper.ensureInitialized().equalsValue(
      this as ComDeviceRegRespWrapper,
      other,
    );
  }

  @override
  int get hashCode {
    return ComDeviceRegRespWrapperMapper.ensureInitialized().hashValue(
      this as ComDeviceRegRespWrapper,
    );
  }
}

extension ComDeviceRegRespWrapperValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ComDeviceRegRespWrapper, $Out> {
  ComDeviceRegRespWrapperCopyWith<$R, ComDeviceRegRespWrapper, $Out>
  get $asComDeviceRegRespWrapper => $base.as(
    (v, t, t2) => _ComDeviceRegRespWrapperCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ComDeviceRegRespWrapperCopyWith<
  $R,
  $In extends ComDeviceRegRespWrapper,
  $Out
>
    implements BaseRespWrapperCopyWith<$R, $In, $Out> {
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result;
  DeviceTokenModelCopyWith<$R, DeviceTokenModel, DeviceTokenModel>? get token;
  @override
  $R call({ResultModel? result, DeviceTokenModel? token});
  ComDeviceRegRespWrapperCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ComDeviceRegRespWrapperCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ComDeviceRegRespWrapper, $Out>
    implements
        ComDeviceRegRespWrapperCopyWith<$R, ComDeviceRegRespWrapper, $Out> {
  _ComDeviceRegRespWrapperCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ComDeviceRegRespWrapper> $mapper =
      ComDeviceRegRespWrapperMapper.ensureInitialized();
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result =>
      $value.result?.copyWith.$chain((v) => call(result: v));
  @override
  DeviceTokenModelCopyWith<$R, DeviceTokenModel, DeviceTokenModel>? get token =>
      $value.token?.copyWith.$chain((v) => call(token: v));
  @override
  $R call({Object? result = $none, Object? token = $none}) => $apply(
    FieldCopyWithData({
      if (result != $none) #result: result,
      if (token != $none) #token: token,
    }),
  );
  @override
  ComDeviceRegRespWrapper $make(CopyWithData data) => ComDeviceRegRespWrapper(
    result: data.get(#result, or: $value.result),
    token: data.get(#token, or: $value.token),
  );

  @override
  ComDeviceRegRespWrapperCopyWith<$R2, ComDeviceRegRespWrapper, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ComDeviceRegRespWrapperCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

