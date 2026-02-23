// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'registration_payload.dart';

class RegistrationAccountTypeMapper
    extends EnumMapper<RegistrationAccountType> {
  RegistrationAccountTypeMapper._();

  static RegistrationAccountTypeMapper? _instance;
  static RegistrationAccountTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = RegistrationAccountTypeMapper._(),
      );
    }
    return _instance!;
  }

  static RegistrationAccountType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  RegistrationAccountType decode(dynamic value) {
    switch (value) {
      case r'user':
        return RegistrationAccountType.user;
      case r'lawyer':
        return RegistrationAccountType.lawyer;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(RegistrationAccountType self) {
    switch (self) {
      case RegistrationAccountType.user:
        return r'user';
      case RegistrationAccountType.lawyer:
        return r'lawyer';
    }
  }
}

extension RegistrationAccountTypeMapperExtension on RegistrationAccountType {
  String toValue() {
    RegistrationAccountTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<RegistrationAccountType>(this)
        as String;
  }
}

class RegistrationPayloadMapper extends ClassMapperBase<RegistrationPayload> {
  RegistrationPayloadMapper._();

  static RegistrationPayloadMapper? _instance;
  static RegistrationPayloadMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RegistrationPayloadMapper._());
      RegistrationAccountTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RegistrationPayload';

  static RegistrationAccountType _$accountType(RegistrationPayload v) =>
      v.accountType;
  static const Field<RegistrationPayload, RegistrationAccountType>
  _f$accountType = Field('accountType', _$accountType);
  static String _$firstName(RegistrationPayload v) => v.firstName;
  static const Field<RegistrationPayload, String> _f$firstName = Field(
    'firstName',
    _$firstName,
  );
  static String _$lastName(RegistrationPayload v) => v.lastName;
  static const Field<RegistrationPayload, String> _f$lastName = Field(
    'lastName',
    _$lastName,
  );
  static String _$email(RegistrationPayload v) => v.email;
  static const Field<RegistrationPayload, String> _f$email = Field(
    'email',
    _$email,
  );
  static String _$phone(RegistrationPayload v) => v.phone;
  static const Field<RegistrationPayload, String> _f$phone = Field(
    'phone',
    _$phone,
  );
  static String _$password(RegistrationPayload v) => v.password;
  static const Field<RegistrationPayload, String> _f$password = Field(
    'password',
    _$password,
  );
  static String? _$gender(RegistrationPayload v) => v.gender;
  static const Field<RegistrationPayload, String> _f$gender = Field(
    'gender',
    _$gender,
    opt: true,
  );
  static String? _$genderId(RegistrationPayload v) => v.genderId;
  static const Field<RegistrationPayload, String> _f$genderId = Field(
    'genderId',
    _$genderId,
    opt: true,
  );
  static List<String>? _$legalFields(RegistrationPayload v) => v.legalFields;
  static const Field<RegistrationPayload, List<String>> _f$legalFields = Field(
    'legalFields',
    _$legalFields,
    opt: true,
  );
  static List<String>? _$legalFieldIds(RegistrationPayload v) =>
      v.legalFieldIds;
  static const Field<RegistrationPayload, List<String>> _f$legalFieldIds =
      Field('legalFieldIds', _$legalFieldIds, opt: true);
  static String? _$city(RegistrationPayload v) => v.city;
  static const Field<RegistrationPayload, String> _f$city = Field(
    'city',
    _$city,
    opt: true,
  );
  static String? _$cityId(RegistrationPayload v) => v.cityId;
  static const Field<RegistrationPayload, String> _f$cityId = Field(
    'cityId',
    _$cityId,
    opt: true,
  );
  static String? _$areaId(RegistrationPayload v) => v.areaId;
  static const Field<RegistrationPayload, String> _f$areaId = Field(
    'areaId',
    _$areaId,
    opt: true,
  );
  static String? _$workplace(RegistrationPayload v) => v.workplace;
  static const Field<RegistrationPayload, String> _f$workplace = Field(
    'workplace',
    _$workplace,
    opt: true,
  );
  static String? _$workDestinationId(RegistrationPayload v) =>
      v.workDestinationId;
  static const Field<RegistrationPayload, String> _f$workDestinationId = Field(
    'workDestinationId',
    _$workDestinationId,
    opt: true,
  );
  static String? _$officeName(RegistrationPayload v) => v.officeName;
  static const Field<RegistrationPayload, String> _f$officeName = Field(
    'officeName',
    _$officeName,
    opt: true,
  );
  static String? _$experienceYears(RegistrationPayload v) => v.experienceYears;
  static const Field<RegistrationPayload, String> _f$experienceYears = Field(
    'experienceYears',
    _$experienceYears,
    opt: true,
  );
  static String? _$licenseNumber(RegistrationPayload v) => v.licenseNumber;
  static const Field<RegistrationPayload, String> _f$licenseNumber = Field(
    'licenseNumber',
    _$licenseNumber,
    opt: true,
  );
  static String? _$nationalId(RegistrationPayload v) => v.nationalId;
  static const Field<RegistrationPayload, String> _f$nationalId = Field(
    'nationalId',
    _$nationalId,
    opt: true,
  );
  static String? _$avatarUrl(RegistrationPayload v) => v.avatarUrl;
  static const Field<RegistrationPayload, String> _f$avatarUrl = Field(
    'avatarUrl',
    _$avatarUrl,
    opt: true,
  );

  @override
  final MappableFields<RegistrationPayload> fields = const {
    #accountType: _f$accountType,
    #firstName: _f$firstName,
    #lastName: _f$lastName,
    #email: _f$email,
    #phone: _f$phone,
    #password: _f$password,
    #gender: _f$gender,
    #genderId: _f$genderId,
    #legalFields: _f$legalFields,
    #legalFieldIds: _f$legalFieldIds,
    #city: _f$city,
    #cityId: _f$cityId,
    #areaId: _f$areaId,
    #workplace: _f$workplace,
    #workDestinationId: _f$workDestinationId,
    #officeName: _f$officeName,
    #experienceYears: _f$experienceYears,
    #licenseNumber: _f$licenseNumber,
    #nationalId: _f$nationalId,
    #avatarUrl: _f$avatarUrl,
  };
  @override
  final bool ignoreNull = true;

  static RegistrationPayload _instantiate(DecodingData data) {
    return RegistrationPayload(
      accountType: data.dec(_f$accountType),
      firstName: data.dec(_f$firstName),
      lastName: data.dec(_f$lastName),
      email: data.dec(_f$email),
      phone: data.dec(_f$phone),
      password: data.dec(_f$password),
      gender: data.dec(_f$gender),
      genderId: data.dec(_f$genderId),
      legalFields: data.dec(_f$legalFields),
      legalFieldIds: data.dec(_f$legalFieldIds),
      city: data.dec(_f$city),
      cityId: data.dec(_f$cityId),
      areaId: data.dec(_f$areaId),
      workplace: data.dec(_f$workplace),
      workDestinationId: data.dec(_f$workDestinationId),
      officeName: data.dec(_f$officeName),
      experienceYears: data.dec(_f$experienceYears),
      licenseNumber: data.dec(_f$licenseNumber),
      nationalId: data.dec(_f$nationalId),
      avatarUrl: data.dec(_f$avatarUrl),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RegistrationPayload fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RegistrationPayload>(map);
  }

  static RegistrationPayload fromJsonString(String json) {
    return ensureInitialized().decodeJson<RegistrationPayload>(json);
  }
}

mixin RegistrationPayloadMappable {
  String toJsonString() {
    return RegistrationPayloadMapper.ensureInitialized()
        .encodeJson<RegistrationPayload>(this as RegistrationPayload);
  }

  Map<String, dynamic> toJson() {
    return RegistrationPayloadMapper.ensureInitialized()
        .encodeMap<RegistrationPayload>(this as RegistrationPayload);
  }

  RegistrationPayloadCopyWith<
    RegistrationPayload,
    RegistrationPayload,
    RegistrationPayload
  >
  get copyWith =>
      _RegistrationPayloadCopyWithImpl<
        RegistrationPayload,
        RegistrationPayload
      >(this as RegistrationPayload, $identity, $identity);
  @override
  String toString() {
    return RegistrationPayloadMapper.ensureInitialized().stringifyValue(
      this as RegistrationPayload,
    );
  }

  @override
  bool operator ==(Object other) {
    return RegistrationPayloadMapper.ensureInitialized().equalsValue(
      this as RegistrationPayload,
      other,
    );
  }

  @override
  int get hashCode {
    return RegistrationPayloadMapper.ensureInitialized().hashValue(
      this as RegistrationPayload,
    );
  }
}

extension RegistrationPayloadValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RegistrationPayload, $Out> {
  RegistrationPayloadCopyWith<$R, RegistrationPayload, $Out>
  get $asRegistrationPayload => $base.as(
    (v, t, t2) => _RegistrationPayloadCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class RegistrationPayloadCopyWith<
  $R,
  $In extends RegistrationPayload,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get legalFields;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get legalFieldIds;
  $R call({
    RegistrationAccountType? accountType,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? password,
    String? gender,
    String? genderId,
    List<String>? legalFields,
    List<String>? legalFieldIds,
    String? city,
    String? cityId,
    String? areaId,
    String? workplace,
    String? workDestinationId,
    String? officeName,
    String? experienceYears,
    String? licenseNumber,
    String? nationalId,
    String? avatarUrl,
  });
  RegistrationPayloadCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _RegistrationPayloadCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RegistrationPayload, $Out>
    implements RegistrationPayloadCopyWith<$R, RegistrationPayload, $Out> {
  _RegistrationPayloadCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RegistrationPayload> $mapper =
      RegistrationPayloadMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get legalFields => $value.legalFields != null
      ? ListCopyWith(
          $value.legalFields!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(legalFields: v),
        )
      : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get legalFieldIds => $value.legalFieldIds != null
      ? ListCopyWith(
          $value.legalFieldIds!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(legalFieldIds: v),
        )
      : null;
  @override
  $R call({
    RegistrationAccountType? accountType,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? password,
    Object? gender = $none,
    Object? genderId = $none,
    Object? legalFields = $none,
    Object? legalFieldIds = $none,
    Object? city = $none,
    Object? cityId = $none,
    Object? areaId = $none,
    Object? workplace = $none,
    Object? workDestinationId = $none,
    Object? officeName = $none,
    Object? experienceYears = $none,
    Object? licenseNumber = $none,
    Object? nationalId = $none,
    Object? avatarUrl = $none,
  }) => $apply(
    FieldCopyWithData({
      if (accountType != null) #accountType: accountType,
      if (firstName != null) #firstName: firstName,
      if (lastName != null) #lastName: lastName,
      if (email != null) #email: email,
      if (phone != null) #phone: phone,
      if (password != null) #password: password,
      if (gender != $none) #gender: gender,
      if (genderId != $none) #genderId: genderId,
      if (legalFields != $none) #legalFields: legalFields,
      if (legalFieldIds != $none) #legalFieldIds: legalFieldIds,
      if (city != $none) #city: city,
      if (cityId != $none) #cityId: cityId,
      if (areaId != $none) #areaId: areaId,
      if (workplace != $none) #workplace: workplace,
      if (workDestinationId != $none) #workDestinationId: workDestinationId,
      if (officeName != $none) #officeName: officeName,
      if (experienceYears != $none) #experienceYears: experienceYears,
      if (licenseNumber != $none) #licenseNumber: licenseNumber,
      if (nationalId != $none) #nationalId: nationalId,
      if (avatarUrl != $none) #avatarUrl: avatarUrl,
    }),
  );
  @override
  RegistrationPayload $make(CopyWithData data) => RegistrationPayload(
    accountType: data.get(#accountType, or: $value.accountType),
    firstName: data.get(#firstName, or: $value.firstName),
    lastName: data.get(#lastName, or: $value.lastName),
    email: data.get(#email, or: $value.email),
    phone: data.get(#phone, or: $value.phone),
    password: data.get(#password, or: $value.password),
    gender: data.get(#gender, or: $value.gender),
    genderId: data.get(#genderId, or: $value.genderId),
    legalFields: data.get(#legalFields, or: $value.legalFields),
    legalFieldIds: data.get(#legalFieldIds, or: $value.legalFieldIds),
    city: data.get(#city, or: $value.city),
    cityId: data.get(#cityId, or: $value.cityId),
    areaId: data.get(#areaId, or: $value.areaId),
    workplace: data.get(#workplace, or: $value.workplace),
    workDestinationId: data.get(
      #workDestinationId,
      or: $value.workDestinationId,
    ),
    officeName: data.get(#officeName, or: $value.officeName),
    experienceYears: data.get(#experienceYears, or: $value.experienceYears),
    licenseNumber: data.get(#licenseNumber, or: $value.licenseNumber),
    nationalId: data.get(#nationalId, or: $value.nationalId),
    avatarUrl: data.get(#avatarUrl, or: $value.avatarUrl),
  );

  @override
  RegistrationPayloadCopyWith<$R2, RegistrationPayload, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RegistrationPayloadCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

