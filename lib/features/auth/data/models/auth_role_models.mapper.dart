// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'auth_role_models.dart';

class RoleSyncResponseModelMapper
    extends ClassMapperBase<RoleSyncResponseModel> {
  RoleSyncResponseModelMapper._();

  static RoleSyncResponseModelMapper? _instance;
  static RoleSyncResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RoleSyncResponseModelMapper._());
      BaseRespWrapperMapper.ensureInitialized();
      ResultModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RoleSyncResponseModel';

  static ResultModel? _$result(RoleSyncResponseModel v) => v.result;
  static const Field<RoleSyncResponseModel, ResultModel> _f$result = Field(
    'result',
    _$result,
    key: r'Result',
  );
  static String? _$role(RoleSyncResponseModel v) => v.role;
  static const Field<RoleSyncResponseModel, String> _f$role = Field(
    'role',
    _$role,
    opt: true,
  );

  @override
  final MappableFields<RoleSyncResponseModel> fields = const {
    #result: _f$result,
    #role: _f$role,
  };
  @override
  final bool ignoreNull = true;

  static RoleSyncResponseModel _instantiate(DecodingData data) {
    return RoleSyncResponseModel(
      result: data.dec(_f$result),
      role: data.dec(_f$role),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RoleSyncResponseModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RoleSyncResponseModel>(map);
  }

  static RoleSyncResponseModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<RoleSyncResponseModel>(json);
  }
}

mixin RoleSyncResponseModelMappable {
  String toJsonString() {
    return RoleSyncResponseModelMapper.ensureInitialized()
        .encodeJson<RoleSyncResponseModel>(this as RoleSyncResponseModel);
  }

  Map<String, dynamic> toJson() {
    return RoleSyncResponseModelMapper.ensureInitialized()
        .encodeMap<RoleSyncResponseModel>(this as RoleSyncResponseModel);
  }

  RoleSyncResponseModelCopyWith<
    RoleSyncResponseModel,
    RoleSyncResponseModel,
    RoleSyncResponseModel
  >
  get copyWith =>
      _RoleSyncResponseModelCopyWithImpl<
        RoleSyncResponseModel,
        RoleSyncResponseModel
      >(this as RoleSyncResponseModel, $identity, $identity);
  @override
  String toString() {
    return RoleSyncResponseModelMapper.ensureInitialized().stringifyValue(
      this as RoleSyncResponseModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return RoleSyncResponseModelMapper.ensureInitialized().equalsValue(
      this as RoleSyncResponseModel,
      other,
    );
  }

  @override
  int get hashCode {
    return RoleSyncResponseModelMapper.ensureInitialized().hashValue(
      this as RoleSyncResponseModel,
    );
  }
}

extension RoleSyncResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RoleSyncResponseModel, $Out> {
  RoleSyncResponseModelCopyWith<$R, RoleSyncResponseModel, $Out>
  get $asRoleSyncResponseModel => $base.as(
    (v, t, t2) => _RoleSyncResponseModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class RoleSyncResponseModelCopyWith<
  $R,
  $In extends RoleSyncResponseModel,
  $Out
>
    implements BaseRespWrapperCopyWith<$R, $In, $Out> {
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result;
  @override
  $R call({ResultModel? result, String? role});
  RoleSyncResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _RoleSyncResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RoleSyncResponseModel, $Out>
    implements RoleSyncResponseModelCopyWith<$R, RoleSyncResponseModel, $Out> {
  _RoleSyncResponseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RoleSyncResponseModel> $mapper =
      RoleSyncResponseModelMapper.ensureInitialized();
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result =>
      $value.result?.copyWith.$chain((v) => call(result: v));
  @override
  $R call({Object? result = $none, Object? role = $none}) => $apply(
    FieldCopyWithData({
      if (result != $none) #result: result,
      if (role != $none) #role: role,
    }),
  );
  @override
  RoleSyncResponseModel $make(CopyWithData data) => RoleSyncResponseModel(
    result: data.get(#result, or: $value.result),
    role: data.get(#role, or: $value.role),
  );

  @override
  RoleSyncResponseModelCopyWith<$R2, RoleSyncResponseModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RoleSyncResponseModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

