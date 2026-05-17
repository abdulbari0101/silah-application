// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'lookup_item_entity.dart';

class LookupItemEntityMapper extends ClassMapperBase<LookupItemEntity> {
  LookupItemEntityMapper._();

  static LookupItemEntityMapper? _instance;
  static LookupItemEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LookupItemEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LookupItemEntity';

  static String? _$id(LookupItemEntity v) => v.id;
  static const Field<LookupItemEntity, String> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static String? _$nameAr(LookupItemEntity v) => v.nameAr;
  static const Field<LookupItemEntity, String> _f$nameAr = Field(
    'nameAr',
    _$nameAr,
    opt: true,
  );
  static String? _$nameEn(LookupItemEntity v) => v.nameEn;
  static const Field<LookupItemEntity, String> _f$nameEn = Field(
    'nameEn',
    _$nameEn,
    opt: true,
  );
  static String? _$iconUrl(LookupItemEntity v) => v.iconUrl;
  static const Field<LookupItemEntity, String> _f$iconUrl = Field(
    'iconUrl',
    _$iconUrl,
    opt: true,
  );
  static String? _$countryId(LookupItemEntity v) => v.countryId;
  static const Field<LookupItemEntity, String> _f$countryId = Field(
    'countryId',
    _$countryId,
    opt: true,
  );

  @override
  final MappableFields<LookupItemEntity> fields = const {
    #id: _f$id,
    #nameAr: _f$nameAr,
    #nameEn: _f$nameEn,
    #iconUrl: _f$iconUrl,
    #countryId: _f$countryId,
  };
  @override
  final bool ignoreNull = true;

  static LookupItemEntity _instantiate(DecodingData data) {
    return LookupItemEntity(
      id: data.dec(_f$id),
      nameAr: data.dec(_f$nameAr),
      nameEn: data.dec(_f$nameEn),
      iconUrl: data.dec(_f$iconUrl),
      countryId: data.dec(_f$countryId),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static LookupItemEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LookupItemEntity>(map);
  }

  static LookupItemEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<LookupItemEntity>(json);
  }
}

mixin LookupItemEntityMappable {
  String toJsonString() {
    return LookupItemEntityMapper.ensureInitialized()
        .encodeJson<LookupItemEntity>(this as LookupItemEntity);
  }

  Map<String, dynamic> toJson() {
    return LookupItemEntityMapper.ensureInitialized()
        .encodeMap<LookupItemEntity>(this as LookupItemEntity);
  }

  LookupItemEntityCopyWith<LookupItemEntity, LookupItemEntity, LookupItemEntity>
  get copyWith =>
      _LookupItemEntityCopyWithImpl<LookupItemEntity, LookupItemEntity>(
        this as LookupItemEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return LookupItemEntityMapper.ensureInitialized().stringifyValue(
      this as LookupItemEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return LookupItemEntityMapper.ensureInitialized().equalsValue(
      this as LookupItemEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return LookupItemEntityMapper.ensureInitialized().hashValue(
      this as LookupItemEntity,
    );
  }
}

extension LookupItemEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LookupItemEntity, $Out> {
  LookupItemEntityCopyWith<$R, LookupItemEntity, $Out>
  get $asLookupItemEntity =>
      $base.as((v, t, t2) => _LookupItemEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LookupItemEntityCopyWith<$R, $In extends LookupItemEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? nameAr,
    String? nameEn,
    String? iconUrl,
    String? countryId,
  });
  LookupItemEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _LookupItemEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LookupItemEntity, $Out>
    implements LookupItemEntityCopyWith<$R, LookupItemEntity, $Out> {
  _LookupItemEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LookupItemEntity> $mapper =
      LookupItemEntityMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    Object? nameAr = $none,
    Object? nameEn = $none,
    Object? iconUrl = $none,
    Object? countryId = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (nameAr != $none) #nameAr: nameAr,
      if (nameEn != $none) #nameEn: nameEn,
      if (iconUrl != $none) #iconUrl: iconUrl,
      if (countryId != $none) #countryId: countryId,
    }),
  );
  @override
  LookupItemEntity $make(CopyWithData data) => LookupItemEntity(
    id: data.get(#id, or: $value.id),
    nameAr: data.get(#nameAr, or: $value.nameAr),
    nameEn: data.get(#nameEn, or: $value.nameEn),
    iconUrl: data.get(#iconUrl, or: $value.iconUrl),
    countryId: data.get(#countryId, or: $value.countryId),
  );

  @override
  LookupItemEntityCopyWith<$R2, LookupItemEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _LookupItemEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

