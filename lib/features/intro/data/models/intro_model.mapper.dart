// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'intro_model.dart';

class IntroModelMapper extends ClassMapperBase<IntroModel> {
  IntroModelMapper._();

  static IntroModelMapper? _instance;
  static IntroModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IntroModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'IntroModel';

  static String? _$name(IntroModel v) => v.name;
  static const Field<IntroModel, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );

  @override
  final MappableFields<IntroModel> fields = const {#name: _f$name};
  @override
  final bool ignoreNull = true;

  static IntroModel _instantiate(DecodingData data) {
    return IntroModel(name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static IntroModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IntroModel>(map);
  }

  static IntroModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<IntroModel>(json);
  }
}

mixin IntroModelMappable {
  String toJsonString() {
    return IntroModelMapper.ensureInitialized().encodeJson<IntroModel>(
      this as IntroModel,
    );
  }

  Map<String, dynamic> toJson() {
    return IntroModelMapper.ensureInitialized().encodeMap<IntroModel>(
      this as IntroModel,
    );
  }

  IntroModelCopyWith<IntroModel, IntroModel, IntroModel> get copyWith =>
      _IntroModelCopyWithImpl<IntroModel, IntroModel>(
        this as IntroModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return IntroModelMapper.ensureInitialized().stringifyValue(
      this as IntroModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return IntroModelMapper.ensureInitialized().equalsValue(
      this as IntroModel,
      other,
    );
  }

  @override
  int get hashCode {
    return IntroModelMapper.ensureInitialized().hashValue(this as IntroModel);
  }
}

extension IntroModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IntroModel, $Out> {
  IntroModelCopyWith<$R, IntroModel, $Out> get $asIntroModel =>
      $base.as((v, t, t2) => _IntroModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class IntroModelCopyWith<$R, $In extends IntroModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name});
  IntroModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _IntroModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IntroModel, $Out>
    implements IntroModelCopyWith<$R, IntroModel, $Out> {
  _IntroModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IntroModel> $mapper =
      IntroModelMapper.ensureInitialized();
  @override
  $R call({Object? name = $none}) =>
      $apply(FieldCopyWithData({if (name != $none) #name: name}));
  @override
  IntroModel $make(CopyWithData data) =>
      IntroModel(name: data.get(#name, or: $value.name));

  @override
  IntroModelCopyWith<$R2, IntroModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _IntroModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

