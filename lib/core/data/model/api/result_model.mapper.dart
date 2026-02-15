// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'result_model.dart';

class ResultModelMapper extends ClassMapperBase<ResultModel> {
  ResultModelMapper._();

  static ResultModelMapper? _instance;
  static ResultModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ResultModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ResultModel';

  static String? _$errorMessage(ResultModel v) => v.errorMessage;
  static const Field<ResultModel, String> _f$errorMessage = Field(
    'errorMessage',
    _$errorMessage,
    key: r'ErrorNa',
    opt: true,
  );
  static String? _$errorMessageAlt(ResultModel v) => v.errorMessageAlt;
  static const Field<ResultModel, String> _f$errorMessageAlt = Field(
    'errorMessageAlt',
    _$errorMessageAlt,
    key: r'ErrorMessage',
    opt: true,
  );
  static int? _$errorNumber(ResultModel v) => v.errorNumber;
  static const Field<ResultModel, int> _f$errorNumber = Field(
    'errorNumber',
    _$errorNumber,
    key: r'ErrorNo',
    opt: true,
  );
  static int? _$errorNumberAlt(ResultModel v) => v.errorNumberAlt;
  static const Field<ResultModel, int> _f$errorNumberAlt = Field(
    'errorNumberAlt',
    _$errorNumberAlt,
    key: r'ErrorNumber',
    opt: true,
  );

  @override
  final MappableFields<ResultModel> fields = const {
    #errorMessage: _f$errorMessage,
    #errorMessageAlt: _f$errorMessageAlt,
    #errorNumber: _f$errorNumber,
    #errorNumberAlt: _f$errorNumberAlt,
  };
  @override
  final bool ignoreNull = true;

  static ResultModel _instantiate(DecodingData data) {
    return ResultModel(
      errorMessage: data.dec(_f$errorMessage),
      errorMessageAlt: data.dec(_f$errorMessageAlt),
      errorNumber: data.dec(_f$errorNumber),
      errorNumberAlt: data.dec(_f$errorNumberAlt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ResultModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ResultModel>(map);
  }

  static ResultModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<ResultModel>(json);
  }
}

mixin ResultModelMappable {
  String toJsonString() {
    return ResultModelMapper.ensureInitialized().encodeJson<ResultModel>(
      this as ResultModel,
    );
  }

  Map<String, dynamic> toJson() {
    return ResultModelMapper.ensureInitialized().encodeMap<ResultModel>(
      this as ResultModel,
    );
  }

  ResultModelCopyWith<ResultModel, ResultModel, ResultModel> get copyWith =>
      _ResultModelCopyWithImpl<ResultModel, ResultModel>(
        this as ResultModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ResultModelMapper.ensureInitialized().stringifyValue(
      this as ResultModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return ResultModelMapper.ensureInitialized().equalsValue(
      this as ResultModel,
      other,
    );
  }

  @override
  int get hashCode {
    return ResultModelMapper.ensureInitialized().hashValue(this as ResultModel);
  }
}

extension ResultModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ResultModel, $Out> {
  ResultModelCopyWith<$R, ResultModel, $Out> get $asResultModel =>
      $base.as((v, t, t2) => _ResultModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ResultModelCopyWith<$R, $In extends ResultModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? errorMessage,
    String? errorMessageAlt,
    int? errorNumber,
    int? errorNumberAlt,
  });
  ResultModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ResultModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ResultModel, $Out>
    implements ResultModelCopyWith<$R, ResultModel, $Out> {
  _ResultModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ResultModel> $mapper =
      ResultModelMapper.ensureInitialized();
  @override
  $R call({
    Object? errorMessage = $none,
    Object? errorMessageAlt = $none,
    Object? errorNumber = $none,
    Object? errorNumberAlt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (errorMessage != $none) #errorMessage: errorMessage,
      if (errorMessageAlt != $none) #errorMessageAlt: errorMessageAlt,
      if (errorNumber != $none) #errorNumber: errorNumber,
      if (errorNumberAlt != $none) #errorNumberAlt: errorNumberAlt,
    }),
  );
  @override
  ResultModel $make(CopyWithData data) => ResultModel(
    errorMessage: data.get(#errorMessage, or: $value.errorMessage),
    errorMessageAlt: data.get(#errorMessageAlt, or: $value.errorMessageAlt),
    errorNumber: data.get(#errorNumber, or: $value.errorNumber),
    errorNumberAlt: data.get(#errorNumberAlt, or: $value.errorNumberAlt),
  );

  @override
  ResultModelCopyWith<$R2, ResultModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ResultModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

