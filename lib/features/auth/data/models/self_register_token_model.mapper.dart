// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'self_register_token_model.dart';

class SelfRegisterTokenModelMapper
    extends ClassMapperBase<SelfRegisterTokenModel> {
  SelfRegisterTokenModelMapper._();

  static SelfRegisterTokenModelMapper? _instance;
  static SelfRegisterTokenModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SelfRegisterTokenModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SelfRegisterTokenModel';

  static String? _$accessToken(SelfRegisterTokenModel v) => v.accessToken;
  static const Field<SelfRegisterTokenModel, String> _f$accessToken = Field(
    'accessToken',
    _$accessToken,
    key: r'access_token',
    opt: true,
  );
  static String? _$tokenType(SelfRegisterTokenModel v) => v.tokenType;
  static const Field<SelfRegisterTokenModel, String> _f$tokenType = Field(
    'tokenType',
    _$tokenType,
    key: r'token_type',
    opt: true,
  );

  @override
  final MappableFields<SelfRegisterTokenModel> fields = const {
    #accessToken: _f$accessToken,
    #tokenType: _f$tokenType,
  };
  @override
  final bool ignoreNull = true;

  static SelfRegisterTokenModel _instantiate(DecodingData data) {
    return SelfRegisterTokenModel(
      accessToken: data.dec(_f$accessToken),
      tokenType: data.dec(_f$tokenType),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SelfRegisterTokenModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SelfRegisterTokenModel>(map);
  }

  static SelfRegisterTokenModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<SelfRegisterTokenModel>(json);
  }
}

mixin SelfRegisterTokenModelMappable {
  String toJsonString() {
    return SelfRegisterTokenModelMapper.ensureInitialized()
        .encodeJson<SelfRegisterTokenModel>(this as SelfRegisterTokenModel);
  }

  Map<String, dynamic> toJson() {
    return SelfRegisterTokenModelMapper.ensureInitialized()
        .encodeMap<SelfRegisterTokenModel>(this as SelfRegisterTokenModel);
  }

  SelfRegisterTokenModelCopyWith<
    SelfRegisterTokenModel,
    SelfRegisterTokenModel,
    SelfRegisterTokenModel
  >
  get copyWith =>
      _SelfRegisterTokenModelCopyWithImpl<
        SelfRegisterTokenModel,
        SelfRegisterTokenModel
      >(this as SelfRegisterTokenModel, $identity, $identity);
  @override
  String toString() {
    return SelfRegisterTokenModelMapper.ensureInitialized().stringifyValue(
      this as SelfRegisterTokenModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return SelfRegisterTokenModelMapper.ensureInitialized().equalsValue(
      this as SelfRegisterTokenModel,
      other,
    );
  }

  @override
  int get hashCode {
    return SelfRegisterTokenModelMapper.ensureInitialized().hashValue(
      this as SelfRegisterTokenModel,
    );
  }
}

extension SelfRegisterTokenModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SelfRegisterTokenModel, $Out> {
  SelfRegisterTokenModelCopyWith<$R, SelfRegisterTokenModel, $Out>
  get $asSelfRegisterTokenModel => $base.as(
    (v, t, t2) => _SelfRegisterTokenModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SelfRegisterTokenModelCopyWith<
  $R,
  $In extends SelfRegisterTokenModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? accessToken, String? tokenType});
  SelfRegisterTokenModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SelfRegisterTokenModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SelfRegisterTokenModel, $Out>
    implements
        SelfRegisterTokenModelCopyWith<$R, SelfRegisterTokenModel, $Out> {
  _SelfRegisterTokenModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SelfRegisterTokenModel> $mapper =
      SelfRegisterTokenModelMapper.ensureInitialized();
  @override
  $R call({Object? accessToken = $none, Object? tokenType = $none}) => $apply(
    FieldCopyWithData({
      if (accessToken != $none) #accessToken: accessToken,
      if (tokenType != $none) #tokenType: tokenType,
    }),
  );
  @override
  SelfRegisterTokenModel $make(CopyWithData data) => SelfRegisterTokenModel(
    accessToken: data.get(#accessToken, or: $value.accessToken),
    tokenType: data.get(#tokenType, or: $value.tokenType),
  );

  @override
  SelfRegisterTokenModelCopyWith<$R2, SelfRegisterTokenModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SelfRegisterTokenModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

