// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'case_attachment_entity.dart';

class CaseAttachmentEntityMapper extends ClassMapperBase<CaseAttachmentEntity> {
  CaseAttachmentEntityMapper._();

  static CaseAttachmentEntityMapper? _instance;
  static CaseAttachmentEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CaseAttachmentEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CaseAttachmentEntity';

  static int? _$id(CaseAttachmentEntity v) => v.id;
  static const Field<CaseAttachmentEntity, int> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static String? _$url(CaseAttachmentEntity v) => v.url;
  static const Field<CaseAttachmentEntity, String> _f$url = Field(
    'url',
    _$url,
    opt: true,
  );
  static String? _$fileName(CaseAttachmentEntity v) => v.fileName;
  static const Field<CaseAttachmentEntity, String> _f$fileName = Field(
    'fileName',
    _$fileName,
    opt: true,
  );
  static String? _$mimeType(CaseAttachmentEntity v) => v.mimeType;
  static const Field<CaseAttachmentEntity, String> _f$mimeType = Field(
    'mimeType',
    _$mimeType,
    opt: true,
  );
  static int? _$sizeBytes(CaseAttachmentEntity v) => v.sizeBytes;
  static const Field<CaseAttachmentEntity, int> _f$sizeBytes = Field(
    'sizeBytes',
    _$sizeBytes,
    opt: true,
  );

  @override
  final MappableFields<CaseAttachmentEntity> fields = const {
    #id: _f$id,
    #url: _f$url,
    #fileName: _f$fileName,
    #mimeType: _f$mimeType,
    #sizeBytes: _f$sizeBytes,
  };
  @override
  final bool ignoreNull = true;

  static CaseAttachmentEntity _instantiate(DecodingData data) {
    return CaseAttachmentEntity(
      id: data.dec(_f$id),
      url: data.dec(_f$url),
      fileName: data.dec(_f$fileName),
      mimeType: data.dec(_f$mimeType),
      sizeBytes: data.dec(_f$sizeBytes),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CaseAttachmentEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CaseAttachmentEntity>(map);
  }

  static CaseAttachmentEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<CaseAttachmentEntity>(json);
  }
}

mixin CaseAttachmentEntityMappable {
  String toJsonString() {
    return CaseAttachmentEntityMapper.ensureInitialized()
        .encodeJson<CaseAttachmentEntity>(this as CaseAttachmentEntity);
  }

  Map<String, dynamic> toJson() {
    return CaseAttachmentEntityMapper.ensureInitialized()
        .encodeMap<CaseAttachmentEntity>(this as CaseAttachmentEntity);
  }

  CaseAttachmentEntityCopyWith<
    CaseAttachmentEntity,
    CaseAttachmentEntity,
    CaseAttachmentEntity
  >
  get copyWith =>
      _CaseAttachmentEntityCopyWithImpl<
        CaseAttachmentEntity,
        CaseAttachmentEntity
      >(this as CaseAttachmentEntity, $identity, $identity);
  @override
  String toString() {
    return CaseAttachmentEntityMapper.ensureInitialized().stringifyValue(
      this as CaseAttachmentEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return CaseAttachmentEntityMapper.ensureInitialized().equalsValue(
      this as CaseAttachmentEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return CaseAttachmentEntityMapper.ensureInitialized().hashValue(
      this as CaseAttachmentEntity,
    );
  }
}

extension CaseAttachmentEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CaseAttachmentEntity, $Out> {
  CaseAttachmentEntityCopyWith<$R, CaseAttachmentEntity, $Out>
  get $asCaseAttachmentEntity => $base.as(
    (v, t, t2) => _CaseAttachmentEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class CaseAttachmentEntityCopyWith<
  $R,
  $In extends CaseAttachmentEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? id,
    String? url,
    String? fileName,
    String? mimeType,
    int? sizeBytes,
  });
  CaseAttachmentEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CaseAttachmentEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CaseAttachmentEntity, $Out>
    implements CaseAttachmentEntityCopyWith<$R, CaseAttachmentEntity, $Out> {
  _CaseAttachmentEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CaseAttachmentEntity> $mapper =
      CaseAttachmentEntityMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    Object? url = $none,
    Object? fileName = $none,
    Object? mimeType = $none,
    Object? sizeBytes = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (url != $none) #url: url,
      if (fileName != $none) #fileName: fileName,
      if (mimeType != $none) #mimeType: mimeType,
      if (sizeBytes != $none) #sizeBytes: sizeBytes,
    }),
  );
  @override
  CaseAttachmentEntity $make(CopyWithData data) => CaseAttachmentEntity(
    id: data.get(#id, or: $value.id),
    url: data.get(#url, or: $value.url),
    fileName: data.get(#fileName, or: $value.fileName),
    mimeType: data.get(#mimeType, or: $value.mimeType),
    sizeBytes: data.get(#sizeBytes, or: $value.sizeBytes),
  );

  @override
  CaseAttachmentEntityCopyWith<$R2, CaseAttachmentEntity, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CaseAttachmentEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

