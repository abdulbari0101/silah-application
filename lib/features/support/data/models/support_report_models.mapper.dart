// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'support_report_models.dart';

class SupportReportRequestModelMapper
    extends ClassMapperBase<SupportReportRequestModel> {
  SupportReportRequestModelMapper._();

  static SupportReportRequestModelMapper? _instance;
  static SupportReportRequestModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = SupportReportRequestModelMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'SupportReportRequestModel';

  static String _$reporterUid(SupportReportRequestModel v) => v.reporterUid;
  static const Field<SupportReportRequestModel, String> _f$reporterUid = Field(
    'reporterUid',
    _$reporterUid,
  );
  static String _$details(SupportReportRequestModel v) => v.details;
  static const Field<SupportReportRequestModel, String> _f$details = Field(
    'details',
    _$details,
  );

  @override
  final MappableFields<SupportReportRequestModel> fields = const {
    #reporterUid: _f$reporterUid,
    #details: _f$details,
  };
  @override
  final bool ignoreNull = true;

  static SupportReportRequestModel _instantiate(DecodingData data) {
    return SupportReportRequestModel(
      reporterUid: data.dec(_f$reporterUid),
      details: data.dec(_f$details),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SupportReportRequestModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SupportReportRequestModel>(map);
  }

  static SupportReportRequestModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<SupportReportRequestModel>(json);
  }
}

