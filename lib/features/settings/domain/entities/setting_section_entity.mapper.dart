// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'setting_section_entity.dart';

class SettingSectionEntityMapper extends ClassMapperBase<SettingSectionEntity> {
  SettingSectionEntityMapper._();

  static SettingSectionEntityMapper? _instance;
  static SettingSectionEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SettingSectionEntityMapper._());
      SettingItemEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SettingSectionEntity';

  static String _$title(SettingSectionEntity v) => v.title;
  static const Field<SettingSectionEntity, String> _f$title = Field(
    'title',
    _$title,
  );
  static List<SettingItemEntity> _$items(SettingSectionEntity v) => v.items;
  static const Field<SettingSectionEntity, List<SettingItemEntity>> _f$items =
      Field('items', _$items);

  @override
  final MappableFields<SettingSectionEntity> fields = const {
    #title: _f$title,
    #items: _f$items,
  };
  @override
  final bool ignoreNull = true;

  static SettingSectionEntity _instantiate(DecodingData data) {
    return SettingSectionEntity(
      title: data.dec(_f$title),
      items: data.dec(_f$items),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SettingSectionEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SettingSectionEntity>(map);
  }

  static SettingSectionEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<SettingSectionEntity>(json);
  }
}

mixin SettingSectionEntityMappable {
  String toJsonString() {
    return SettingSectionEntityMapper.ensureInitialized()
        .encodeJson<SettingSectionEntity>(this as SettingSectionEntity);
  }

  Map<String, dynamic> toJson() {
    return SettingSectionEntityMapper.ensureInitialized()
        .encodeMap<SettingSectionEntity>(this as SettingSectionEntity);
  }

  SettingSectionEntityCopyWith<
    SettingSectionEntity,
    SettingSectionEntity,
    SettingSectionEntity
  >
  get copyWith =>
      _SettingSectionEntityCopyWithImpl<
        SettingSectionEntity,
        SettingSectionEntity
      >(this as SettingSectionEntity, $identity, $identity);
  @override
  String toString() {
    return SettingSectionEntityMapper.ensureInitialized().stringifyValue(
      this as SettingSectionEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return SettingSectionEntityMapper.ensureInitialized().equalsValue(
      this as SettingSectionEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return SettingSectionEntityMapper.ensureInitialized().hashValue(
      this as SettingSectionEntity,
    );
  }
}

extension SettingSectionEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SettingSectionEntity, $Out> {
  SettingSectionEntityCopyWith<$R, SettingSectionEntity, $Out>
  get $asSettingSectionEntity => $base.as(
    (v, t, t2) => _SettingSectionEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SettingSectionEntityCopyWith<
  $R,
  $In extends SettingSectionEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    SettingItemEntity,
    SettingItemEntityCopyWith<$R, SettingItemEntity, SettingItemEntity>
  >
  get items;
  $R call({String? title, List<SettingItemEntity>? items});
  SettingSectionEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SettingSectionEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SettingSectionEntity, $Out>
    implements SettingSectionEntityCopyWith<$R, SettingSectionEntity, $Out> {
  _SettingSectionEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SettingSectionEntity> $mapper =
      SettingSectionEntityMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    SettingItemEntity,
    SettingItemEntityCopyWith<$R, SettingItemEntity, SettingItemEntity>
  >
  get items => ListCopyWith(
    $value.items,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(items: v),
  );
  @override
  $R call({String? title, List<SettingItemEntity>? items}) => $apply(
    FieldCopyWithData({
      if (title != null) #title: title,
      if (items != null) #items: items,
    }),
  );
  @override
  SettingSectionEntity $make(CopyWithData data) => SettingSectionEntity(
    title: data.get(#title, or: $value.title),
    items: data.get(#items, or: $value.items),
  );

  @override
  SettingSectionEntityCopyWith<$R2, SettingSectionEntity, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SettingSectionEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

