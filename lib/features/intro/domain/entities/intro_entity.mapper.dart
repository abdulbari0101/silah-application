// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'intro_entity.dart';

class IntroEntityMapper extends ClassMapperBase<IntroEntity> {
  IntroEntityMapper._();

  static IntroEntityMapper? _instance;
  static IntroEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IntroEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'IntroEntity';

  static String? _$name(IntroEntity v) => v.name;
  static const Field<IntroEntity, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );

  @override
  final MappableFields<IntroEntity> fields = const {#name: _f$name};
  @override
  final bool ignoreNull = true;

  static IntroEntity _instantiate(DecodingData data) {
    return IntroEntity(name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static IntroEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IntroEntity>(map);
  }

  static IntroEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<IntroEntity>(json);
  }
}

mixin IntroEntityMappable {
  String toJsonString() {
    return IntroEntityMapper.ensureInitialized().encodeJson<IntroEntity>(
      this as IntroEntity,
    );
  }

  Map<String, dynamic> toJson() {
    return IntroEntityMapper.ensureInitialized().encodeMap<IntroEntity>(
      this as IntroEntity,
    );
  }

  IntroEntityCopyWith<IntroEntity, IntroEntity, IntroEntity> get copyWith =>
      _IntroEntityCopyWithImpl<IntroEntity, IntroEntity>(
        this as IntroEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return IntroEntityMapper.ensureInitialized().stringifyValue(
      this as IntroEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return IntroEntityMapper.ensureInitialized().equalsValue(
      this as IntroEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return IntroEntityMapper.ensureInitialized().hashValue(this as IntroEntity);
  }
}

extension IntroEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IntroEntity, $Out> {
  IntroEntityCopyWith<$R, IntroEntity, $Out> get $asIntroEntity =>
      $base.as((v, t, t2) => _IntroEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class IntroEntityCopyWith<$R, $In extends IntroEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name});
  IntroEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _IntroEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IntroEntity, $Out>
    implements IntroEntityCopyWith<$R, IntroEntity, $Out> {
  _IntroEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IntroEntity> $mapper =
      IntroEntityMapper.ensureInitialized();
  @override
  $R call({Object? name = $none}) =>
      $apply(FieldCopyWithData({if (name != $none) #name: name}));
  @override
  IntroEntity $make(CopyWithData data) =>
      IntroEntity(name: data.get(#name, or: $value.name));

  @override
  IntroEntityCopyWith<$R2, IntroEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _IntroEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

