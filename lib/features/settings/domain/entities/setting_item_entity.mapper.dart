// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'setting_item_entity.dart';

class SettingItemEntityMapper extends ClassMapperBase<SettingItemEntity> {
  SettingItemEntityMapper._();

  static SettingItemEntityMapper? _instance;
  static SettingItemEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SettingItemEntityMapper._());
      SettingItemTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SettingItemEntity';

  static String _$key(SettingItemEntity v) => v.key;
  static const Field<SettingItemEntity, String> _f$key = Field('key', _$key);
  static String _$title(SettingItemEntity v) => v.title;
  static const Field<SettingItemEntity, String> _f$title = Field(
    'title',
    _$title,
  );
  static String? _$description(SettingItemEntity v) => v.description;
  static const Field<SettingItemEntity, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static SettingItemType _$type(SettingItemEntity v) => v.type;
  static const Field<SettingItemEntity, SettingItemType> _f$type = Field(
    'type',
    _$type,
  );
  static dynamic _$value(SettingItemEntity v) => v.value;
  static const Field<SettingItemEntity, dynamic> _f$value = Field(
    'value',
    _$value,
    opt: true,
  );

  @override
  final MappableFields<SettingItemEntity> fields = const {
    #key: _f$key,
    #title: _f$title,
    #description: _f$description,
    #type: _f$type,
    #value: _f$value,
  };
  @override
  final bool ignoreNull = true;

  static SettingItemEntity _instantiate(DecodingData data) {
    return SettingItemEntity(
      key: data.dec(_f$key),
      title: data.dec(_f$title),
      description: data.dec(_f$description),
      type: data.dec(_f$type),
      value: data.dec(_f$value),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SettingItemEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SettingItemEntity>(map);
  }

  static SettingItemEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<SettingItemEntity>(json);
  }
}

mixin SettingItemEntityMappable {
  String toJsonString() {
    return SettingItemEntityMapper.ensureInitialized()
        .encodeJson<SettingItemEntity>(this as SettingItemEntity);
  }

  Map<String, dynamic> toJson() {
    return SettingItemEntityMapper.ensureInitialized()
        .encodeMap<SettingItemEntity>(this as SettingItemEntity);
  }

  SettingItemEntityCopyWith<
    SettingItemEntity,
    SettingItemEntity,
    SettingItemEntity
  >
  get copyWith =>
      _SettingItemEntityCopyWithImpl<SettingItemEntity, SettingItemEntity>(
        this as SettingItemEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SettingItemEntityMapper.ensureInitialized().stringifyValue(
      this as SettingItemEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return SettingItemEntityMapper.ensureInitialized().equalsValue(
      this as SettingItemEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return SettingItemEntityMapper.ensureInitialized().hashValue(
      this as SettingItemEntity,
    );
  }
}

extension SettingItemEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SettingItemEntity, $Out> {
  SettingItemEntityCopyWith<$R, SettingItemEntity, $Out>
  get $asSettingItemEntity => $base.as(
    (v, t, t2) => _SettingItemEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SettingItemEntityCopyWith<
  $R,
  $In extends SettingItemEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? key,
    String? title,
    String? description,
    SettingItemType? type,
    dynamic value,
  });
  SettingItemEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SettingItemEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SettingItemEntity, $Out>
    implements SettingItemEntityCopyWith<$R, SettingItemEntity, $Out> {
  _SettingItemEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SettingItemEntity> $mapper =
      SettingItemEntityMapper.ensureInitialized();
  @override
  $R call({
    String? key,
    String? title,
    Object? description = $none,
    SettingItemType? type,
    Object? value = $none,
  }) => $apply(
    FieldCopyWithData({
      if (key != null) #key: key,
      if (title != null) #title: title,
      if (description != $none) #description: description,
      if (type != null) #type: type,
      if (value != $none) #value: value,
    }),
  );
  @override
  SettingItemEntity $make(CopyWithData data) => SettingItemEntity(
    key: data.get(#key, or: $value.key),
    title: data.get(#title, or: $value.title),
    description: data.get(#description, or: $value.description),
    type: data.get(#type, or: $value.type),
    value: data.get(#value, or: $value.value),
  );

  @override
  SettingItemEntityCopyWith<$R2, SettingItemEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SettingItemEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

