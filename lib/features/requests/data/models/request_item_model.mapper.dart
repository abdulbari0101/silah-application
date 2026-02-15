// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'request_item_model.dart';

class RequestItemModelMapper extends ClassMapperBase<RequestItemModel> {
  RequestItemModelMapper._();

  static RequestItemModelMapper? _instance;
  static RequestItemModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RequestItemModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RequestItemModel';

  static String? _$name(RequestItemModel v) => v.name;
  static const Field<RequestItemModel, String> _f$name = Field(
    'name',
    _$name,
    key: r'NAME',
    opt: true,
  );

  @override
  final MappableFields<RequestItemModel> fields = const {#name: _f$name};
  @override
  final bool ignoreNull = true;

  static RequestItemModel _instantiate(DecodingData data) {
    return RequestItemModel(name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static RequestItemModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RequestItemModel>(map);
  }

  static RequestItemModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<RequestItemModel>(json);
  }
}

mixin RequestItemModelMappable {
  String toJsonString() {
    return RequestItemModelMapper.ensureInitialized()
        .encodeJson<RequestItemModel>(this as RequestItemModel);
  }

  Map<String, dynamic> toJson() {
    return RequestItemModelMapper.ensureInitialized()
        .encodeMap<RequestItemModel>(this as RequestItemModel);
  }

  RequestItemModelCopyWith<RequestItemModel, RequestItemModel, RequestItemModel>
  get copyWith =>
      _RequestItemModelCopyWithImpl<RequestItemModel, RequestItemModel>(
        this as RequestItemModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RequestItemModelMapper.ensureInitialized().stringifyValue(
      this as RequestItemModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return RequestItemModelMapper.ensureInitialized().equalsValue(
      this as RequestItemModel,
      other,
    );
  }

  @override
  int get hashCode {
    return RequestItemModelMapper.ensureInitialized().hashValue(
      this as RequestItemModel,
    );
  }
}

extension RequestItemModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RequestItemModel, $Out> {
  RequestItemModelCopyWith<$R, RequestItemModel, $Out>
  get $asRequestItemModel =>
      $base.as((v, t, t2) => _RequestItemModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RequestItemModelCopyWith<$R, $In extends RequestItemModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name});
  RequestItemModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _RequestItemModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RequestItemModel, $Out>
    implements RequestItemModelCopyWith<$R, RequestItemModel, $Out> {
  _RequestItemModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RequestItemModel> $mapper =
      RequestItemModelMapper.ensureInitialized();
  @override
  $R call({Object? name = $none}) =>
      $apply(FieldCopyWithData({if (name != $none) #name: name}));
  @override
  RequestItemModel $make(CopyWithData data) =>
      RequestItemModel(name: data.get(#name, or: $value.name));

  @override
  RequestItemModelCopyWith<$R2, RequestItemModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RequestItemModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

