// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'lookup_item_model.dart';

class LookupItemModelMapper extends ClassMapperBase<LookupItemModel> {
  LookupItemModelMapper._();

  static LookupItemModelMapper? _instance;
  static LookupItemModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LookupItemModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LookupItemModel';

  static String? _$id(LookupItemModel v) => v.id;
  static const Field<LookupItemModel, String> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static String? _$nameAr(LookupItemModel v) => v.nameAr;
  static const Field<LookupItemModel, String> _f$nameAr = Field(
    'nameAr',
    _$nameAr,
    opt: true,
  );
  static String? _$nameEn(LookupItemModel v) => v.nameEn;
  static const Field<LookupItemModel, String> _f$nameEn = Field(
    'nameEn',
    _$nameEn,
    opt: true,
  );
  static String? _$iconUrl(LookupItemModel v) => v.iconUrl;
  static const Field<LookupItemModel, String> _f$iconUrl = Field(
    'iconUrl',
    _$iconUrl,
    opt: true,
  );
  static String? _$areaId(LookupItemModel v) => v.areaId;
  static const Field<LookupItemModel, String> _f$areaId = Field(
    'areaId',
    _$areaId,
    opt: true,
  );

  @override
  final MappableFields<LookupItemModel> fields = const {
    #id: _f$id,
    #nameAr: _f$nameAr,
    #nameEn: _f$nameEn,
    #iconUrl: _f$iconUrl,
    #areaId: _f$areaId,
  };
  @override
  final bool ignoreNull = true;

  static LookupItemModel _instantiate(DecodingData data) {
    return LookupItemModel(
      id: data.dec(_f$id),
      nameAr: data.dec(_f$nameAr),
      nameEn: data.dec(_f$nameEn),
      iconUrl: data.dec(_f$iconUrl),
      areaId: data.dec(_f$areaId),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static LookupItemModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LookupItemModel>(map);
  }

  static LookupItemModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<LookupItemModel>(json);
  }
}

mixin LookupItemModelMappable {
  String toJsonString() {
    return LookupItemModelMapper.ensureInitialized()
        .encodeJson<LookupItemModel>(this as LookupItemModel);
  }

  Map<String, dynamic> toJson() {
    return LookupItemModelMapper.ensureInitialized().encodeMap<LookupItemModel>(
      this as LookupItemModel,
    );
  }

  LookupItemModelCopyWith<LookupItemModel, LookupItemModel, LookupItemModel>
  get copyWith =>
      _LookupItemModelCopyWithImpl<LookupItemModel, LookupItemModel>(
        this as LookupItemModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return LookupItemModelMapper.ensureInitialized().stringifyValue(
      this as LookupItemModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return LookupItemModelMapper.ensureInitialized().equalsValue(
      this as LookupItemModel,
      other,
    );
  }

  @override
  int get hashCode {
    return LookupItemModelMapper.ensureInitialized().hashValue(
      this as LookupItemModel,
    );
  }
}

extension LookupItemModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LookupItemModel, $Out> {
  LookupItemModelCopyWith<$R, LookupItemModel, $Out> get $asLookupItemModel =>
      $base.as((v, t, t2) => _LookupItemModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LookupItemModelCopyWith<$R, $In extends LookupItemModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? nameAr,
    String? nameEn,
    String? iconUrl,
    String? areaId,
  });
  LookupItemModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _LookupItemModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LookupItemModel, $Out>
    implements LookupItemModelCopyWith<$R, LookupItemModel, $Out> {
  _LookupItemModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LookupItemModel> $mapper =
      LookupItemModelMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    Object? nameAr = $none,
    Object? nameEn = $none,
    Object? iconUrl = $none,
    Object? areaId = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (nameAr != $none) #nameAr: nameAr,
      if (nameEn != $none) #nameEn: nameEn,
      if (iconUrl != $none) #iconUrl: iconUrl,
      if (areaId != $none) #areaId: areaId,
    }),
  );
  @override
  LookupItemModel $make(CopyWithData data) => LookupItemModel(
    id: data.get(#id, or: $value.id),
    nameAr: data.get(#nameAr, or: $value.nameAr),
    nameEn: data.get(#nameEn, or: $value.nameEn),
    iconUrl: data.get(#iconUrl, or: $value.iconUrl),
    areaId: data.get(#areaId, or: $value.areaId),
  );

  @override
  LookupItemModelCopyWith<$R2, LookupItemModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _LookupItemModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

