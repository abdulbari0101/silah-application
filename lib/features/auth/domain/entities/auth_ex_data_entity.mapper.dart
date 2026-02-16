// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'auth_ex_data_entity.dart';

class ExDataAuthEntityMapper extends ClassMapperBase<ExDataAuthEntity> {
  ExDataAuthEntityMapper._();

  static ExDataAuthEntityMapper? _instance;
  static ExDataAuthEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ExDataAuthEntityMapper._());
      CustomerEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ExDataAuthEntity';

  static CustomerEntity? _$customer(ExDataAuthEntity v) => v.customer;
  static const Field<ExDataAuthEntity, CustomerEntity> _f$customer = Field(
    'customer',
    _$customer,
    opt: true,
  );

  @override
  final MappableFields<ExDataAuthEntity> fields = const {
    #customer: _f$customer,
  };
  @override
  final bool ignoreNull = true;

  static ExDataAuthEntity _instantiate(DecodingData data) {
    return ExDataAuthEntity(customer: data.dec(_f$customer));
  }

  @override
  final Function instantiate = _instantiate;

  static ExDataAuthEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ExDataAuthEntity>(map);
  }

  static ExDataAuthEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<ExDataAuthEntity>(json);
  }
}

mixin ExDataAuthEntityMappable {
  String toJsonString() {
    return ExDataAuthEntityMapper.ensureInitialized()
        .encodeJson<ExDataAuthEntity>(this as ExDataAuthEntity);
  }

  Map<String, dynamic> toJson() {
    return ExDataAuthEntityMapper.ensureInitialized()
        .encodeMap<ExDataAuthEntity>(this as ExDataAuthEntity);
  }

  ExDataAuthEntityCopyWith<ExDataAuthEntity, ExDataAuthEntity, ExDataAuthEntity>
  get copyWith =>
      _ExDataAuthEntityCopyWithImpl<ExDataAuthEntity, ExDataAuthEntity>(
        this as ExDataAuthEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ExDataAuthEntityMapper.ensureInitialized().stringifyValue(
      this as ExDataAuthEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return ExDataAuthEntityMapper.ensureInitialized().equalsValue(
      this as ExDataAuthEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return ExDataAuthEntityMapper.ensureInitialized().hashValue(
      this as ExDataAuthEntity,
    );
  }
}

extension ExDataAuthEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ExDataAuthEntity, $Out> {
  ExDataAuthEntityCopyWith<$R, ExDataAuthEntity, $Out>
  get $asExDataAuthEntity =>
      $base.as((v, t, t2) => _ExDataAuthEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ExDataAuthEntityCopyWith<$R, $In extends ExDataAuthEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  CustomerEntityCopyWith<$R, CustomerEntity, CustomerEntity>? get customer;
  $R call({CustomerEntity? customer});
  ExDataAuthEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ExDataAuthEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ExDataAuthEntity, $Out>
    implements ExDataAuthEntityCopyWith<$R, ExDataAuthEntity, $Out> {
  _ExDataAuthEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ExDataAuthEntity> $mapper =
      ExDataAuthEntityMapper.ensureInitialized();
  @override
  CustomerEntityCopyWith<$R, CustomerEntity, CustomerEntity>? get customer =>
      $value.customer?.copyWith.$chain((v) => call(customer: v));
  @override
  $R call({Object? customer = $none}) =>
      $apply(FieldCopyWithData({if (customer != $none) #customer: customer}));
  @override
  ExDataAuthEntity $make(CopyWithData data) =>
      ExDataAuthEntity(customer: data.get(#customer, or: $value.customer));

  @override
  ExDataAuthEntityCopyWith<$R2, ExDataAuthEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ExDataAuthEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

