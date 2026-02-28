// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'discovery_request_entity.dart';

class DiscoveryRequestEntityMapper
    extends ClassMapperBase<DiscoveryRequestEntity> {
  DiscoveryRequestEntityMapper._();

  static DiscoveryRequestEntityMapper? _instance;
  static DiscoveryRequestEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DiscoveryRequestEntityMapper._());
      LawyerProfileEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'DiscoveryRequestEntity';

  static String? _$specializationId(DiscoveryRequestEntity v) =>
      v.specializationId;
  static const Field<DiscoveryRequestEntity, String> _f$specializationId =
      Field('specializationId', _$specializationId, opt: true);
  static String? _$specializationName(DiscoveryRequestEntity v) =>
      v.specializationName;
  static const Field<DiscoveryRequestEntity, String> _f$specializationName =
      Field('specializationName', _$specializationName, opt: true);
  static List<String>? _$lawyerIds(DiscoveryRequestEntity v) => v.lawyerIds;
  static const Field<DiscoveryRequestEntity, List<String>> _f$lawyerIds = Field(
    'lawyerIds',
    _$lawyerIds,
    opt: true,
  );
  static String? _$cityId(DiscoveryRequestEntity v) => v.cityId;
  static const Field<DiscoveryRequestEntity, String> _f$cityId = Field(
    'cityId',
    _$cityId,
    opt: true,
  );
  static String? _$availability(DiscoveryRequestEntity v) => v.availability;
  static const Field<DiscoveryRequestEntity, String> _f$availability = Field(
    'availability',
    _$availability,
    opt: true,
  );
  static int? _$limit(DiscoveryRequestEntity v) => v.limit;
  static const Field<DiscoveryRequestEntity, int> _f$limit = Field(
    'limit',
    _$limit,
    opt: true,
  );
  static LawyerProfileEntity? _$lawyer(DiscoveryRequestEntity v) => v.lawyer;
  static const Field<DiscoveryRequestEntity, LawyerProfileEntity> _f$lawyer =
      Field('lawyer', _$lawyer, opt: true);

  @override
  final MappableFields<DiscoveryRequestEntity> fields = const {
    #specializationId: _f$specializationId,
    #specializationName: _f$specializationName,
    #lawyerIds: _f$lawyerIds,
    #cityId: _f$cityId,
    #availability: _f$availability,
    #limit: _f$limit,
    #lawyer: _f$lawyer,
  };
  @override
  final bool ignoreNull = true;

  static DiscoveryRequestEntity _instantiate(DecodingData data) {
    return DiscoveryRequestEntity(
      specializationId: data.dec(_f$specializationId),
      specializationName: data.dec(_f$specializationName),
      lawyerIds: data.dec(_f$lawyerIds),
      cityId: data.dec(_f$cityId),
      availability: data.dec(_f$availability),
      limit: data.dec(_f$limit),
      lawyer: data.dec(_f$lawyer),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static DiscoveryRequestEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DiscoveryRequestEntity>(map);
  }

  static DiscoveryRequestEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<DiscoveryRequestEntity>(json);
  }
}

mixin DiscoveryRequestEntityMappable {
  String toJsonString() {
    return DiscoveryRequestEntityMapper.ensureInitialized()
        .encodeJson<DiscoveryRequestEntity>(this as DiscoveryRequestEntity);
  }

  Map<String, dynamic> toJson() {
    return DiscoveryRequestEntityMapper.ensureInitialized()
        .encodeMap<DiscoveryRequestEntity>(this as DiscoveryRequestEntity);
  }

  DiscoveryRequestEntityCopyWith<
    DiscoveryRequestEntity,
    DiscoveryRequestEntity,
    DiscoveryRequestEntity
  >
  get copyWith =>
      _DiscoveryRequestEntityCopyWithImpl<
        DiscoveryRequestEntity,
        DiscoveryRequestEntity
      >(this as DiscoveryRequestEntity, $identity, $identity);
  @override
  String toString() {
    return DiscoveryRequestEntityMapper.ensureInitialized().stringifyValue(
      this as DiscoveryRequestEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return DiscoveryRequestEntityMapper.ensureInitialized().equalsValue(
      this as DiscoveryRequestEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return DiscoveryRequestEntityMapper.ensureInitialized().hashValue(
      this as DiscoveryRequestEntity,
    );
  }
}

extension DiscoveryRequestEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DiscoveryRequestEntity, $Out> {
  DiscoveryRequestEntityCopyWith<$R, DiscoveryRequestEntity, $Out>
  get $asDiscoveryRequestEntity => $base.as(
    (v, t, t2) => _DiscoveryRequestEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class DiscoveryRequestEntityCopyWith<
  $R,
  $In extends DiscoveryRequestEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get lawyerIds;
  LawyerProfileEntityCopyWith<$R, LawyerProfileEntity, LawyerProfileEntity>?
  get lawyer;
  $R call({
    String? specializationId,
    String? specializationName,
    List<String>? lawyerIds,
    String? cityId,
    String? availability,
    int? limit,
    LawyerProfileEntity? lawyer,
  });
  DiscoveryRequestEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _DiscoveryRequestEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DiscoveryRequestEntity, $Out>
    implements
        DiscoveryRequestEntityCopyWith<$R, DiscoveryRequestEntity, $Out> {
  _DiscoveryRequestEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DiscoveryRequestEntity> $mapper =
      DiscoveryRequestEntityMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get lawyerIds =>
      $value.lawyerIds != null
      ? ListCopyWith(
          $value.lawyerIds!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(lawyerIds: v),
        )
      : null;
  @override
  LawyerProfileEntityCopyWith<$R, LawyerProfileEntity, LawyerProfileEntity>?
  get lawyer => $value.lawyer?.copyWith.$chain((v) => call(lawyer: v));
  @override
  $R call({
    Object? specializationId = $none,
    Object? specializationName = $none,
    Object? lawyerIds = $none,
    Object? cityId = $none,
    Object? availability = $none,
    Object? limit = $none,
    Object? lawyer = $none,
  }) => $apply(
    FieldCopyWithData({
      if (specializationId != $none) #specializationId: specializationId,
      if (specializationName != $none) #specializationName: specializationName,
      if (lawyerIds != $none) #lawyerIds: lawyerIds,
      if (cityId != $none) #cityId: cityId,
      if (availability != $none) #availability: availability,
      if (limit != $none) #limit: limit,
      if (lawyer != $none) #lawyer: lawyer,
    }),
  );
  @override
  DiscoveryRequestEntity $make(CopyWithData data) => DiscoveryRequestEntity(
    specializationId: data.get(#specializationId, or: $value.specializationId),
    specializationName: data.get(
      #specializationName,
      or: $value.specializationName,
    ),
    lawyerIds: data.get(#lawyerIds, or: $value.lawyerIds),
    cityId: data.get(#cityId, or: $value.cityId),
    availability: data.get(#availability, or: $value.availability),
    limit: data.get(#limit, or: $value.limit),
    lawyer: data.get(#lawyer, or: $value.lawyer),
  );

  @override
  DiscoveryRequestEntityCopyWith<$R2, DiscoveryRequestEntity, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _DiscoveryRequestEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

