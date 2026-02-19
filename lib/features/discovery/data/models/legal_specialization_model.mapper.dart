// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'legal_specialization_model.dart';

class LegalSpecializationModelMapper
    extends ClassMapperBase<LegalSpecializationModel> {
  LegalSpecializationModelMapper._();

  static LegalSpecializationModelMapper? _instance;
  static LegalSpecializationModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = LegalSpecializationModelMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'LegalSpecializationModel';

  static String? _$id(LegalSpecializationModel v) => v.id;
  static const Field<LegalSpecializationModel, String> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static String? _$nameAr(LegalSpecializationModel v) => v.nameAr;
  static const Field<LegalSpecializationModel, String> _f$nameAr = Field(
    'nameAr',
    _$nameAr,
    opt: true,
  );
  static String? _$nameEn(LegalSpecializationModel v) => v.nameEn;
  static const Field<LegalSpecializationModel, String> _f$nameEn = Field(
    'nameEn',
    _$nameEn,
    opt: true,
  );
  static bool? _$active(LegalSpecializationModel v) => v.active;
  static const Field<LegalSpecializationModel, bool> _f$active = Field(
    'active',
    _$active,
    opt: true,
  );

  @override
  final MappableFields<LegalSpecializationModel> fields = const {
    #id: _f$id,
    #nameAr: _f$nameAr,
    #nameEn: _f$nameEn,
    #active: _f$active,
  };
  @override
  final bool ignoreNull = true;

  static LegalSpecializationModel _instantiate(DecodingData data) {
    return LegalSpecializationModel(
      id: data.dec(_f$id),
      nameAr: data.dec(_f$nameAr),
      nameEn: data.dec(_f$nameEn),
      active: data.dec(_f$active),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static LegalSpecializationModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LegalSpecializationModel>(map);
  }

  static LegalSpecializationModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<LegalSpecializationModel>(json);
  }
}

mixin LegalSpecializationModelMappable {
  String toJsonString() {
    return LegalSpecializationModelMapper.ensureInitialized()
        .encodeJson<LegalSpecializationModel>(this as LegalSpecializationModel);
  }

  Map<String, dynamic> toJson() {
    return LegalSpecializationModelMapper.ensureInitialized()
        .encodeMap<LegalSpecializationModel>(this as LegalSpecializationModel);
  }

  LegalSpecializationModelCopyWith<
    LegalSpecializationModel,
    LegalSpecializationModel,
    LegalSpecializationModel
  >
  get copyWith =>
      _LegalSpecializationModelCopyWithImpl<
        LegalSpecializationModel,
        LegalSpecializationModel
      >(this as LegalSpecializationModel, $identity, $identity);
  @override
  String toString() {
    return LegalSpecializationModelMapper.ensureInitialized().stringifyValue(
      this as LegalSpecializationModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return LegalSpecializationModelMapper.ensureInitialized().equalsValue(
      this as LegalSpecializationModel,
      other,
    );
  }

  @override
  int get hashCode {
    return LegalSpecializationModelMapper.ensureInitialized().hashValue(
      this as LegalSpecializationModel,
    );
  }
}

extension LegalSpecializationModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LegalSpecializationModel, $Out> {
  LegalSpecializationModelCopyWith<$R, LegalSpecializationModel, $Out>
  get $asLegalSpecializationModel => $base.as(
    (v, t, t2) => _LegalSpecializationModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class LegalSpecializationModelCopyWith<
  $R,
  $In extends LegalSpecializationModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? nameAr, String? nameEn, bool? active});
  LegalSpecializationModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _LegalSpecializationModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LegalSpecializationModel, $Out>
    implements
        LegalSpecializationModelCopyWith<$R, LegalSpecializationModel, $Out> {
  _LegalSpecializationModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LegalSpecializationModel> $mapper =
      LegalSpecializationModelMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    Object? nameAr = $none,
    Object? nameEn = $none,
    Object? active = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (nameAr != $none) #nameAr: nameAr,
      if (nameEn != $none) #nameEn: nameEn,
      if (active != $none) #active: active,
    }),
  );
  @override
  LegalSpecializationModel $make(CopyWithData data) => LegalSpecializationModel(
    id: data.get(#id, or: $value.id),
    nameAr: data.get(#nameAr, or: $value.nameAr),
    nameEn: data.get(#nameEn, or: $value.nameEn),
    active: data.get(#active, or: $value.active),
  );

  @override
  LegalSpecializationModelCopyWith<$R2, LegalSpecializationModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _LegalSpecializationModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

