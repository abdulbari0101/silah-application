// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'customer_model.dart';

class CustomerModelMapper extends ClassMapperBase<CustomerModel> {
  CustomerModelMapper._();

  static CustomerModelMapper? _instance;
  static CustomerModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CustomerModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CustomerModel';

  static String? _$fullName(CustomerModel v) => v.fullName;
  static const Field<CustomerModel, String> _f$fullName = Field(
    'fullName',
    _$fullName,
    key: r'NAME',
    opt: true,
  );
  static String? _$typeName(CustomerModel v) => v.typeName;
  static const Field<CustomerModel, String> _f$typeName = Field(
    'typeName',
    _$typeName,
    key: r'TYPENAME',
    opt: true,
  );
  static int? _$typeNo(CustomerModel v) => v.typeNo;
  static const Field<CustomerModel, int> _f$typeNo = Field(
    'typeNo',
    _$typeNo,
    key: r'TYPENO',
    opt: true,
  );
  static int? _$notify(CustomerModel v) => v.notify;
  static const Field<CustomerModel, int> _f$notify = Field(
    'notify',
    _$notify,
    key: r'NOTIFY',
    opt: true,
  );
  static String? _$email(CustomerModel v) => v.email;
  static const Field<CustomerModel, String> _f$email = Field(
    'email',
    _$email,
    key: r'EMAIL',
    opt: true,
  );
  static int? _$accountStatus(CustomerModel v) => v.accountStatus;
  static const Field<CustomerModel, int> _f$accountStatus = Field(
    'accountStatus',
    _$accountStatus,
    key: r'STATUS',
    opt: true,
  );
  static String? _$mobileNo(CustomerModel v) => v.mobileNo;
  static const Field<CustomerModel, String> _f$mobileNo = Field(
    'mobileNo',
    _$mobileNo,
    key: r'mMobileNo',
    opt: true,
  );
  static int? _$langId(CustomerModel v) => v.langId;
  static const Field<CustomerModel, int> _f$langId = Field(
    'langId',
    _$langId,
    key: r'mLangId',
    opt: true,
  );
  static int? _$langIdAlt(CustomerModel v) => v.langIdAlt;
  static const Field<CustomerModel, int> _f$langIdAlt = Field(
    'langIdAlt',
    _$langIdAlt,
    key: r'LANG',
    opt: true,
  );
  static String? _$cCode(CustomerModel v) => v.cCode;
  static const Field<CustomerModel, String> _f$cCode = Field(
    'cCode',
    _$cCode,
    key: r'CCODE',
    opt: true,
  );
  static String? _$shortCode(CustomerModel v) => v.shortCode;
  static const Field<CustomerModel, String> _f$shortCode = Field(
    'shortCode',
    _$shortCode,
    key: r'SHORTCODE',
    opt: true,
  );
  static String? _$lastName(CustomerModel v) => v.lastName;
  static const Field<CustomerModel, String> _f$lastName = Field(
    'lastName',
    _$lastName,
    key: r'LAST_NAME',
    opt: true,
  );
  static String? _$firstName(CustomerModel v) => v.firstName;
  static const Field<CustomerModel, String> _f$firstName = Field(
    'firstName',
    _$firstName,
    key: r'FIRST_NAME',
    opt: true,
  );
  static String? _$birthDate(CustomerModel v) => v.birthDate;
  static const Field<CustomerModel, String> _f$birthDate = Field(
    'birthDate',
    _$birthDate,
    key: r'BRTH_DATE',
    opt: true,
  );

  @override
  final MappableFields<CustomerModel> fields = const {
    #fullName: _f$fullName,
    #typeName: _f$typeName,
    #typeNo: _f$typeNo,
    #notify: _f$notify,
    #email: _f$email,
    #accountStatus: _f$accountStatus,
    #mobileNo: _f$mobileNo,
    #langId: _f$langId,
    #langIdAlt: _f$langIdAlt,
    #cCode: _f$cCode,
    #shortCode: _f$shortCode,
    #lastName: _f$lastName,
    #firstName: _f$firstName,
    #birthDate: _f$birthDate,
  };
  @override
  final bool ignoreNull = true;

