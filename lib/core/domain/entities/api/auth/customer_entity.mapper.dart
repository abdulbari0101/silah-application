// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'customer_entity.dart';

class CustomerEntityMapper extends ClassMapperBase<CustomerEntity> {
  CustomerEntityMapper._();

  static CustomerEntityMapper? _instance;
  static CustomerEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CustomerEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CustomerEntity';

  static String? _$fullName(CustomerEntity v) => v.fullName;
  static const Field<CustomerEntity, String> _f$fullName = Field(
    'fullName',
    _$fullName,
    opt: true,
  );
  static String? _$typeName(CustomerEntity v) => v.typeName;
  static const Field<CustomerEntity, String> _f$typeName = Field(
    'typeName',
    _$typeName,
    opt: true,
  );
  static int? _$typeNo(CustomerEntity v) => v.typeNo;
  static const Field<CustomerEntity, int> _f$typeNo = Field(
    'typeNo',
    _$typeNo,
    opt: true,
  );
  static String? _$email(CustomerEntity v) => v.email;
  static const Field<CustomerEntity, String> _f$email = Field(
    'email',
    _$email,
    opt: true,
  );
  static int? _$accountStatus(CustomerEntity v) => v.accountStatus;
  static const Field<CustomerEntity, int> _f$accountStatus = Field(
    'accountStatus',
    _$accountStatus,
    opt: true,
  );
  static String? _$mobileNo(CustomerEntity v) => v.mobileNo;
  static const Field<CustomerEntity, String> _f$mobileNo = Field(
    'mobileNo',
    _$mobileNo,
    opt: true,
  );
  static int? _$langId(CustomerEntity v) => v.langId;
  static const Field<CustomerEntity, int> _f$langId = Field(
    'langId',
    _$langId,
    opt: true,
  );
  static String? _$cCode(CustomerEntity v) => v.cCode;
  static const Field<CustomerEntity, String> _f$cCode = Field(
    'cCode',
    _$cCode,
    opt: true,
  );
  static String? _$shortCode(CustomerEntity v) => v.shortCode;
  static const Field<CustomerEntity, String> _f$shortCode = Field(
    'shortCode',
    _$shortCode,
    opt: true,
  );
  static String? _$lastName(CustomerEntity v) => v.lastName;
  static const Field<CustomerEntity, String> _f$lastName = Field(
    'lastName',
    _$lastName,
    opt: true,
  );
  static String? _$firstName(CustomerEntity v) => v.firstName;
  static const Field<CustomerEntity, String> _f$firstName = Field(
    'firstName',
    _$firstName,
    opt: true,
  );
  static String? _$birthDate(CustomerEntity v) => v.birthDate;
  static const Field<CustomerEntity, String> _f$birthDate = Field(
    'birthDate',
    _$birthDate,
    opt: true,
  );

  @override
  final MappableFields<CustomerEntity> fields = const {
    #fullName: _f$fullName,
    #typeName: _f$typeName,
    #typeNo: _f$typeNo,
    #email: _f$email,
    #accountStatus: _f$accountStatus,
    #mobileNo: _f$mobileNo,
    #langId: _f$langId,
    #cCode: _f$cCode,
    #shortCode: _f$shortCode,
    #lastName: _f$lastName,
    #firstName: _f$firstName,
    #birthDate: _f$birthDate,
  };
  @override
  final bool ignoreNull = true;

  static CustomerEntity _instantiate(DecodingData data) {
    return CustomerEntity(
      fullName: data.dec(_f$fullName),
      typeName: data.dec(_f$typeName),
      typeNo: data.dec(_f$typeNo),
      email: data.dec(_f$email),
      accountStatus: data.dec(_f$accountStatus),
      mobileNo: data.dec(_f$mobileNo),
      langId: data.dec(_f$langId),
      cCode: data.dec(_f$cCode),
      shortCode: data.dec(_f$shortCode),
      lastName: data.dec(_f$lastName),
      firstName: data.dec(_f$firstName),
      birthDate: data.dec(_f$birthDate),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CustomerEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CustomerEntity>(map);
  }

  static CustomerEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<CustomerEntity>(json);
  }
}

