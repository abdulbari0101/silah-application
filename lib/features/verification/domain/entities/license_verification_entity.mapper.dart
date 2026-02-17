// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'license_verification_entity.dart';

class LicenseVerificationEntityMapper
    extends ClassMapperBase<LicenseVerificationEntity> {
  LicenseVerificationEntityMapper._();

  static LicenseVerificationEntityMapper? _instance;
  static LicenseVerificationEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = LicenseVerificationEntityMapper._(),
      );
      VerificationStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LicenseVerificationEntity';

  static String? _$licenseNumber(LicenseVerificationEntity v) =>
      v.licenseNumber;
  static const Field<LicenseVerificationEntity, String> _f$licenseNumber =
      Field('licenseNumber', _$licenseNumber, opt: true);
  static String? _$nationalId(LicenseVerificationEntity v) => v.nationalId;
  static const Field<LicenseVerificationEntity, String> _f$nationalId = Field(
    'nationalId',
    _$nationalId,
    opt: true,
  );
  static VerificationStatus _$status(LicenseVerificationEntity v) => v.status;
  static const Field<LicenseVerificationEntity, VerificationStatus> _f$status =
      Field('status', _$status, opt: true, def: VerificationStatus.pending);
  static String? _$reviewNotes(LicenseVerificationEntity v) => v.reviewNotes;
  static const Field<LicenseVerificationEntity, String> _f$reviewNotes = Field(
    'reviewNotes',
    _$reviewNotes,
    opt: true,
  );
  static String? _$requestedAt(LicenseVerificationEntity v) => v.requestedAt;
  static const Field<LicenseVerificationEntity, String> _f$requestedAt = Field(
    'requestedAt',
    _$requestedAt,
    opt: true,
  );
  static String? _$verifiedAt(LicenseVerificationEntity v) => v.verifiedAt;
  static const Field<LicenseVerificationEntity, String> _f$verifiedAt = Field(
    'verifiedAt',
    _$verifiedAt,
    opt: true,
  );

  @override
  final MappableFields<LicenseVerificationEntity> fields = const {
    #licenseNumber: _f$licenseNumber,
    #nationalId: _f$nationalId,
    #status: _f$status,
    #reviewNotes: _f$reviewNotes,
    #requestedAt: _f$requestedAt,
    #verifiedAt: _f$verifiedAt,
  };
  @override
  final bool ignoreNull = true;

  static LicenseVerificationEntity _instantiate(DecodingData data) {
    return LicenseVerificationEntity(
      licenseNumber: data.dec(_f$licenseNumber),
      nationalId: data.dec(_f$nationalId),
      status: data.dec(_f$status),
      reviewNotes: data.dec(_f$reviewNotes),
      requestedAt: data.dec(_f$requestedAt),
      verifiedAt: data.dec(_f$verifiedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static LicenseVerificationEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LicenseVerificationEntity>(map);
  }

  static LicenseVerificationEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<LicenseVerificationEntity>(json);
  }
}

mixin LicenseVerificationEntityMappable {
  String toJsonString() {
    return LicenseVerificationEntityMapper.ensureInitialized()
        .encodeJson<LicenseVerificationEntity>(
          this as LicenseVerificationEntity,
        );
  }

  Map<String, dynamic> toJson() {
    return LicenseVerificationEntityMapper.ensureInitialized()
        .encodeMap<LicenseVerificationEntity>(
          this as LicenseVerificationEntity,
        );
  }

  LicenseVerificationEntityCopyWith<
    LicenseVerificationEntity,
    LicenseVerificationEntity,
    LicenseVerificationEntity
  >
  get copyWith =>
      _LicenseVerificationEntityCopyWithImpl<
        LicenseVerificationEntity,
        LicenseVerificationEntity
      >(this as LicenseVerificationEntity, $identity, $identity);
  @override
  String toString() {
    return LicenseVerificationEntityMapper.ensureInitialized().stringifyValue(
      this as LicenseVerificationEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return LicenseVerificationEntityMapper.ensureInitialized().equalsValue(
      this as LicenseVerificationEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return LicenseVerificationEntityMapper.ensureInitialized().hashValue(
      this as LicenseVerificationEntity,
    );
  }
}

extension LicenseVerificationEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LicenseVerificationEntity, $Out> {
  LicenseVerificationEntityCopyWith<$R, LicenseVerificationEntity, $Out>
  get $asLicenseVerificationEntity => $base.as(
    (v, t, t2) => _LicenseVerificationEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class LicenseVerificationEntityCopyWith<
  $R,
  $In extends LicenseVerificationEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? licenseNumber,
    String? nationalId,
    VerificationStatus? status,
    String? reviewNotes,
    String? requestedAt,
    String? verifiedAt,
  });
  LicenseVerificationEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _LicenseVerificationEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LicenseVerificationEntity, $Out>
    implements
        LicenseVerificationEntityCopyWith<$R, LicenseVerificationEntity, $Out> {
  _LicenseVerificationEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LicenseVerificationEntity> $mapper =
      LicenseVerificationEntityMapper.ensureInitialized();
  @override
  $R call({
    Object? licenseNumber = $none,
    Object? nationalId = $none,
    VerificationStatus? status,
    Object? reviewNotes = $none,
    Object? requestedAt = $none,
    Object? verifiedAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (licenseNumber != $none) #licenseNumber: licenseNumber,
      if (nationalId != $none) #nationalId: nationalId,
      if (status != null) #status: status,
      if (reviewNotes != $none) #reviewNotes: reviewNotes,
      if (requestedAt != $none) #requestedAt: requestedAt,
      if (verifiedAt != $none) #verifiedAt: verifiedAt,
    }),
  );
  @override
  LicenseVerificationEntity $make(CopyWithData data) =>
      LicenseVerificationEntity(
        licenseNumber: data.get(#licenseNumber, or: $value.licenseNumber),
        nationalId: data.get(#nationalId, or: $value.nationalId),
        status: data.get(#status, or: $value.status),
        reviewNotes: data.get(#reviewNotes, or: $value.reviewNotes),
        requestedAt: data.get(#requestedAt, or: $value.requestedAt),
        verifiedAt: data.get(#verifiedAt, or: $value.verifiedAt),
      );

  @override
  LicenseVerificationEntityCopyWith<$R2, LicenseVerificationEntity, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _LicenseVerificationEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

