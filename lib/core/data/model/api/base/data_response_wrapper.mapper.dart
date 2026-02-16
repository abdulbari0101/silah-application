// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'data_response_wrapper.dart';

class DataRespWrapperMapper extends ClassMapperBase<DataRespWrapper> {
  DataRespWrapperMapper._();

  static DataRespWrapperMapper? _instance;
  static DataRespWrapperMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DataRespWrapperMapper._());
      BaseRespWrapperMapper.ensureInitialized();
      ResultModelMapper.ensureInitialized();
      DataModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'DataRespWrapper';
  @override
  Function get typeFactory =>
      <D extends DataModel>(f) => f<DataRespWrapper<D>>();

  static ResultModel? _$result(DataRespWrapper v) => v.result;
  static const Field<DataRespWrapper, ResultModel> _f$result = Field(
    'result',
    _$result,
    key: r'Result',
  );
  static DataModel? _$data(DataRespWrapper v) => v.data;
  static dynamic _arg$data<D extends DataModel>(f) => f<D>();
  static const Field<DataRespWrapper, DataModel> _f$data = Field(
    'data',
    _$data,
    key: r'Data',
    arg: _arg$data,
  );

  @override
  final MappableFields<DataRespWrapper> fields = const {
    #result: _f$result,
    #data: _f$data,
  };
  @override
  final bool ignoreNull = true;

  static DataRespWrapper<D> _instantiate<D extends DataModel>(
    DecodingData data,
  ) {
    return DataRespWrapper(
      result: data.dec(_f$result),
      data: data.dec(_f$data),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static DataRespWrapper<D> fromJson<D extends DataModel>(
    Map<String, dynamic> map,
  ) {
    return ensureInitialized().decodeMap<DataRespWrapper<D>>(map);
  }

  static DataRespWrapper<D> fromJsonString<D extends DataModel>(String json) {
    return ensureInitialized().decodeJson<DataRespWrapper<D>>(json);
  }
}

mixin DataRespWrapperMappable<D extends DataModel> {
  String toJsonString() {
    return DataRespWrapperMapper.ensureInitialized()
        .encodeJson<DataRespWrapper<D>>(this as DataRespWrapper<D>);
  }

  Map<String, dynamic> toJson() {
    return DataRespWrapperMapper.ensureInitialized()
        .encodeMap<DataRespWrapper<D>>(this as DataRespWrapper<D>);
  }

  DataRespWrapperCopyWith<
    DataRespWrapper<D>,
    DataRespWrapper<D>,
    DataRespWrapper<D>,
    D
  >
  get copyWith =>
      _DataRespWrapperCopyWithImpl<DataRespWrapper<D>, DataRespWrapper<D>, D>(
        this as DataRespWrapper<D>,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return DataRespWrapperMapper.ensureInitialized().stringifyValue(
      this as DataRespWrapper<D>,
    );
  }

  @override
  bool operator ==(Object other) {
    return DataRespWrapperMapper.ensureInitialized().equalsValue(
      this as DataRespWrapper<D>,
      other,
    );
  }

  @override
  int get hashCode {
    return DataRespWrapperMapper.ensureInitialized().hashValue(
      this as DataRespWrapper<D>,
    );
  }
}

extension DataRespWrapperValueCopy<$R, $Out, D extends DataModel>
    on ObjectCopyWith<$R, DataRespWrapper<D>, $Out> {
  DataRespWrapperCopyWith<$R, DataRespWrapper<D>, $Out, D>
  get $asDataRespWrapper => $base.as(
    (v, t, t2) => _DataRespWrapperCopyWithImpl<$R, $Out, D>(v, t, t2),
  );
}

abstract class DataRespWrapperCopyWith<
  $R,
  $In extends DataRespWrapper<D>,
  $Out,
  D extends DataModel
>
    implements BaseRespWrapperCopyWith<$R, $In, $Out> {
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result;
  DataModelCopyWith<$R, DataModel, D>? get data;
  @override
  $R call({ResultModel? result, D? data});
  DataRespWrapperCopyWith<$R2, $In, $Out2, D> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _DataRespWrapperCopyWithImpl<$R, $Out, D extends DataModel>
    extends ClassCopyWithBase<$R, DataRespWrapper<D>, $Out>
    implements DataRespWrapperCopyWith<$R, DataRespWrapper<D>, $Out, D> {
  _DataRespWrapperCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DataRespWrapper> $mapper =
      DataRespWrapperMapper.ensureInitialized();
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result =>
      $value.result?.copyWith.$chain((v) => call(result: v));
  @override
  DataModelCopyWith<$R, DataModel, D>? get data =>
      $value.data?.copyWith.$chain((v) => call(data: v));
  @override
  $R call({Object? result = $none, Object? data = $none}) => $apply(
    FieldCopyWithData({
      if (result != $none) #result: result,
      if (data != $none) #data: data,
    }),
  );
  @override
  DataRespWrapper<D> $make(CopyWithData data) => DataRespWrapper(
    result: data.get(#result, or: $value.result),
    data: data.get(#data, or: $value.data),
  );

  @override
  DataRespWrapperCopyWith<$R2, DataRespWrapper<D>, $Out2, D> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _DataRespWrapperCopyWithImpl<$R2, $Out2, D>($value, $cast, t);
}

