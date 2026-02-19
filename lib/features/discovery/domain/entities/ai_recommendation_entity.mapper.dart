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
    }
    return _instance!;
  }

  @override
  final String id = 'AiRecommendationEntity';

  static String? _$specialization(AiRecommendationEntity v) => v.specialization;
  static const Field<AiRecommendationEntity, String> _f$specialization = Field(
    'specialization',
    _$specialization,
    opt: true,
  );
  static List<String>? _$lawyerIds(AiRecommendationEntity v) => v.lawyerIds;
  static const Field<AiRecommendationEntity, List<String>> _f$lawyerIds = Field(
    'lawyerIds',
    _$lawyerIds,
    opt: true,
  );

  @override
  final MappableFields<AiRecommendationEntity> fields = const {
    #specialization: _f$specialization,
    #lawyerIds: _f$lawyerIds,
  };
  @override
  final bool ignoreNull = true;

  static AiRecommendationEntity _instantiate(DecodingData data) {
    return AiRecommendationEntity(
      specialization: data.dec(_f$specialization),
      lawyerIds: data.dec(_f$lawyerIds),
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
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get lawyerIds;
  $R call({String? specialization, List<String>? lawyerIds});
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
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get lawyerIds =>
      $value.lawyerIds != null
      ? ListCopyWith(
          $value.lawyerIds!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(lawyerIds: v),
        )
      : null;
  @override
  $R call({Object? specialization = $none, Object? lawyerIds = $none}) =>
      $apply(
        FieldCopyWithData({
          if (specialization != $none) #specialization: specialization,
          if (lawyerIds != $none) #lawyerIds: lawyerIds,
        }),
      );
  @override
  AiRecommendationEntity $make(CopyWithData data) => AiRecommendationEntity(
    specialization: data.get(#specialization, or: $value.specialization),
    lawyerIds: data.get(#lawyerIds, or: $value.lawyerIds),
  );

  @override
  AiRecommendationEntityCopyWith<$R2, AiRecommendationEntity, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AiRecommendationEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

