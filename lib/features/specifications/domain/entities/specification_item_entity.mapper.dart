// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'specification_item_entity.dart';

class SpecificationItemEntityMapper
    extends ClassMapperBase<SpecificationItemEntity> {
  SpecificationItemEntityMapper._();

  static SpecificationItemEntityMapper? _instance;
  static SpecificationItemEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = SpecificationItemEntityMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'SpecificationItemEntity';

  static String? _$name(SpecificationItemEntity v) => v.name;
  static const Field<SpecificationItemEntity, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );

  @override
  final MappableFields<SpecificationItemEntity> fields = const {#name: _f$name};
  @override
  final bool ignoreNull = true;

  static SpecificationItemEntity _instantiate(DecodingData data) {
    return SpecificationItemEntity(name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static SpecificationItemEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SpecificationItemEntity>(map);
  }

  static SpecificationItemEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<SpecificationItemEntity>(json);
  }
}

mixin SpecificationItemEntityMappable {
  String toJsonString() {
    return SpecificationItemEntityMapper.ensureInitialized()
        .encodeJson<SpecificationItemEntity>(this as SpecificationItemEntity);
  }

  Map<String, dynamic> toJson() {
    return SpecificationItemEntityMapper.ensureInitialized()
        .encodeMap<SpecificationItemEntity>(this as SpecificationItemEntity);
  }

  SpecificationItemEntityCopyWith<
    SpecificationItemEntity,
    SpecificationItemEntity,
    SpecificationItemEntity
  >
  get copyWith =>
      _SpecificationItemEntityCopyWithImpl<
        SpecificationItemEntity,
        SpecificationItemEntity
      >(this as SpecificationItemEntity, $identity, $identity);
  @override
  String toString() {
    return SpecificationItemEntityMapper.ensureInitialized().stringifyValue(
      this as SpecificationItemEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return SpecificationItemEntityMapper.ensureInitialized().equalsValue(
      this as SpecificationItemEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return SpecificationItemEntityMapper.ensureInitialized().hashValue(
      this as SpecificationItemEntity,
    );
  }
}

extension SpecificationItemEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SpecificationItemEntity, $Out> {
  SpecificationItemEntityCopyWith<$R, SpecificationItemEntity, $Out>
  get $asSpecificationItemEntity => $base.as(
    (v, t, t2) => _SpecificationItemEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SpecificationItemEntityCopyWith<
  $R,
  $In extends SpecificationItemEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name});
  SpecificationItemEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SpecificationItemEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SpecificationItemEntity, $Out>
    implements
        SpecificationItemEntityCopyWith<$R, SpecificationItemEntity, $Out> {
  _SpecificationItemEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SpecificationItemEntity> $mapper =
      SpecificationItemEntityMapper.ensureInitialized();
  @override
  $R call({Object? name = $none}) =>
      $apply(FieldCopyWithData({if (name != $none) #name: name}));
  @override
  SpecificationItemEntity $make(CopyWithData data) =>
      SpecificationItemEntity(name: data.get(#name, or: $value.name));

  @override
  SpecificationItemEntityCopyWith<$R2, SpecificationItemEntity, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SpecificationItemEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

