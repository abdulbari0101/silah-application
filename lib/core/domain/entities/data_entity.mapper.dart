// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'data_entity.dart';

class DataEntityMapper extends ClassMapperBase<DataEntity> {
  DataEntityMapper._();

  static DataEntityMapper? _instance;
  static DataEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DataEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DataEntity';

  static String? _$currency(DataEntity v) => v.currency;
  static const Field<DataEntity, String> _f$currency = Field(
    'currency',
    _$currency,
    opt: true,
  );
  static String? _$balance(DataEntity v) => v.balance;
  static const Field<DataEntity, String> _f$balance = Field(
    'balance',
    _$balance,
    opt: true,
  );
  static String? _$custName(DataEntity v) => v.custName;
  static const Field<DataEntity, String> _f$custName = Field(
    'custName',
    _$custName,
    opt: true,
  );
  static String? _$otp(DataEntity v) => v.otp;
  static const Field<DataEntity, String> _f$otp = Field(
    'otp',
    _$otp,
    opt: true,
  );
  static String? _$token(DataEntity v) => v.token;
  static const Field<DataEntity, String> _f$token = Field(
    'token',
    _$token,
    opt: true,
  );

  @override
  final MappableFields<DataEntity> fields = const {
    #currency: _f$currency,
    #balance: _f$balance,
    #custName: _f$custName,
    #otp: _f$otp,
    #token: _f$token,
  };
  @override
  final bool ignoreNull = true;

  static DataEntity _instantiate(DecodingData data) {
    return DataEntity(
      currency: data.dec(_f$currency),
      balance: data.dec(_f$balance),
      custName: data.dec(_f$custName),
      otp: data.dec(_f$otp),
      token: data.dec(_f$token),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static DataEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DataEntity>(map);
  }

  static DataEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<DataEntity>(json);
  }
}

mixin DataEntityMappable {
  String toJsonString() {
    return DataEntityMapper.ensureInitialized().encodeJson<DataEntity>(
      this as DataEntity,
    );
  }

  Map<String, dynamic> toJson() {
    return DataEntityMapper.ensureInitialized().encodeMap<DataEntity>(
      this as DataEntity,
    );
  }

  DataEntityCopyWith<DataEntity, DataEntity, DataEntity> get copyWith =>
      _DataEntityCopyWithImpl<DataEntity, DataEntity>(
        this as DataEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return DataEntityMapper.ensureInitialized().stringifyValue(
      this as DataEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return DataEntityMapper.ensureInitialized().equalsValue(
      this as DataEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return DataEntityMapper.ensureInitialized().hashValue(this as DataEntity);
  }
}

extension DataEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DataEntity, $Out> {
  DataEntityCopyWith<$R, DataEntity, $Out> get $asDataEntity =>
      $base.as((v, t, t2) => _DataEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DataEntityCopyWith<$R, $In extends DataEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? currency,
    String? balance,
    String? custName,
    String? otp,
    String? token,
  });
  DataEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DataEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DataEntity, $Out>
    implements DataEntityCopyWith<$R, DataEntity, $Out> {
  _DataEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DataEntity> $mapper =
      DataEntityMapper.ensureInitialized();
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
  DataEntity $make(CopyWithData data) => DataEntity(
    currency: data.get(#currency, or: $value.currency),
    balance: data.get(#balance, or: $value.balance),
    custName: data.get(#custName, or: $value.custName),
    otp: data.get(#otp, or: $value.otp),
    token: data.get(#token, or: $value.token),
  );

  @override
  DataEntityCopyWith<$R2, DataEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _DataEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