mixin SupportReportRequestModelMappable {
  String toJsonString() {
    return SupportReportRequestModelMapper.ensureInitialized()
        .encodeJson<SupportReportRequestModel>(
          this as SupportReportRequestModel,
        );
  }

  Map<String, dynamic> toJson() {
    return SupportReportRequestModelMapper.ensureInitialized()
        .encodeMap<SupportReportRequestModel>(
          this as SupportReportRequestModel,
        );
  }

  SupportReportRequestModelCopyWith<
    SupportReportRequestModel,
    SupportReportRequestModel,
    SupportReportRequestModel
  >
  get copyWith =>
      _SupportReportRequestModelCopyWithImpl<
        SupportReportRequestModel,
        SupportReportRequestModel
      >(this as SupportReportRequestModel, $identity, $identity);
  @override
  String toString() {
    return SupportReportRequestModelMapper.ensureInitialized().stringifyValue(
      this as SupportReportRequestModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return SupportReportRequestModelMapper.ensureInitialized().equalsValue(
      this as SupportReportRequestModel,
      other,
    );
  }

  @override
  int get hashCode {
    return SupportReportRequestModelMapper.ensureInitialized().hashValue(
      this as SupportReportRequestModel,
    );
  }
}

extension SupportReportRequestModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SupportReportRequestModel, $Out> {
  SupportReportRequestModelCopyWith<$R, SupportReportRequestModel, $Out>
  get $asSupportReportRequestModel => $base.as(
    (v, t, t2) => _SupportReportRequestModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SupportReportRequestModelCopyWith<
  $R,
  $In extends SupportReportRequestModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? reporterUid, String? details});
  SupportReportRequestModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SupportReportRequestModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SupportReportRequestModel, $Out>
    implements
        SupportReportRequestModelCopyWith<$R, SupportReportRequestModel, $Out> {
  _SupportReportRequestModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SupportReportRequestModel> $mapper =
      SupportReportRequestModelMapper.ensureInitialized();
  @override
  $R call({String? reporterUid, String? details}) => $apply(
    FieldCopyWithData({
      if (reporterUid != null) #reporterUid: reporterUid,
      if (details != null) #details: details,
    }),
  );
  @override
  SupportReportRequestModel $make(CopyWithData data) =>
      SupportReportRequestModel(
        reporterUid: data.get(#reporterUid, or: $value.reporterUid),
        details: data.get(#details, or: $value.details),
      );

  @override
  SupportReportRequestModelCopyWith<$R2, SupportReportRequestModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SupportReportRequestModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SupportReportResponseModelMapper
    extends ClassMapperBase<SupportReportResponseModel> {
  SupportReportResponseModelMapper._();

  static SupportReportResponseModelMapper? _instance;
  static SupportReportResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = SupportReportResponseModelMapper._(),
      );
      BaseRespWrapperMapper.ensureInitialized();
      ResultModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SupportReportResponseModel';

  static ResultModel? _$result(SupportReportResponseModel v) => v.result;
  static const Field<SupportReportResponseModel, ResultModel> _f$result = Field(
    'result',
    _$result,
    key: r'Result',
  );
  static String? _$reportId(SupportReportResponseModel v) => v.reportId;
  static const Field<SupportReportResponseModel, String> _f$reportId = Field(
    'reportId',
    _$reportId,
    opt: true,
  );

  @override
  final MappableFields<SupportReportResponseModel> fields = const {
    #result: _f$result,
    #reportId: _f$reportId,
  };
  @override
  final bool ignoreNull = true;

  static SupportReportResponseModel _instantiate(DecodingData data) {
    return SupportReportResponseModel(
      result: data.dec(_f$result),
      reportId: data.dec(_f$reportId),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SupportReportResponseModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SupportReportResponseModel>(map);
  }

  static SupportReportResponseModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<SupportReportResponseModel>(json);
  }
}

mixin SupportReportResponseModelMappable {
  String toJsonString() {
    return SupportReportResponseModelMapper.ensureInitialized()
        .encodeJson<SupportReportResponseModel>(
          this as SupportReportResponseModel,
        );
  }

  Map<String, dynamic> toJson() {
    return SupportReportResponseModelMapper.ensureInitialized()
        .encodeMap<SupportReportResponseModel>(
          this as SupportReportResponseModel,
        );
  }

  SupportReportResponseModelCopyWith<
    SupportReportResponseModel,
    SupportReportResponseModel,
    SupportReportResponseModel
  >
  get copyWith =>
      _SupportReportResponseModelCopyWithImpl<
        SupportReportResponseModel,
        SupportReportResponseModel
      >(this as SupportReportResponseModel, $identity, $identity);
  @override
  String toString() {
    return SupportReportResponseModelMapper.ensureInitialized().stringifyValue(
      this as SupportReportResponseModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return SupportReportResponseModelMapper.ensureInitialized().equalsValue(
      this as SupportReportResponseModel,
      other,
    );
  }

  @override
  int get hashCode {
    return SupportReportResponseModelMapper.ensureInitialized().hashValue(
      this as SupportReportResponseModel,
    );
  }
}

extension SupportReportResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SupportReportResponseModel, $Out> {
  SupportReportResponseModelCopyWith<$R, SupportReportResponseModel, $Out>
  get $asSupportReportResponseModel => $base.as(
    (v, t, t2) => _SupportReportResponseModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SupportReportResponseModelCopyWith<
  $R,
  $In extends SupportReportResponseModel,
  $Out
>
    implements BaseRespWrapperCopyWith<$R, $In, $Out> {
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result;
  @override
  $R call({ResultModel? result, String? reportId});
  SupportReportResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SupportReportResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SupportReportResponseModel, $Out>
    implements
        SupportReportResponseModelCopyWith<
          $R,
          SupportReportResponseModel,
          $Out
        > {
  _SupportReportResponseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SupportReportResponseModel> $mapper =
      SupportReportResponseModelMapper.ensureInitialized();
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result =>
      $value.result?.copyWith.$chain((v) => call(result: v));
  @override
  $R call({Object? result = $none, Object? reportId = $none}) => $apply(
    FieldCopyWithData({
      if (result != $none) #result: result,
      if (reportId != $none) #reportId: reportId,
    }),
  );
  @override
  SupportReportResponseModel $make(CopyWithData data) =>
      SupportReportResponseModel(
        result: data.get(#result, or: $value.result),
        reportId: data.get(#reportId, or: $value.reportId),
      );

  @override
  SupportReportResponseModelCopyWith<$R2, SupportReportResponseModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SupportReportResponseModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

