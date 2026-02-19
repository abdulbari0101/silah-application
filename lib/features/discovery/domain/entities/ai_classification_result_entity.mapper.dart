// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'ai_classification_result_entity.dart';

class AiClassificationResultEntityMapper
    extends ClassMapperBase<AiClassificationResultEntity> {
  AiClassificationResultEntityMapper._();

  static AiClassificationResultEntityMapper? _instance;
  static AiClassificationResultEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = AiClassificationResultEntityMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'AiClassificationResultEntity';

  static String? _$specializationId(AiClassificationResultEntity v) =>
      v.specializationId;
  static const Field<AiClassificationResultEntity, String> _f$specializationId =
      Field('specializationId', _$specializationId, opt: true);
  static String? _$specializationName(AiClassificationResultEntity v) =>
      v.specializationName;
  static const Field<AiClassificationResultEntity, String>
  _f$specializationName = Field(
    'specializationName',
    _$specializationName,
    opt: true,
  );
  static double? _$confidence(AiClassificationResultEntity v) => v.confidence;
  static const Field<AiClassificationResultEntity, double> _f$confidence =
      Field('confidence', _$confidence, opt: true);
  static List<String>? _$keywords(AiClassificationResultEntity v) => v.keywords;
  static const Field<AiClassificationResultEntity, List<String>> _f$keywords =
      Field('keywords', _$keywords, opt: true);

  @override
  final MappableFields<AiClassificationResultEntity> fields = const {
    #specializationId: _f$specializationId,
    #specializationName: _f$specializationName,
    #confidence: _f$confidence,
    #keywords: _f$keywords,
  };
  @override
  final bool ignoreNull = true;

  static AiClassificationResultEntity _instantiate(DecodingData data) {
    return AiClassificationResultEntity(
      specializationId: data.dec(_f$specializationId),
      specializationName: data.dec(_f$specializationName),
      confidence: data.dec(_f$confidence),
      keywords: data.dec(_f$keywords),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AiClassificationResultEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AiClassificationResultEntity>(map);
  }

  static AiClassificationResultEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<AiClassificationResultEntity>(json);
  }
}

mixin AiClassificationResultEntityMappable {
  String toJsonString() {
    return AiClassificationResultEntityMapper.ensureInitialized()
        .encodeJson<AiClassificationResultEntity>(
          this as AiClassificationResultEntity,
        );
  }

  Map<String, dynamic> toJson() {
    return AiClassificationResultEntityMapper.ensureInitialized()
        .encodeMap<AiClassificationResultEntity>(
          this as AiClassificationResultEntity,
        );
  }

  AiClassificationResultEntityCopyWith<
    AiClassificationResultEntity,
    AiClassificationResultEntity,
    AiClassificationResultEntity
  >
  get copyWith =>
      _AiClassificationResultEntityCopyWithImpl<
        AiClassificationResultEntity,
        AiClassificationResultEntity
      >(this as AiClassificationResultEntity, $identity, $identity);
  @override
  String toString() {
    return AiClassificationResultEntityMapper.ensureInitialized()
        .stringifyValue(this as AiClassificationResultEntity);
  }

  @override
  bool operator ==(Object other) {
    return AiClassificationResultEntityMapper.ensureInitialized().equalsValue(
      this as AiClassificationResultEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return AiClassificationResultEntityMapper.ensureInitialized().hashValue(
      this as AiClassificationResultEntity,
    );
  }
}

extension AiClassificationResultEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AiClassificationResultEntity, $Out> {
  AiClassificationResultEntityCopyWith<$R, AiClassificationResultEntity, $Out>
  get $asAiClassificationResultEntity => $base.as(
    (v, t, t2) => _AiClassificationResultEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AiClassificationResultEntityCopyWith<
  $R,
  $In extends AiClassificationResultEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get keywords;
  $R call({
    String? specializationId,
    String? specializationName,
    double? confidence,
    List<String>? keywords,
  });
  AiClassificationResultEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AiClassificationResultEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AiClassificationResultEntity, $Out>
    implements
        AiClassificationResultEntityCopyWith<
          $R,
          AiClassificationResultEntity,
          $Out
        > {
  _AiClassificationResultEntityCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<AiClassificationResultEntity> $mapper =
      AiClassificationResultEntityMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get keywords =>
      $value.keywords != null
      ? ListCopyWith(
          $value.keywords!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(keywords: v),
        )
      : null;
  @override
  $R call({
    Object? specializationId = $none,
    Object? specializationName = $none,
    Object? confidence = $none,
    Object? keywords = $none,
  }) => $apply(
    FieldCopyWithData({
      if (specializationId != $none) #specializationId: specializationId,
      if (specializationName != $none) #specializationName: specializationName,
      if (confidence != $none) #confidence: confidence,
      if (keywords != $none) #keywords: keywords,
    }),
  );
  @override
  AiClassificationResultEntity $make(CopyWithData data) =>
      AiClassificationResultEntity(
        specializationId: data.get(
          #specializationId,
          or: $value.specializationId,
        ),
        specializationName: data.get(
          #specializationName,
          or: $value.specializationName,
        ),
        confidence: data.get(#confidence, or: $value.confidence),
        keywords: data.get(#keywords, or: $value.keywords),
      );

  @override
  AiClassificationResultEntityCopyWith<$R2, AiClassificationResultEntity, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AiClassificationResultEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

