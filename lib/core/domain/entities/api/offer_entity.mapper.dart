// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'offer_entity.dart';

class OfferEntityMapper extends ClassMapperBase<OfferEntity> {
  OfferEntityMapper._();

  static OfferEntityMapper? _instance;
  static OfferEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OfferEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'OfferEntity';

  static int? _$language(OfferEntity v) => v.language;
  static const Field<OfferEntity, int> _f$language = Field(
    'language',
    _$language,
    opt: true,
  );
  static int? _$no(OfferEntity v) => v.no;
  static const Field<OfferEntity, int> _f$no = Field('no', _$no, opt: true);
  static String? _$link(OfferEntity v) => v.link;
  static const Field<OfferEntity, String> _f$link = Field(
    'link',
    _$link,
    opt: true,
  );
  static String? _$desc(OfferEntity v) => v.desc;
  static const Field<OfferEntity, String> _f$desc = Field(
    'desc',
    _$desc,
    opt: true,
  );
  static String? _$name(OfferEntity v) => v.name;
  static const Field<OfferEntity, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$title(OfferEntity v) => v.title;
  static const Field<OfferEntity, String> _f$title = Field(
    'title',
    _$title,
    opt: true,
  );

  @override
  final MappableFields<OfferEntity> fields = const {
    #language: _f$language,
    #no: _f$no,
    #link: _f$link,
    #desc: _f$desc,
    #name: _f$name,
    #title: _f$title,
  };
  @override
  final bool ignoreNull = true;

  static OfferEntity _instantiate(DecodingData data) {
    return OfferEntity(
      language: data.dec(_f$language),
      no: data.dec(_f$no),
      link: data.dec(_f$link),
      desc: data.dec(_f$desc),
      name: data.dec(_f$name),
      title: data.dec(_f$title),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static OfferEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OfferEntity>(map);
  }

  static OfferEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<OfferEntity>(json);
  }
}

mixin OfferEntityMappable {
  String toJsonString() {
    return OfferEntityMapper.ensureInitialized().encodeJson<OfferEntity>(
      this as OfferEntity,
    );
  }

  Map<String, dynamic> toJson() {
    return OfferEntityMapper.ensureInitialized().encodeMap<OfferEntity>(
      this as OfferEntity,
    );
  }

  OfferEntityCopyWith<OfferEntity, OfferEntity, OfferEntity> get copyWith =>
      _OfferEntityCopyWithImpl<OfferEntity, OfferEntity>(
        this as OfferEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return OfferEntityMapper.ensureInitialized().stringifyValue(
      this as OfferEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return OfferEntityMapper.ensureInitialized().equalsValue(
      this as OfferEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return OfferEntityMapper.ensureInitialized().hashValue(this as OfferEntity);
  }
}

extension OfferEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OfferEntity, $Out> {
  OfferEntityCopyWith<$R, OfferEntity, $Out> get $asOfferEntity =>
      $base.as((v, t, t2) => _OfferEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class OfferEntityCopyWith<$R, $In extends OfferEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? language,
    int? no,
    String? link,
    String? desc,
    String? name,
    String? title,
  });
  OfferEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OfferEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OfferEntity, $Out>
    implements OfferEntityCopyWith<$R, OfferEntity, $Out> {
  _OfferEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OfferEntity> $mapper =
      OfferEntityMapper.ensureInitialized();
  @override
  $R call({
    Object? language = $none,
    Object? no = $none,
    Object? link = $none,
    Object? desc = $none,
    Object? name = $none,
    Object? title = $none,
  }) => $apply(
    FieldCopyWithData({
      if (language != $none) #language: language,
      if (no != $none) #no: no,
      if (link != $none) #link: link,
      if (desc != $none) #desc: desc,
      if (name != $none) #name: name,
      if (title != $none) #title: title,
    }),
  );
  @override
  OfferEntity $make(CopyWithData data) => OfferEntity(
    language: data.get(#language, or: $value.language),
    no: data.get(#no, or: $value.no),
    link: data.get(#link, or: $value.link),
    desc: data.get(#desc, or: $value.desc),
    name: data.get(#name, or: $value.name),
    title: data.get(#title, or: $value.title),
  );

  @override
  OfferEntityCopyWith<$R2, OfferEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _OfferEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

