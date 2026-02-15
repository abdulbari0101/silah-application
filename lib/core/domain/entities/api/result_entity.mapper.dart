// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'result_entity.dart';

class ResultEntityMapper extends ClassMapperBase<ResultEntity> {
  ResultEntityMapper._();

  static ResultEntityMapper? _instance;
  static ResultEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ResultEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ResultEntity';

  static String? _$errorMessage(ResultEntity v) => v.errorMessage;
  static const Field<ResultEntity, String> _f$errorMessage = Field(
    'errorMessage',
    _$errorMessage,
    opt: true,
  );
  static int? _$errorNumber(ResultEntity v) => v.errorNumber;
  static const Field<ResultEntity, int> _f$errorNumber = Field(
    'errorNumber',
    _$errorNumber,
    opt: true,
  );

  @override
  final MappableFields<ResultEntity> fields = const {
    #errorMessage: _f$errorMessage,
    #errorNumber: _f$errorNumber,
  };
  @override
  final bool ignoreNull = true;

  static ResultEntity _instantiate(DecodingData data) {
    return ResultEntity(
      errorMessage: data.dec(_f$errorMessage),
      errorNumber: data.dec(_f$errorNumber),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ResultEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ResultEntity>(map);
  }

  static ResultEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<ResultEntity>(json);
  }
}

mixin ResultEntityMappable {
  String toJsonString() {
    return ResultEntityMapper.ensureInitialized().encodeJson<ResultEntity>(
      this as ResultEntity,
    );
  }

  Map<String, dynamic> toJson() {
    return ResultEntityMapper.ensureInitialized().encodeMap<ResultEntity>(
      this as ResultEntity,
    );
  }

  ResultEntityCopyWith<ResultEntity, ResultEntity, ResultEntity> get copyWith =>
      _ResultEntityCopyWithImpl<ResultEntity, ResultEntity>(
        this as ResultEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ResultEntityMapper.ensureInitialized().stringifyValue(
      this as ResultEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return ResultEntityMapper.ensureInitialized().equalsValue(
      this as ResultEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return ResultEntityMapper.ensureInitialized().hashValue(
      this as ResultEntity,
    );
  }
}

extension ResultEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ResultEntity, $Out> {
  ResultEntityCopyWith<$R, ResultEntity, $Out> get $asResultEntity =>
      $base.as((v, t, t2) => _ResultEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ResultEntityCopyWith<$R, $In extends ResultEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? errorMessage, int? errorNumber});
  ResultEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ResultEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ResultEntity, $Out>
    implements ResultEntityCopyWith<$R, ResultEntity, $Out> {
  _ResultEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ResultEntity> $mapper =
      ResultEntityMapper.ensureInitialized();
  @override
  $R call({Object? errorMessage = $none, Object? errorNumber = $none}) =>
      $apply(
        FieldCopyWithData({
          if (errorMessage != $none) #errorMessage: errorMessage,
          if (errorNumber != $none) #errorNumber: errorNumber,
        }),
      );
  @override
  ResultEntity $make(CopyWithData data) => ResultEntity(
    errorMessage: data.get(#errorMessage, or: $value.errorMessage),
    errorNumber: data.get(#errorNumber, or: $value.errorNumber),
  );

  @override
  ResultEntityCopyWith<$R2, ResultEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ResultEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

