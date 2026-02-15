// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'support_item_model.dart';

class SupportItemModelMapper extends ClassMapperBase<SupportItemModel> {
  SupportItemModelMapper._();

  static SupportItemModelMapper? _instance;
  static SupportItemModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SupportItemModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SupportItemModel';

  static String? _$name(SupportItemModel v) => v.name;
  static const Field<SupportItemModel, String> _f$name = Field(
    'name',
    _$name,
    key: r'NAME',
    opt: true,
  );

  @override
  final MappableFields<SupportItemModel> fields = const {#name: _f$name};
  @override
  final bool ignoreNull = true;

  static SupportItemModel _instantiate(DecodingData data) {
    return SupportItemModel(name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static SupportItemModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SupportItemModel>(map);
  }

  static SupportItemModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<SupportItemModel>(json);
  }
}

mixin SupportItemModelMappable {
  String toJsonString() {
    return SupportItemModelMapper.ensureInitialized()
        .encodeJson<SupportItemModel>(this as SupportItemModel);
  }

  Map<String, dynamic> toJson() {
    return SupportItemModelMapper.ensureInitialized()
        .encodeMap<SupportItemModel>(this as SupportItemModel);
  }

  SupportItemModelCopyWith<SupportItemModel, SupportItemModel, SupportItemModel>
  get copyWith =>
      _SupportItemModelCopyWithImpl<SupportItemModel, SupportItemModel>(
        this as SupportItemModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SupportItemModelMapper.ensureInitialized().stringifyValue(
      this as SupportItemModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return SupportItemModelMapper.ensureInitialized().equalsValue(
      this as SupportItemModel,
      other,
    );
  }

  @override
  int get hashCode {
    return SupportItemModelMapper.ensureInitialized().hashValue(
      this as SupportItemModel,
    );
  }
}

extension SupportItemModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SupportItemModel, $Out> {
  SupportItemModelCopyWith<$R, SupportItemModel, $Out>
  get $asSupportItemModel =>
      $base.as((v, t, t2) => _SupportItemModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SupportItemModelCopyWith<$R, $In extends SupportItemModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name});
  SupportItemModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SupportItemModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SupportItemModel, $Out>
    implements SupportItemModelCopyWith<$R, SupportItemModel, $Out> {
  _SupportItemModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SupportItemModel> $mapper =
      SupportItemModelMapper.ensureInitialized();
  @override
  $R call({Object? name = $none}) =>
      $apply(FieldCopyWithData({if (name != $none) #name: name}));
  @override
  SupportItemModel $make(CopyWithData data) =>
      SupportItemModel(name: data.get(#name, or: $value.name));

  @override
  SupportItemModelCopyWith<$R2, SupportItemModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SupportItemModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