mixin CustomerEntityMappable {
  String toJsonString() {
    return CustomerEntityMapper.ensureInitialized().encodeJson<CustomerEntity>(
      this as CustomerEntity,
    );
  }

  Map<String, dynamic> toJson() {
    return CustomerEntityMapper.ensureInitialized().encodeMap<CustomerEntity>(
      this as CustomerEntity,
    );
  }

  CustomerEntityCopyWith<CustomerEntity, CustomerEntity, CustomerEntity>
  get copyWith => _CustomerEntityCopyWithImpl<CustomerEntity, CustomerEntity>(
    this as CustomerEntity,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return CustomerEntityMapper.ensureInitialized().stringifyValue(
      this as CustomerEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return CustomerEntityMapper.ensureInitialized().equalsValue(
      this as CustomerEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return CustomerEntityMapper.ensureInitialized().hashValue(
      this as CustomerEntity,
    );
  }
}

extension CustomerEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CustomerEntity, $Out> {
  CustomerEntityCopyWith<$R, CustomerEntity, $Out> get $asCustomerEntity =>
      $base.as((v, t, t2) => _CustomerEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CustomerEntityCopyWith<$R, $In extends CustomerEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? fullName,
    String? typeName,
    int? typeNo,
    String? email,
    int? accountStatus,
    String? mobileNo,
    int? langId,
    String? cCode,
    String? shortCode,
    String? lastName,
    String? firstName,
    String? birthDate,
  });
  CustomerEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CustomerEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CustomerEntity, $Out>
    implements CustomerEntityCopyWith<$R, CustomerEntity, $Out> {
  _CustomerEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CustomerEntity> $mapper =
      CustomerEntityMapper.ensureInitialized();
  @override
  $R call({
    Object? fullName = $none,
    Object? typeName = $none,
    Object? typeNo = $none,
    Object? email = $none,
    Object? accountStatus = $none,
    Object? mobileNo = $none,
    Object? langId = $none,
    Object? cCode = $none,
    Object? shortCode = $none,
    Object? lastName = $none,
    Object? firstName = $none,
    Object? birthDate = $none,
  }) => $apply(
    FieldCopyWithData({
      if (fullName != $none) #fullName: fullName,
      if (typeName != $none) #typeName: typeName,
      if (typeNo != $none) #typeNo: typeNo,
      if (email != $none) #email: email,
      if (accountStatus != $none) #accountStatus: accountStatus,
      if (mobileNo != $none) #mobileNo: mobileNo,
      if (langId != $none) #langId: langId,
      if (cCode != $none) #cCode: cCode,
      if (shortCode != $none) #shortCode: shortCode,
      if (lastName != $none) #lastName: lastName,
      if (firstName != $none) #firstName: firstName,
      if (birthDate != $none) #birthDate: birthDate,
    }),
  );
  @override
  CustomerEntity $make(CopyWithData data) => CustomerEntity(
    fullName: data.get(#fullName, or: $value.fullName),
    typeName: data.get(#typeName, or: $value.typeName),
    typeNo: data.get(#typeNo, or: $value.typeNo),
    email: data.get(#email, or: $value.email),
    accountStatus: data.get(#accountStatus, or: $value.accountStatus),
    mobileNo: data.get(#mobileNo, or: $value.mobileNo),
    langId: data.get(#langId, or: $value.langId),
    cCode: data.get(#cCode, or: $value.cCode),
    shortCode: data.get(#shortCode, or: $value.shortCode),
    lastName: data.get(#lastName, or: $value.lastName),
    firstName: data.get(#firstName, or: $value.firstName),
    birthDate: data.get(#birthDate, or: $value.birthDate),
  );

  @override
  CustomerEntityCopyWith<$R2, CustomerEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CustomerEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

