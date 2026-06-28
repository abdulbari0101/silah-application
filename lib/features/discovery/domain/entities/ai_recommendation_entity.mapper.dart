// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'ai_recommendation_entity.dart';

class AiRecommendationEntityMapper
    extends ClassMapperBase<AiRecommendationEntity> {
  AiRecommendationEntityMapper._();

  static AiRecommendationEntityMapper? _instance;
  static AiRecommendationEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AiRecommendationEntityMapper._());
      LegalSpecializationEntityMapper.ensureInitialized();
      LawyerProfileEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AiRecommendationEntity';

  static LegalSpecializationEntity? _$specialization(
    AiRecommendationEntity v,
  ) => v.specialization;
  static const Field<AiRecommendationEntity, LegalSpecializationEntity>
  _f$specialization = Field('specialization', _$specialization, opt: true);
  static List<LawyerProfileEntity>? _$lawyers(AiRecommendationEntity v) =>
      v.lawyers;
  static const Field<AiRecommendationEntity, List<LawyerProfileEntity>>
  _f$lawyers = Field('lawyers', _$lawyers, opt: true);
  static String? _$reason(AiRecommendationEntity v) => v.reason;
  static const Field<AiRecommendationEntity, String> _f$reason =
      Field('reason', _$reason, opt: true);

  @override
  final MappableFields<AiRecommendationEntity> fields = const {
    #specialization: _f$specialization,
    #lawyers: _f$lawyers,
    #reason: _f$reason,
  };
  @override
  final bool ignoreNull = true;

  static AiRecommendationEntity _instantiate(DecodingData data) {
    return AiRecommendationEntity(
      specialization: data.dec(_f$specialization),
      lawyers: data.dec(_f$lawyers),
      reason: data.dec(_f$reason),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AiRecommendationEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AiRecommendationEntity>(map);
  }

  static AiRecommendationEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<AiRecommendationEntity>(json);
  }
}

mixin AiRecommendationEntityMappable {
  String toJsonString() {
    return AiRecommendationEntityMapper.ensureInitialized()
        .encodeJson<AiRecommendationEntity>(this as AiRecommendationEntity);
  }

  Map<String, dynamic> toJson() {
    return AiRecommendationEntityMapper.ensureInitialized()
        .encodeMap<AiRecommendationEntity>(this as AiRecommendationEntity);
  }

  AiRecommendationEntityCopyWith<
    AiRecommendationEntity,
    AiRecommendationEntity,
    AiRecommendationEntity
  >
  get copyWith =>
      _AiRecommendationEntityCopyWithImpl<
        AiRecommendationEntity,
        AiRecommendationEntity
      >(this as AiRecommendationEntity, $identity, $identity);
  @override
  String toString() {
    return AiRecommendationEntityMapper.ensureInitialized().stringifyValue(
      this as AiRecommendationEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return AiRecommendationEntityMapper.ensureInitialized().equalsValue(
      this as AiRecommendationEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return AiRecommendationEntityMapper.ensureInitialized().hashValue(
      this as AiRecommendationEntity,
    );
  }
}

extension AiRecommendationEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AiRecommendationEntity, $Out> {
  AiRecommendationEntityCopyWith<$R, AiRecommendationEntity, $Out>
  get $asAiRecommendationEntity => $base.as(
    (v, t, t2) => _AiRecommendationEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AiRecommendationEntityCopyWith<
  $R,
  $In extends AiRecommendationEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  LegalSpecializationEntityCopyWith<
    $R,
    LegalSpecializationEntity,
    LegalSpecializationEntity
  >?
  get specialization;
  ListCopyWith<
    $R,
    LawyerProfileEntity,
    LawyerProfileEntityCopyWith<$R, LawyerProfileEntity, LawyerProfileEntity>
  >?
  get lawyers;
  $R call({
    LegalSpecializationEntity? specialization,
    List<LawyerProfileEntity>? lawyers,
    String? reason,
  });
  AiRecommendationEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AiRecommendationEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AiRecommendationEntity, $Out>
    implements
        AiRecommendationEntityCopyWith<$R, AiRecommendationEntity, $Out> {
  _AiRecommendationEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AiRecommendationEntity> $mapper =
      AiRecommendationEntityMapper.ensureInitialized();
  @override
  LegalSpecializationEntityCopyWith<
    $R,
    LegalSpecializationEntity,
    LegalSpecializationEntity
  >?
  get specialization =>
      $value.specialization?.copyWith.$chain((v) => call(specialization: v));
  @override
  ListCopyWith<
    $R,
    LawyerProfileEntity,
    LawyerProfileEntityCopyWith<$R, LawyerProfileEntity, LawyerProfileEntity>
  >?
  get lawyers => $value.lawyers != null
      ? ListCopyWith(
          $value.lawyers!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(lawyers: v),
        )
      : null;
  @override
  $R call({
    Object? specialization = $none,
    Object? lawyers = $none,
    Object? reason = $none,
  }) => $apply(
    FieldCopyWithData({
      if (specialization != $none) #specialization: specialization,
      if (lawyers != $none) #lawyers: lawyers,
      if (reason != $none) #reason: reason,
    }),
  );
  @override
  AiRecommendationEntity $make(CopyWithData data) => AiRecommendationEntity(
    specialization: data.get(#specialization, or: $value.specialization),
    lawyers: data.get(#lawyers, or: $value.lawyers),
    reason: data.get(#reason, or: $value.reason),
  );

  @override
  AiRecommendationEntityCopyWith<$R2, AiRecommendationEntity, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AiRecommendationEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

