// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'data_model.dart';

class DataModelMapper extends ClassMapperBase<DataModel> {
  DataModelMapper._();

  static DataModelMapper? _instance;
  static DataModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DataModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DataModel';

  static String? _$currency(DataModel v) => v.currency;
  static const Field<DataModel, String> _f$currency = Field(
    'currency',
    _$currency,
    key: r'Currency',
    opt: true,
  );
  static String? _$balance(DataModel v) => v.balance;
  static const Field<DataModel, String> _f$balance = Field(
    'balance',
    _$balance,
    key: r'Balance',
    opt: true,
  );
  static String? _$custName(DataModel v) => v.custName;
  static const Field<DataModel, String> _f$custName = Field(
    'custName',
    _$custName,
    key: r'CustName',
    opt: true,
  );
  static String? _$otp(DataModel v) => v.otp;
  static const Field<DataModel, String> _f$otp = Field(
    'otp',
    _$otp,
    key: r'OTP_Code',
    opt: true,
  );
  static String? _$token(DataModel v) => v.token;
  static const Field<DataModel, String> _f$token = Field(
    'token',
    _$token,
    key: r'OTP',
    opt: true,
  );

  @override
  final MappableFields<DataModel> fields = const {
    #currency: _f$currency,
    #balance: _f$balance,
    #custName: _f$custName,
    #otp: _f$otp,
    #token: _f$token,
  };
  @override
  final bool ignoreNull = true;

  static DataModel _instantiate(DecodingData data) {
    return DataModel(
      currency: data.dec(_f$currency),
      balance: data.dec(_f$balance),
      custName: data.dec(_f$custName),
      otp: data.dec(_f$otp),
      token: data.dec(_f$token),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static DataModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DataModel>(map);
  }

  static DataModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<DataModel>(json);
  }
}

mixin DataModelMappable {
  String toJsonString() {
    return DataModelMapper.ensureInitialized().encodeJson<DataModel>(
      this as DataModel,
    );
  }

  Map<String, dynamic> toJson() {
    return DataModelMapper.ensureInitialized().encodeMap<DataModel>(
      this as DataModel,
    );
  }

  DataModelCopyWith<DataModel, DataModel, DataModel> get copyWith =>
      _DataModelCopyWithImpl<DataModel, DataModel>(
        this as DataModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return DataModelMapper.ensureInitialized().stringifyValue(
      this as DataModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return DataModelMapper.ensureInitialized().equalsValue(
      this as DataModel,
      other,
    );
  }

  @override
  int get hashCode {
    return DataModelMapper.ensureInitialized().hashValue(this as DataModel);
  }
}

extension DataModelValueCopy<$R, $Out> on ObjectCopyWith<$R, DataModel, $Out> {
  DataModelCopyWith<$R, DataModel, $Out> get $asDataModel =>
      $base.as((v, t, t2) => _DataModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DataModelCopyWith<$R, $In extends DataModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? currency,
    String? balance,
    String? custName,
    String? otp,
    String? token,
  });
  DataModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DataModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DataModel, $Out>
    implements DataModelCopyWith<$R, DataModel, $Out> {
  _DataModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DataModel> $mapper =
      DataModelMapper.ensureInitialized();
  @override
  $R call({
    Object? currency = $none,
    Object? balance = $none,
    Object? custName = $none,
    Object? otp = $none,
    Object? token = $none,
  }) => $apply(
    FieldCopyWithData({
      if (currency != $none) #currency: currency,
      if (balance != $none) #balance: balance,
      if (custName != $none) #custName: custName,
      if (otp != $none) #otp: otp,
      if (token != $none) #token: token,
    }),
  );
  @override
  DataModel $make(CopyWithData data) => DataModel(
    currency: data.get(#currency, or: $value.currency),
    balance: data.get(#balance, or: $value.balance),
    custName: data.get(#custName, or: $value.custName),
    otp: data.get(#otp, or: $value.otp),
    token: data.get(#token, or: $value.token),
  );

  @override
  DataModelCopyWith<$R2, DataModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _DataModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

