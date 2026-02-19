// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'verification_models.dart';

class VerificationRequestModelMapper
    extends ClassMapperBase<VerificationRequestModel> {
  VerificationRequestModelMapper._();

  static VerificationRequestModelMapper? _instance;
  static VerificationRequestModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = VerificationRequestModelMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'VerificationRequestModel';

  static String _$licenseNumber(VerificationRequestModel v) => v.licenseNumber;
  static const Field<VerificationRequestModel, String> _f$licenseNumber = Field(
    'licenseNumber',
    _$licenseNumber,
  );
  static String _$nationalId(VerificationRequestModel v) => v.nationalId;
  static const Field<VerificationRequestModel, String> _f$nationalId = Field(
    'nationalId',
    _$nationalId,
  );
  static String _$lawyerUid(VerificationRequestModel v) => v.lawyerUid;
  static const Field<VerificationRequestModel, String> _f$lawyerUid = Field(
    'lawyerUid',
    _$lawyerUid,
  );

  @override
  final MappableFields<VerificationRequestModel> fields = const {
    #licenseNumber: _f$licenseNumber,
    #nationalId: _f$nationalId,
    #lawyerUid: _f$lawyerUid,
  };
  @override
  final bool ignoreNull = true;

  static VerificationRequestModel _instantiate(DecodingData data) {
    return VerificationRequestModel(
      licenseNumber: data.dec(_f$licenseNumber),
      nationalId: data.dec(_f$nationalId),
      lawyerUid: data.dec(_f$lawyerUid),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static VerificationRequestModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VerificationRequestModel>(map);
  }

  static VerificationRequestModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<VerificationRequestModel>(json);
  }
}

