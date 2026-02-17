// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'request_item_entity.dart';

class RequestItemEntityMapper extends ClassMapperBase<RequestItemEntity> {
  RequestItemEntityMapper._();

  static RequestItemEntityMapper? _instance;
  static RequestItemEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RequestItemEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RequestItemEntity';

  static String? _$name(RequestItemEntity v) => v.name;
  static const Field<RequestItemEntity, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );

  @override
  final MappableFields<RequestItemEntity> fields = const {#name: _f$name};
  @override
  final bool ignoreNull = true;

  static RequestItemEntity _instantiate(DecodingData data) {
    return RequestItemEntity(name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static RequestItemEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RequestItemEntity>(map);
  }

  static RequestItemEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<RequestItemEntity>(json);
  }
}

mixin RequestItemEntityMappable {
  String toJsonString() {
    return RequestItemEntityMapper.ensureInitialized()
        .encodeJson<RequestItemEntity>(this as RequestItemEntity);
  }

  Map<String, dynamic> toJson() {
    return RequestItemEntityMapper.ensureInitialized()
        .encodeMap<RequestItemEntity>(this as RequestItemEntity);
  }

  RequestItemEntityCopyWith<
    RequestItemEntity,
    RequestItemEntity,
    RequestItemEntity
  >
  get copyWith =>
      _RequestItemEntityCopyWithImpl<RequestItemEntity, RequestItemEntity>(
        this as RequestItemEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RequestItemEntityMapper.ensureInitialized().stringifyValue(
      this as RequestItemEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return RequestItemEntityMapper.ensureInitialized().equalsValue(
      this as RequestItemEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return RequestItemEntityMapper.ensureInitialized().hashValue(
      this as RequestItemEntity,
    );
  }
}

extension RequestItemEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RequestItemEntity, $Out> {
  RequestItemEntityCopyWith<$R, RequestItemEntity, $Out>
  get $asRequestItemEntity => $base.as(
    (v, t, t2) => _RequestItemEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class RequestItemEntityCopyWith<
  $R,
  $In extends RequestItemEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name});
  RequestItemEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _RequestItemEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RequestItemEntity, $Out>
    implements RequestItemEntityCopyWith<$R, RequestItemEntity, $Out> {
  _RequestItemEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RequestItemEntity> $mapper =
      RequestItemEntityMapper.ensureInitialized();
  @override
  $R call({Object? name = $none}) =>
      $apply(FieldCopyWithData({if (name != $none) #name: name}));
  @override
  RequestItemEntity $make(CopyWithData data) =>
      RequestItemEntity(name: data.get(#name, or: $value.name));

  @override
  RequestItemEntityCopyWith<$R2, RequestItemEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RequestItemEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