  static CustomerModel _instantiate(DecodingData data) {
    return CustomerModel(
      fullName: data.dec(_f$fullName),
      typeName: data.dec(_f$typeName),
      typeNo: data.dec(_f$typeNo),
      notify: data.dec(_f$notify),
      email: data.dec(_f$email),
      accountStatus: data.dec(_f$accountStatus),
      mobileNo: data.dec(_f$mobileNo),
      langId: data.dec(_f$langId),
      langIdAlt: data.dec(_f$langIdAlt),
      cCode: data.dec(_f$cCode),
      shortCode: data.dec(_f$shortCode),
      lastName: data.dec(_f$lastName),
      firstName: data.dec(_f$firstName),
      birthDate: data.dec(_f$birthDate),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CustomerModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CustomerModel>(map);
  }

  static CustomerModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<CustomerModel>(json);
  }
}

mixin CustomerModelMappable {
  String toJsonString() {
    return CustomerModelMapper.ensureInitialized().encodeJson<CustomerModel>(
      this as CustomerModel,
    );
  }

  Map<String, dynamic> toJson() {
    return CustomerModelMapper.ensureInitialized().encodeMap<CustomerModel>(
      this as CustomerModel,
    );
  }

  CustomerModelCopyWith<CustomerModel, CustomerModel, CustomerModel>
  get copyWith => _CustomerModelCopyWithImpl<CustomerModel, CustomerModel>(
    this as CustomerModel,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return CustomerModelMapper.ensureInitialized().stringifyValue(
      this as CustomerModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return CustomerModelMapper.ensureInitialized().equalsValue(
      this as CustomerModel,
      other,
    );
  }

  @override
  int get hashCode {
    return CustomerModelMapper.ensureInitialized().hashValue(
      this as CustomerModel,
    );
  }
}

extension CustomerModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CustomerModel, $Out> {
  CustomerModelCopyWith<$R, CustomerModel, $Out> get $asCustomerModel =>
      $base.as((v, t, t2) => _CustomerModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CustomerModelCopyWith<$R, $In extends CustomerModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? fullName,
    String? typeName,
    int? typeNo,
    int? notify,
    String? email,
    int? accountStatus,
    String? mobileNo,
    int? langId,
    int? langIdAlt,
    String? cCode,
    String? shortCode,
    String? lastName,
    String? firstName,
    String? birthDate,
  });
  CustomerModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CustomerModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CustomerModel, $Out>
    implements CustomerModelCopyWith<$R, CustomerModel, $Out> {
  _CustomerModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CustomerModel> $mapper =
      CustomerModelMapper.ensureInitialized();
  @override
  $R call({
    Object? fullName = $none,
    Object? typeName = $none,
    Object? typeNo = $none,
    Object? notify = $none,
    Object? email = $none,
    Object? accountStatus = $none,
    Object? mobileNo = $none,
    Object? langId = $none,
    Object? langIdAlt = $none,
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
      if (notify != $none) #notify: notify,
      if (email != $none) #email: email,
      if (accountStatus != $none) #accountStatus: accountStatus,
      if (mobileNo != $none) #mobileNo: mobileNo,
      if (langId != $none) #langId: langId,
      if (langIdAlt != $none) #langIdAlt: langIdAlt,
      if (cCode != $none) #cCode: cCode,
      if (shortCode != $none) #shortCode: shortCode,
      if (lastName != $none) #lastName: lastName,
      if (firstName != $none) #firstName: firstName,
      if (birthDate != $none) #birthDate: birthDate,
    }),
  );
  @override
  CustomerModel $make(CopyWithData data) => CustomerModel(
    fullName: data.get(#fullName, or: $value.fullName),
    typeName: data.get(#typeName, or: $value.typeName),
    typeNo: data.get(#typeNo, or: $value.typeNo),
    notify: data.get(#notify, or: $value.notify),
    email: data.get(#email, or: $value.email),
    accountStatus: data.get(#accountStatus, or: $value.accountStatus),
    mobileNo: data.get(#mobileNo, or: $value.mobileNo),
    langId: data.get(#langId, or: $value.langId),
    langIdAlt: data.get(#langIdAlt, or: $value.langIdAlt),
    cCode: data.get(#cCode, or: $value.cCode),
    shortCode: data.get(#shortCode, or: $value.shortCode),
    lastName: data.get(#lastName, or: $value.lastName),
    firstName: data.get(#firstName, or: $value.firstName),
    birthDate: data.get(#birthDate, or: $value.birthDate),
  );

  @override
  CustomerModelCopyWith<$R2, CustomerModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CustomerModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