mixin VerificationRequestModelMappable {
  String toJsonString() {
    return VerificationRequestModelMapper.ensureInitialized()
        .encodeJson<VerificationRequestModel>(this as VerificationRequestModel);
  }

  Map<String, dynamic> toJson() {
    return VerificationRequestModelMapper.ensureInitialized()
        .encodeMap<VerificationRequestModel>(this as VerificationRequestModel);
  }

  VerificationRequestModelCopyWith<
    VerificationRequestModel,
    VerificationRequestModel,
    VerificationRequestModel
  >
  get copyWith =>
      _VerificationRequestModelCopyWithImpl<
        VerificationRequestModel,
        VerificationRequestModel
      >(this as VerificationRequestModel, $identity, $identity);
  @override
  String toString() {
    return VerificationRequestModelMapper.ensureInitialized().stringifyValue(
      this as VerificationRequestModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return VerificationRequestModelMapper.ensureInitialized().equalsValue(
      this as VerificationRequestModel,
      other,
    );
  }

  @override
  int get hashCode {
    return VerificationRequestModelMapper.ensureInitialized().hashValue(
      this as VerificationRequestModel,
    );
  }
}

extension VerificationRequestModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, VerificationRequestModel, $Out> {
  VerificationRequestModelCopyWith<$R, VerificationRequestModel, $Out>
  get $asVerificationRequestModel => $base.as(
    (v, t, t2) => _VerificationRequestModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class VerificationRequestModelCopyWith<
  $R,
  $In extends VerificationRequestModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? licenseNumber, String? nationalId, String? lawyerUid});
  VerificationRequestModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _VerificationRequestModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, VerificationRequestModel, $Out>
    implements
        VerificationRequestModelCopyWith<$R, VerificationRequestModel, $Out> {
  _VerificationRequestModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<VerificationRequestModel> $mapper =
      VerificationRequestModelMapper.ensureInitialized();
  @override
  $R call({String? licenseNumber, String? nationalId, String? lawyerUid}) =>
      $apply(
        FieldCopyWithData({
          if (licenseNumber != null) #licenseNumber: licenseNumber,
          if (nationalId != null) #nationalId: nationalId,
          if (lawyerUid != null) #lawyerUid: lawyerUid,
        }),
      );
  @override
  VerificationRequestModel $make(CopyWithData data) => VerificationRequestModel(
    licenseNumber: data.get(#licenseNumber, or: $value.licenseNumber),
    nationalId: data.get(#nationalId, or: $value.nationalId),
    lawyerUid: data.get(#lawyerUid, or: $value.lawyerUid),
  );

  @override
  VerificationRequestModelCopyWith<$R2, VerificationRequestModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _VerificationRequestModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class VerificationResponseModelMapper
    extends ClassMapperBase<VerificationResponseModel> {
  VerificationResponseModelMapper._();

  static VerificationResponseModelMapper? _instance;
  static VerificationResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = VerificationResponseModelMapper._(),
      );
      BaseRespWrapperMapper.ensureInitialized();
      ResultModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'VerificationResponseModel';

  static ResultModel? _$result(VerificationResponseModel v) => v.result;
  static const Field<VerificationResponseModel, ResultModel> _f$result = Field(
    'result',
    _$result,
    key: r'Result',
  );
  static String? _$status(VerificationResponseModel v) => v.status;
  static const Field<VerificationResponseModel, String> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );

  @override
  final MappableFields<VerificationResponseModel> fields = const {
    #result: _f$result,
    #status: _f$status,
  };
  @override
  final bool ignoreNull = true;

  static VerificationResponseModel _instantiate(DecodingData data) {
    return VerificationResponseModel(
      result: data.dec(_f$result),
      status: data.dec(_f$status),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static VerificationResponseModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VerificationResponseModel>(map);
  }

  static VerificationResponseModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<VerificationResponseModel>(json);
  }
}

mixin VerificationResponseModelMappable {
  String toJsonString() {
    return VerificationResponseModelMapper.ensureInitialized()
        .encodeJson<VerificationResponseModel>(
          this as VerificationResponseModel,
        );
  }

  Map<String, dynamic> toJson() {
    return VerificationResponseModelMapper.ensureInitialized()
        .encodeMap<VerificationResponseModel>(
          this as VerificationResponseModel,
        );
  }

  VerificationResponseModelCopyWith<
    VerificationResponseModel,
    VerificationResponseModel,
    VerificationResponseModel
  >
  get copyWith =>
      _VerificationResponseModelCopyWithImpl<
        VerificationResponseModel,
        VerificationResponseModel
      >(this as VerificationResponseModel, $identity, $identity);
  @override
  String toString() {
    return VerificationResponseModelMapper.ensureInitialized().stringifyValue(
      this as VerificationResponseModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return VerificationResponseModelMapper.ensureInitialized().equalsValue(
      this as VerificationResponseModel,
      other,
    );
  }

  @override
  int get hashCode {
    return VerificationResponseModelMapper.ensureInitialized().hashValue(
      this as VerificationResponseModel,
    );
  }
}

extension VerificationResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, VerificationResponseModel, $Out> {
  VerificationResponseModelCopyWith<$R, VerificationResponseModel, $Out>
  get $asVerificationResponseModel => $base.as(
    (v, t, t2) => _VerificationResponseModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class VerificationResponseModelCopyWith<
  $R,
  $In extends VerificationResponseModel,
  $Out
>
    implements BaseRespWrapperCopyWith<$R, $In, $Out> {
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result;
  @override
  $R call({ResultModel? result, String? status});
  VerificationResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _VerificationResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, VerificationResponseModel, $Out>
    implements
        VerificationResponseModelCopyWith<$R, VerificationResponseModel, $Out> {
  _VerificationResponseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<VerificationResponseModel> $mapper =
      VerificationResponseModelMapper.ensureInitialized();
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
  VerificationResponseModel $make(CopyWithData data) =>
      VerificationResponseModel(
        result: data.get(#result, or: $value.result),
        status: data.get(#status, or: $value.status),
      );

  @override
  VerificationResponseModelCopyWith<$R2, VerificationResponseModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _VerificationResponseModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

