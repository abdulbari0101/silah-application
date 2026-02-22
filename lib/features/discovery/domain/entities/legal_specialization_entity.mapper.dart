// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'legal_specialization_entity.dart';

class LegalSpecializationEntityMapper
    extends ClassMapperBase<LegalSpecializationEntity> {
  LegalSpecializationEntityMapper._();

  static LegalSpecializationEntityMapper? _instance;
  static LegalSpecializationEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = LegalSpecializationEntityMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'LegalSpecializationEntity';

  static String? _$id(LegalSpecializationEntity v) => v.id;
  static const Field<LegalSpecializationEntity, String> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static String? _$code(LegalSpecializationEntity v) => v.code;
  static const Field<LegalSpecializationEntity, String> _f$code = Field(
    'code',
    _$code,
    opt: true,
  );
  static String? _$name(LegalSpecializationEntity v) => v.name;
  static const Field<LegalSpecializationEntity, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$description(LegalSpecializationEntity v) => v.description;
  static const Field<LegalSpecializationEntity, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static String? _$iconUrl(LegalSpecializationEntity v) => v.iconUrl;
  static const Field<LegalSpecializationEntity, String> _f$iconUrl = Field(
    'iconUrl',
    _$iconUrl,
    opt: true,
  );
  static List<String>? _$keywords(LegalSpecializationEntity v) => v.keywords;
  static const Field<LegalSpecializationEntity, List<String>> _f$keywords =
      Field('keywords', _$keywords, opt: true);

  @override
  final MappableFields<LegalSpecializationEntity> fields = const {
    #id: _f$id,
    #code: _f$code,
    #name: _f$name,
    #description: _f$description,
    #iconUrl: _f$iconUrl,
    #keywords: _f$keywords,
  };
  @override
  final bool ignoreNull = true;

  static LegalSpecializationEntity _instantiate(DecodingData data) {
    return LegalSpecializationEntity(
      id: data.dec(_f$id),
      code: data.dec(_f$code),
      name: data.dec(_f$name),
      description: data.dec(_f$description),
      iconUrl: data.dec(_f$iconUrl),
      keywords: data.dec(_f$keywords),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static LegalSpecializationEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LegalSpecializationEntity>(map);
  }

  static LegalSpecializationEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<LegalSpecializationEntity>(json);
  }
}

mixin LegalSpecializationEntityMappable {
  String toJsonString() {
    return LegalSpecializationEntityMapper.ensureInitialized()
        .encodeJson<LegalSpecializationEntity>(
          this as LegalSpecializationEntity,
        );
  }

  Map<String, dynamic> toJson() {
    return LegalSpecializationEntityMapper.ensureInitialized()
        .encodeMap<LegalSpecializationEntity>(
          this as LegalSpecializationEntity,
        );
  }

  LegalSpecializationEntityCopyWith<
    LegalSpecializationEntity,
    LegalSpecializationEntity,
    LegalSpecializationEntity
  >
  get copyWith =>
      _LegalSpecializationEntityCopyWithImpl<
        LegalSpecializationEntity,
        LegalSpecializationEntity
      >(this as LegalSpecializationEntity, $identity, $identity);
  @override
  String toString() {
    return LegalSpecializationEntityMapper.ensureInitialized().stringifyValue(
      this as LegalSpecializationEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return LegalSpecializationEntityMapper.ensureInitialized().equalsValue(
      this as LegalSpecializationEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return LegalSpecializationEntityMapper.ensureInitialized().hashValue(
      this as LegalSpecializationEntity,
    );
  }
}

extension LegalSpecializationEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LegalSpecializationEntity, $Out> {
  LegalSpecializationEntityCopyWith<$R, LegalSpecializationEntity, $Out>
  get $asLegalSpecializationEntity => $base.as(
    (v, t, t2) => _LegalSpecializationEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class LegalSpecializationEntityCopyWith<
  $R,
  $In extends LegalSpecializationEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get keywords;
  $R call({
    String? id,
    String? code,
    String? name,
    String? description,
    String? iconUrl,
    List<String>? keywords,
  });
  LegalSpecializationEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _LegalSpecializationEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LegalSpecializationEntity, $Out>
    implements
        LegalSpecializationEntityCopyWith<$R, LegalSpecializationEntity, $Out> {
  _LegalSpecializationEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LegalSpecializationEntity> $mapper =
      LegalSpecializationEntityMapper.ensureInitialized();
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
    Object? id = $none,
    Object? code = $none,
    Object? name = $none,
    Object? description = $none,
    Object? iconUrl = $none,
    Object? keywords = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (code != $none) #code: code,
      if (name != $none) #name: name,
      if (description != $none) #description: description,
      if (iconUrl != $none) #iconUrl: iconUrl,
      if (keywords != $none) #keywords: keywords,
    }),
  );
  @override
  LegalSpecializationEntity $make(CopyWithData data) =>
      LegalSpecializationEntity(
        id: data.get(#id, or: $value.id),
        code: data.get(#code, or: $value.code),
        name: data.get(#name, or: $value.name),
        description: data.get(#description, or: $value.description),
        iconUrl: data.get(#iconUrl, or: $value.iconUrl),
        keywords: data.get(#keywords, or: $value.keywords),
      );

  @override
  LegalSpecializationEntityCopyWith<$R2, LegalSpecializationEntity, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _LegalSpecializationEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

