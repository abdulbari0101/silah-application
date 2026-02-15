// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'response_wrapper.dart';

class BaseRespWrapperMapper extends ClassMapperBase<BaseRespWrapper> {
  BaseRespWrapperMapper._();

  static BaseRespWrapperMapper? _instance;
  static BaseRespWrapperMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BaseRespWrapperMapper._());
      ResultModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'BaseRespWrapper';

  static ResultModel? _$result(BaseRespWrapper v) => v.result;
  static const Field<BaseRespWrapper, ResultModel> _f$result = Field(
    'result',
    _$result,
    key: r'Result',
  );

  @override
  final MappableFields<BaseRespWrapper> fields = const {#result: _f$result};
  @override
  final bool ignoreNull = true;

  static BaseRespWrapper _instantiate(DecodingData data) {
    return BaseRespWrapper(result: data.dec(_f$result));
  }

  @override
  final Function instantiate = _instantiate;

  static BaseRespWrapper fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BaseRespWrapper>(map);
  }

  static BaseRespWrapper fromJsonString(String json) {
    return ensureInitialized().decodeJson<BaseRespWrapper>(json);
  }
}

mixin BaseRespWrapperMappable {
  String toJsonString() {
    return BaseRespWrapperMapper.ensureInitialized()
        .encodeJson<BaseRespWrapper>(this as BaseRespWrapper);
  }

  Map<String, dynamic> toJson() {
    return BaseRespWrapperMapper.ensureInitialized().encodeMap<BaseRespWrapper>(
      this as BaseRespWrapper,
    );
  }

  BaseRespWrapperCopyWith<BaseRespWrapper, BaseRespWrapper, BaseRespWrapper>
  get copyWith =>
      _BaseRespWrapperCopyWithImpl<BaseRespWrapper, BaseRespWrapper>(
        this as BaseRespWrapper,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return BaseRespWrapperMapper.ensureInitialized().stringifyValue(
      this as BaseRespWrapper,
    );
  }

  @override
  bool operator ==(Object other) {
    return BaseRespWrapperMapper.ensureInitialized().equalsValue(
      this as BaseRespWrapper,
      other,
    );
  }

  @override
  int get hashCode {
    return BaseRespWrapperMapper.ensureInitialized().hashValue(
      this as BaseRespWrapper,
    );
  }
}

extension BaseRespWrapperValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BaseRespWrapper, $Out> {
  BaseRespWrapperCopyWith<$R, BaseRespWrapper, $Out> get $asBaseRespWrapper =>
      $base.as((v, t, t2) => _BaseRespWrapperCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BaseRespWrapperCopyWith<$R, $In extends BaseRespWrapper, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result;
  $R call({ResultModel? result});
  BaseRespWrapperCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _BaseRespWrapperCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BaseRespWrapper, $Out>
    implements BaseRespWrapperCopyWith<$R, BaseRespWrapper, $Out> {
  _BaseRespWrapperCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BaseRespWrapper> $mapper =
      BaseRespWrapperMapper.ensureInitialized();
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result =>
      $value.result?.copyWith.$chain((v) => call(result: v));
  @override
  $R call({Object? result = $none}) =>
      $apply(FieldCopyWithData({if (result != $none) #result: result}));
  @override
  BaseRespWrapper $make(CopyWithData data) =>
      BaseRespWrapper(result: data.get(#result, or: $value.result));

  @override
  BaseRespWrapperCopyWith<$R2, BaseRespWrapper, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _BaseRespWrapperCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

