// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'lawyer_profile_entity.dart';

class LawyerProfileEntityMapper extends ClassMapperBase<LawyerProfileEntity> {
  LawyerProfileEntityMapper._();

  static LawyerProfileEntityMapper? _instance;
  static LawyerProfileEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LawyerProfileEntityMapper._());
      AvailabilityStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LawyerProfileEntity';

  static String? _$id(LawyerProfileEntity v) => v.id;
  static const Field<LawyerProfileEntity, String> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static String? _$fullName(LawyerProfileEntity v) => v.fullName;
  static const Field<LawyerProfileEntity, String> _f$fullName = Field(
    'fullName',
    _$fullName,
    opt: true,
  );
  static String? _$licenseNumber(LawyerProfileEntity v) => v.licenseNumber;
  static const Field<LawyerProfileEntity, String> _f$licenseNumber = Field(
    'licenseNumber',
    _$licenseNumber,
    opt: true,
  );
  static List<String>? _$legalFields(LawyerProfileEntity v) => v.legalFields;
  static const Field<LawyerProfileEntity, List<String>> _f$legalFields = Field(
    'legalFields',
    _$legalFields,
    opt: true,
  );
  static List<String>? _$legalFieldIds(LawyerProfileEntity v) =>
      v.legalFieldIds;
  static const Field<LawyerProfileEntity, List<String>> _f$legalFieldIds =
      Field('legalFieldIds', _$legalFieldIds, opt: true);
  static String? _$city(LawyerProfileEntity v) => v.city;
  static const Field<LawyerProfileEntity, String> _f$city = Field(
    'city',
    _$city,
    opt: true,
  );
  static String? _$cityId(LawyerProfileEntity v) => v.cityId;
  static const Field<LawyerProfileEntity, String> _f$cityId = Field(
    'cityId',
    _$cityId,
    opt: true,
  );
  static String? _$countryId(LawyerProfileEntity v) => v.countryId;
  static const Field<LawyerProfileEntity, String> _f$countryId = Field(
    'countryId',
    _$countryId,
    opt: true,
  );
  static String? _$workplace(LawyerProfileEntity v) => v.workplace;
  static const Field<LawyerProfileEntity, String> _f$workplace = Field(
    'workplace',
    _$workplace,
    opt: true,
  );
  static String? _$officeName(LawyerProfileEntity v) => v.officeName;
  static const Field<LawyerProfileEntity, String> _f$officeName = Field(
    'officeName',
    _$officeName,
    opt: true,
  );
  static String? _$workDestinationId(LawyerProfileEntity v) =>
      v.workDestinationId;
  static const Field<LawyerProfileEntity, String> _f$workDestinationId = Field(
    'workDestinationId',
    _$workDestinationId,
    opt: true,
  );
  static int? _$yearsOfExperience(LawyerProfileEntity v) => v.yearsOfExperience;
  static const Field<LawyerProfileEntity, int> _f$yearsOfExperience = Field(
    'yearsOfExperience',
    _$yearsOfExperience,
    opt: true,
  );
  static String? _$avatarUrl(LawyerProfileEntity v) => v.avatarUrl;
  static const Field<LawyerProfileEntity, String> _f$avatarUrl = Field(
    'avatarUrl',
    _$avatarUrl,
    opt: true,
  );
  static bool _$acceptsTrainees(LawyerProfileEntity v) => v.acceptsTrainees;
  static const Field<LawyerProfileEntity, bool> _f$acceptsTrainees = Field(
    'acceptsTrainees',
    _$acceptsTrainees,
    opt: true,
    def: false,
  );
  static AvailabilityStatus _$availability(LawyerProfileEntity v) =>
      v.availability;
  static const Field<LawyerProfileEntity, AvailabilityStatus> _f$availability =
      Field(
        'availability',
        _$availability,
        opt: true,
        def: AvailabilityStatus.available,
      );

  @override
  final MappableFields<LawyerProfileEntity> fields = const {
    #id: _f$id,
    #fullName: _f$fullName,
    #licenseNumber: _f$licenseNumber,
    #legalFields: _f$legalFields,
    #legalFieldIds: _f$legalFieldIds,
    #city: _f$city,
    #cityId: _f$cityId,
    #countryId: _f$countryId,
    #workplace: _f$workplace,
    #officeName: _f$officeName,
    #workDestinationId: _f$workDestinationId,
    #yearsOfExperience: _f$yearsOfExperience,
    #avatarUrl: _f$avatarUrl,
    #acceptsTrainees: _f$acceptsTrainees,
    #availability: _f$availability,
  };
  @override
  final bool ignoreNull = true;

  static LawyerProfileEntity _instantiate(DecodingData data) {
    return LawyerProfileEntity(
      id: data.dec(_f$id),
      fullName: data.dec(_f$fullName),
      licenseNumber: data.dec(_f$licenseNumber),
      legalFields: data.dec(_f$legalFields),
      legalFieldIds: data.dec(_f$legalFieldIds),
      city: data.dec(_f$city),
      cityId: data.dec(_f$cityId),
      countryId: data.dec(_f$countryId),
      workplace: data.dec(_f$workplace),
      officeName: data.dec(_f$officeName),
      workDestinationId: data.dec(_f$workDestinationId),
      yearsOfExperience: data.dec(_f$yearsOfExperience),
      avatarUrl: data.dec(_f$avatarUrl),
      acceptsTrainees: data.dec(_f$acceptsTrainees),
      availability: data.dec(_f$availability),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static LawyerProfileEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LawyerProfileEntity>(map);
  }

  static LawyerProfileEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<LawyerProfileEntity>(json);
  }
}

