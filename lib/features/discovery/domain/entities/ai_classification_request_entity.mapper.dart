// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'ai_classification_request_entity.dart';

class AiClassificationRequestEntityMapper
    extends ClassMapperBase<AiClassificationRequestEntity> {
  AiClassificationRequestEntityMapper._();

  static AiClassificationRequestEntityMapper? _instance;
  static AiClassificationRequestEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = AiClassificationRequestEntityMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'AiClassificationRequestEntity';

  static String _$prompt(AiClassificationRequestEntity v) => v.prompt;
  static const Field<AiClassificationRequestEntity, String> _f$prompt = Field(
    'prompt',
    _$prompt,
  );
  static String? _$languageCode(AiClassificationRequestEntity v) =>
      v.languageCode;
  static const Field<AiClassificationRequestEntity, String> _f$languageCode =
      Field('languageCode', _$languageCode, opt: true);

  @override
  final MappableFields<AiClassificationRequestEntity> fields = const {
    #prompt: _f$prompt,
    #languageCode: _f$languageCode,
  };
  @override
  final bool ignoreNull = true;

  static AiClassificationRequestEntity _instantiate(DecodingData data) {
    return AiClassificationRequestEntity(
      prompt: data.dec(_f$prompt),
      languageCode: data.dec(_f$languageCode),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AiClassificationRequestEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AiClassificationRequestEntity>(map);
  }

  static AiClassificationRequestEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<AiClassificationRequestEntity>(json);
  }
}

mixin AiClassificationRequestEntityMappable {
  String toJsonString() {
    return AiClassificationRequestEntityMapper.ensureInitialized()
        .encodeJson<AiClassificationRequestEntity>(
          this as AiClassificationRequestEntity,
        );
  }

  Map<String, dynamic> toJson() {
    return AiClassificationRequestEntityMapper.ensureInitialized()
        .encodeMap<AiClassificationRequestEntity>(
          this as AiClassificationRequestEntity,
        );
  }

  AiClassificationRequestEntityCopyWith<
    AiClassificationRequestEntity,
    AiClassificationRequestEntity,
    AiClassificationRequestEntity
  >
  get copyWith =>
      _AiClassificationRequestEntityCopyWithImpl<
        AiClassificationRequestEntity,
        AiClassificationRequestEntity
      >(this as AiClassificationRequestEntity, $identity, $identity);
  @override
  String toString() {
    return AiClassificationRequestEntityMapper.ensureInitialized()
        .stringifyValue(this as AiClassificationRequestEntity);
  }

  @override
  bool operator ==(Object other) {
    return AiClassificationRequestEntityMapper.ensureInitialized().equalsValue(
      this as AiClassificationRequestEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return AiClassificationRequestEntityMapper.ensureInitialized().hashValue(
      this as AiClassificationRequestEntity,
    );
  }
}

extension AiClassificationRequestEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AiClassificationRequestEntity, $Out> {
  AiClassificationRequestEntityCopyWith<$R, AiClassificationRequestEntity, $Out>
  get $asAiClassificationRequestEntity => $base.as(
    (v, t, t2) =>
        _AiClassificationRequestEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AiClassificationRequestEntityCopyWith<
  $R,
  $In extends AiClassificationRequestEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? prompt, String? languageCode});
  AiClassificationRequestEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AiClassificationRequestEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AiClassificationRequestEntity, $Out>
    implements
        AiClassificationRequestEntityCopyWith<
          $R,
          AiClassificationRequestEntity,
          $Out
        > {
  _AiClassificationRequestEntityCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<AiClassificationRequestEntity> $mapper =
      AiClassificationRequestEntityMapper.ensureInitialized();
  @override
  $R call({String? prompt, Object? languageCode = $none}) => $apply(
    FieldCopyWithData({
      if (prompt != null) #prompt: prompt,
      if (languageCode != $none) #languageCode: languageCode,
    }),
  );
  @override
  AiClassificationRequestEntity $make(CopyWithData data) =>
      AiClassificationRequestEntity(
        prompt: data.get(#prompt, or: $value.prompt),
        languageCode: data.get(#languageCode, or: $value.languageCode),
      );

  @override
  AiClassificationRequestEntityCopyWith<
    $R2,
    AiClassificationRequestEntity,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AiClassificationRequestEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

