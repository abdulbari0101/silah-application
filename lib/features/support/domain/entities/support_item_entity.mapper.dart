// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'support_item_entity.dart';

class SupportItemEntityMapper extends ClassMapperBase<SupportItemEntity> {
  SupportItemEntityMapper._();

  static SupportItemEntityMapper? _instance;
  static SupportItemEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SupportItemEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SupportItemEntity';

  static String? _$name(SupportItemEntity v) => v.name;
  static const Field<SupportItemEntity, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );

  @override
  final MappableFields<SupportItemEntity> fields = const {#name: _f$name};
  @override
  final bool ignoreNull = true;

  static SupportItemEntity _instantiate(DecodingData data) {
    return SupportItemEntity(name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static SupportItemEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SupportItemEntity>(map);
  }

  static SupportItemEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<SupportItemEntity>(json);
  }
}

mixin SupportItemEntityMappable {
  String toJsonString() {
    return SupportItemEntityMapper.ensureInitialized()
        .encodeJson<SupportItemEntity>(this as SupportItemEntity);
  }

  Map<String, dynamic> toJson() {
    return SupportItemEntityMapper.ensureInitialized()
        .encodeMap<SupportItemEntity>(this as SupportItemEntity);
  }

  SupportItemEntityCopyWith<
    SupportItemEntity,
    SupportItemEntity,
    SupportItemEntity
  >
  get copyWith =>
      _SupportItemEntityCopyWithImpl<SupportItemEntity, SupportItemEntity>(
        this as SupportItemEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SupportItemEntityMapper.ensureInitialized().stringifyValue(
      this as SupportItemEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return SupportItemEntityMapper.ensureInitialized().equalsValue(
      this as SupportItemEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return SupportItemEntityMapper.ensureInitialized().hashValue(
      this as SupportItemEntity,
    );
  }
}

extension SupportItemEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SupportItemEntity, $Out> {
  SupportItemEntityCopyWith<$R, SupportItemEntity, $Out>
  get $asSupportItemEntity => $base.as(
    (v, t, t2) => _SupportItemEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SupportItemEntityCopyWith<
  $R,
  $In extends SupportItemEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name});
  SupportItemEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SupportItemEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SupportItemEntity, $Out>
    implements SupportItemEntityCopyWith<$R, SupportItemEntity, $Out> {
  _SupportItemEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SupportItemEntity> $mapper =
      SupportItemEntityMapper.ensureInitialized();
  @override
  $R call({Object? name = $none}) =>
      $apply(FieldCopyWithData({if (name != $none) #name: name}));
  @override
  SupportItemEntity $make(CopyWithData data) =>
      SupportItemEntity(name: data.get(#name, or: $value.name));

  @override
  SupportItemEntityCopyWith<$R2, SupportItemEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SupportItemEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