mixin LawyerProfileEntityMappable {
  String toJsonString() {
    return LawyerProfileEntityMapper.ensureInitialized()
        .encodeJson<LawyerProfileEntity>(this as LawyerProfileEntity);
  }

  Map<String, dynamic> toJson() {
    return LawyerProfileEntityMapper.ensureInitialized()
        .encodeMap<LawyerProfileEntity>(this as LawyerProfileEntity);
  }

  LawyerProfileEntityCopyWith<
    LawyerProfileEntity,
    LawyerProfileEntity,
    LawyerProfileEntity
  >
  get copyWith =>
      _LawyerProfileEntityCopyWithImpl<
        LawyerProfileEntity,
        LawyerProfileEntity
      >(this as LawyerProfileEntity, $identity, $identity);
  @override
  String toString() {
    return LawyerProfileEntityMapper.ensureInitialized().stringifyValue(
      this as LawyerProfileEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return LawyerProfileEntityMapper.ensureInitialized().equalsValue(
      this as LawyerProfileEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return LawyerProfileEntityMapper.ensureInitialized().hashValue(
      this as LawyerProfileEntity,
    );
  }
}

extension LawyerProfileEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LawyerProfileEntity, $Out> {
  LawyerProfileEntityCopyWith<$R, LawyerProfileEntity, $Out>
  get $asLawyerProfileEntity => $base.as(
    (v, t, t2) => _LawyerProfileEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class LawyerProfileEntityCopyWith<
  $R,
  $In extends LawyerProfileEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get legalFields;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get legalFieldIds;
  $R call({
    String? id,
    String? fullName,
    String? licenseNumber,
    List<String>? legalFields,
    List<String>? legalFieldIds,
    String? city,
    String? cityId,
    String? countryId,
    String? workplace,
    String? officeName,
    String? workDestinationId,
    int? yearsOfExperience,
    String? avatarUrl,
    bool? acceptsTrainees,
    AvailabilityStatus? availability,
  });
  LawyerProfileEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _LawyerProfileEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LawyerProfileEntity, $Out>
    implements LawyerProfileEntityCopyWith<$R, LawyerProfileEntity, $Out> {
  _LawyerProfileEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LawyerProfileEntity> $mapper =
      LawyerProfileEntityMapper.ensureInitialized();
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
    Object? id = $none,
    Object? fullName = $none,
    Object? licenseNumber = $none,
    Object? legalFields = $none,
    Object? legalFieldIds = $none,
    Object? city = $none,
    Object? cityId = $none,
    Object? countryId = $none,
    Object? workplace = $none,
    Object? officeName = $none,
    Object? workDestinationId = $none,
    Object? yearsOfExperience = $none,
    Object? avatarUrl = $none,
    bool? acceptsTrainees,
    AvailabilityStatus? availability,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (fullName != $none) #fullName: fullName,
      if (licenseNumber != $none) #licenseNumber: licenseNumber,
      if (legalFields != $none) #legalFields: legalFields,
      if (legalFieldIds != $none) #legalFieldIds: legalFieldIds,
      if (city != $none) #city: city,
      if (cityId != $none) #cityId: cityId,
      if (countryId != $none) #countryId: countryId,
      if (workplace != $none) #workplace: workplace,
      if (officeName != $none) #officeName: officeName,
      if (workDestinationId != $none) #workDestinationId: workDestinationId,
      if (yearsOfExperience != $none) #yearsOfExperience: yearsOfExperience,
      if (avatarUrl != $none) #avatarUrl: avatarUrl,
      if (acceptsTrainees != null) #acceptsTrainees: acceptsTrainees,
      if (availability != null) #availability: availability,
    }),
  );
  @override
  LawyerProfileEntity $make(CopyWithData data) => LawyerProfileEntity(
    id: data.get(#id, or: $value.id),
    fullName: data.get(#fullName, or: $value.fullName),
    licenseNumber: data.get(#licenseNumber, or: $value.licenseNumber),
    legalFields: data.get(#legalFields, or: $value.legalFields),
    legalFieldIds: data.get(#legalFieldIds, or: $value.legalFieldIds),
    city: data.get(#city, or: $value.city),
    cityId: data.get(#cityId, or: $value.cityId),
    countryId: data.get(#countryId, or: $value.countryId),
    workplace: data.get(#workplace, or: $value.workplace),
    officeName: data.get(#officeName, or: $value.officeName),
    workDestinationId: data.get(
      #workDestinationId,
      or: $value.workDestinationId,
    ),
    yearsOfExperience: data.get(
      #yearsOfExperience,
      or: $value.yearsOfExperience,
    ),
    avatarUrl: data.get(#avatarUrl, or: $value.avatarUrl),
    acceptsTrainees: data.get(#acceptsTrainees, or: $value.acceptsTrainees),
    availability: data.get(#availability, or: $value.availability),
  );

  @override
  LawyerProfileEntityCopyWith<$R2, LawyerProfileEntity, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _LawyerProfileEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

