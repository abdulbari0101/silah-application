// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'ex_data_auth_model.dart';

class ExDataAuthModelMapper extends ClassMapperBase<ExDataAuthModel> {
  ExDataAuthModelMapper._();

  static ExDataAuthModelMapper? _instance;
  static ExDataAuthModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ExDataAuthModelMapper._());
      BaseRespWrapperMapper.ensureInitialized();
      CustomerModelMapper.ensureInitialized();
      ResultModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ExDataAuthModel';

  static CustomerModel? _$customer(ExDataAuthModel v) => v.customer;
  static const Field<ExDataAuthModel, CustomerModel> _f$customer = Field(
    'customer',
    _$customer,
    key: r'CUSTOMER',
    opt: true,
  );
  static ResultModel? _$result(ExDataAuthModel v) => v.result;
  static const Field<ExDataAuthModel, ResultModel> _f$result = Field(
    'result',
    _$result,
    key: r'Result',
    opt: true,
  );

  @override
  final MappableFields<ExDataAuthModel> fields = const {
    #customer: _f$customer,
    #result: _f$result,
  };
  @override
  final bool ignoreNull = true;

  static ExDataAuthModel _instantiate(DecodingData data) {
    return ExDataAuthModel(
      customer: data.dec(_f$customer),
      result: data.dec(_f$result),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ExDataAuthModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ExDataAuthModel>(map);
  }

  static ExDataAuthModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<ExDataAuthModel>(json);
  }
}

mixin ExDataAuthModelMappable {
  String toJsonString() {
    return ExDataAuthModelMapper.ensureInitialized()
        .encodeJson<ExDataAuthModel>(this as ExDataAuthModel);
  }

  Map<String, dynamic> toJson() {
    return ExDataAuthModelMapper.ensureInitialized().encodeMap<ExDataAuthModel>(
      this as ExDataAuthModel,
    );
  }

  ExDataAuthModelCopyWith<ExDataAuthModel, ExDataAuthModel, ExDataAuthModel>
  get copyWith =>
      _ExDataAuthModelCopyWithImpl<ExDataAuthModel, ExDataAuthModel>(
        this as ExDataAuthModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ExDataAuthModelMapper.ensureInitialized().stringifyValue(
      this as ExDataAuthModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return ExDataAuthModelMapper.ensureInitialized().equalsValue(
      this as ExDataAuthModel,
      other,
    );
  }

  @override
  int get hashCode {
    return ExDataAuthModelMapper.ensureInitialized().hashValue(
      this as ExDataAuthModel,
    );
  }
}

extension ExDataAuthModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ExDataAuthModel, $Out> {
  ExDataAuthModelCopyWith<$R, ExDataAuthModel, $Out> get $asExDataAuthModel =>
      $base.as((v, t, t2) => _ExDataAuthModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ExDataAuthModelCopyWith<$R, $In extends ExDataAuthModel, $Out>
    implements BaseRespWrapperCopyWith<$R, $In, $Out> {
  CustomerModelCopyWith<$R, CustomerModel, CustomerModel>? get customer;
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result;
  @override
  $R call({CustomerModel? customer, ResultModel? result});
  ExDataAuthModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ExDataAuthModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ExDataAuthModel, $Out>
    implements ExDataAuthModelCopyWith<$R, ExDataAuthModel, $Out> {
  _ExDataAuthModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ExDataAuthModel> $mapper =
      ExDataAuthModelMapper.ensureInitialized();
  @override
  CustomerModelCopyWith<$R, CustomerModel, CustomerModel>? get customer =>
      $value.customer?.copyWith.$chain((v) => call(customer: v));
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result =>
      $value.result?.copyWith.$chain((v) => call(result: v));
  @override
  $R call({Object? customer = $none, Object? result = $none}) => $apply(
    FieldCopyWithData({
      if (customer != $none) #customer: customer,
      if (result != $none) #result: result,
    }),
  );
  @override
  ExDataAuthModel $make(CopyWithData data) => ExDataAuthModel(
    customer: data.get(#customer, or: $value.customer),
    result: data.get(#result, or: $value.result),
  );

  @override
  ExDataAuthModelCopyWith<$R2, ExDataAuthModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ExDataAuthModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

