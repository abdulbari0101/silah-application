// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'offer_model.dart';

class OfferModelMapper extends ClassMapperBase<OfferModel> {
  OfferModelMapper._();

  static OfferModelMapper? _instance;
  static OfferModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OfferModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'OfferModel';

  static int? _$language(OfferModel v) => v.language;
  static const Field<OfferModel, int> _f$language = Field(
    'language',
    _$language,
    opt: true,
  );
  static int? _$no(OfferModel v) => v.no;
  static const Field<OfferModel, int> _f$no = Field(
    'no',
    _$no,
    key: r'NO',
    opt: true,
  );
  static String? _$link(OfferModel v) => v.link;
  static const Field<OfferModel, String> _f$link = Field(
    'link',
    _$link,
    key: r'LINK',
    opt: true,
  );
  static String? _$desc(OfferModel v) => v.desc;
  static const Field<OfferModel, String> _f$desc = Field(
    'desc',
    _$desc,
    key: r'DESC',
    opt: true,
  );
  static String? _$name(OfferModel v) => v.name;
  static const Field<OfferModel, String> _f$name = Field(
    'name',
    _$name,
    key: r'NAME',
    opt: true,
  );
  static String? _$title(OfferModel v) => v.title;
  static const Field<OfferModel, String> _f$title = Field(
    'title',
    _$title,
    key: r'TITLE',
    opt: true,
  );

  @override
  final MappableFields<OfferModel> fields = const {
    #language: _f$language,
    #no: _f$no,
    #link: _f$link,
    #desc: _f$desc,
    #name: _f$name,
    #title: _f$title,
  };
  @override
  final bool ignoreNull = true;

  static OfferModel _instantiate(DecodingData data) {
    return OfferModel(
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

  static OfferModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OfferModel>(map);
  }

  static OfferModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<OfferModel>(json);
  }
}

mixin OfferModelMappable {
  String toJsonString() {
    return OfferModelMapper.ensureInitialized().encodeJson<OfferModel>(
      this as OfferModel,
    );
  }

  Map<String, dynamic> toJson() {
    return OfferModelMapper.ensureInitialized().encodeMap<OfferModel>(
      this as OfferModel,
    );
  }

  OfferModelCopyWith<OfferModel, OfferModel, OfferModel> get copyWith =>
      _OfferModelCopyWithImpl<OfferModel, OfferModel>(
        this as OfferModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return OfferModelMapper.ensureInitialized().stringifyValue(
      this as OfferModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return OfferModelMapper.ensureInitialized().equalsValue(
      this as OfferModel,
      other,
    );
  }

  @override
  int get hashCode {
    return OfferModelMapper.ensureInitialized().hashValue(this as OfferModel);
  }
}

extension OfferModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OfferModel, $Out> {
  OfferModelCopyWith<$R, OfferModel, $Out> get $asOfferModel =>
      $base.as((v, t, t2) => _OfferModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class OfferModelCopyWith<$R, $In extends OfferModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? language,
    int? no,
    String? link,
    String? desc,
    String? name,
    String? title,
  });
  OfferModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OfferModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OfferModel, $Out>
    implements OfferModelCopyWith<$R, OfferModel, $Out> {
  _OfferModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OfferModel> $mapper =
      OfferModelMapper.ensureInitialized();
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
  OfferModel $make(CopyWithData data) => OfferModel(
    language: data.get(#language, or: $value.language),
    no: data.get(#no, or: $value.no),
    link: data.get(#link, or: $value.link),
    desc: data.get(#desc, or: $value.desc),
    name: data.get(#name, or: $value.name),
    title: data.get(#title, or: $value.title),
  );

  @override
  OfferModelCopyWith<$R2, OfferModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _OfferModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

