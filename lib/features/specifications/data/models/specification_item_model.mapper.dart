// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'specification_item_model.dart';

class SpecificationItemModelMapper
    extends ClassMapperBase<SpecificationItemModel> {
  SpecificationItemModelMapper._();

  static SpecificationItemModelMapper? _instance;
  static SpecificationItemModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SpecificationItemModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SpecificationItemModel';

  static String? _$name(SpecificationItemModel v) => v.name;
  static const Field<SpecificationItemModel, String> _f$name = Field(
    'name',
    _$name,
    key: r'NAME',
    opt: true,
  );

  @override
  final MappableFields<SpecificationItemModel> fields = const {#name: _f$name};
  @override
  final bool ignoreNull = true;

  static SpecificationItemModel _instantiate(DecodingData data) {
    return SpecificationItemModel(name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static SpecificationItemModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SpecificationItemModel>(map);
  }

  static SpecificationItemModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<SpecificationItemModel>(json);
  }
}

mixin SpecificationItemModelMappable {
  String toJsonString() {
    return SpecificationItemModelMapper.ensureInitialized()
        .encodeJson<SpecificationItemModel>(this as SpecificationItemModel);
  }

  Map<String, dynamic> toJson() {
    return SpecificationItemModelMapper.ensureInitialized()
        .encodeMap<SpecificationItemModel>(this as SpecificationItemModel);
  }

  SpecificationItemModelCopyWith<
    SpecificationItemModel,
    SpecificationItemModel,
    SpecificationItemModel
  >
  get copyWith =>
      _SpecificationItemModelCopyWithImpl<
        SpecificationItemModel,
        SpecificationItemModel
      >(this as SpecificationItemModel, $identity, $identity);
  @override
  String toString() {
    return SpecificationItemModelMapper.ensureInitialized().stringifyValue(
      this as SpecificationItemModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return SpecificationItemModelMapper.ensureInitialized().equalsValue(
      this as SpecificationItemModel,
      other,
    );
  }

  @override
  int get hashCode {
    return SpecificationItemModelMapper.ensureInitialized().hashValue(
      this as SpecificationItemModel,
    );
  }
}

extension SpecificationItemModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SpecificationItemModel, $Out> {
  SpecificationItemModelCopyWith<$R, SpecificationItemModel, $Out>
  get $asSpecificationItemModel => $base.as(
    (v, t, t2) => _SpecificationItemModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SpecificationItemModelCopyWith<
  $R,
  $In extends SpecificationItemModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name});
  SpecificationItemModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SpecificationItemModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SpecificationItemModel, $Out>
    implements
        SpecificationItemModelCopyWith<$R, SpecificationItemModel, $Out> {
  _SpecificationItemModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SpecificationItemModel> $mapper =
      SpecificationItemModelMapper.ensureInitialized();
  @override
  $R call({Object? name = $none}) =>
      $apply(FieldCopyWithData({if (name != $none) #name: name}));
  @override
  SpecificationItemModel $make(CopyWithData data) =>
      SpecificationItemModel(name: data.get(#name, or: $value.name));

  @override
  SpecificationItemModelCopyWith<$R2, SpecificationItemModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SpecificationItemModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

